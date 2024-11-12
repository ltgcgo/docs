# Binary encoding format
## Concepts
### Meek
Originally, Meek is a technique emulating stateful connections over HTTP, utilized by Tor for its pluggable transports. It is now generalized to refer to any technique reconstructing stateful connections, regardless of the statefulness of underlying transport.

### MIDI
MIDI is a standard for real-time communication between devices. It's originally designed for musical instruments, but has found its places in other fields requiring synchronization and/or automation as well, such as stage lighting systems. It could be thought of as a protocol of communicating changes about the states of instruments via a set of standardized messages.

### Variable Length Value
Variable Length Value (VLV) is a way of encoding integer values to multiple bytes, utilizing as many bits inside as they want. With VLV, integer values can be as large as they want within reason, and reduce the byte count when the value is smaller with little overhead.

VLV is defined as a part of Standard MIDI File (SMF) Format Specification.

A VLV can take multiple bytes, and all data encoded are stored in Big-Endian format. VLV bytes use the bit before actual values of each byte to indicate whether or not to continue decoding, and the rest to carry actual values.

Examples below.

| Bits | Value (hex) | Value (binary) | VLV (binary) | VLV (hex) |
| ---- | ----------- | -------------- | ------------ | --------- |
| 7    | `43` | `01000011` | `01000011` | `43` |
| 6    | `43` | `01000011` | `01000001 00000011` | `4103` |
| 7    | `1c57` | `00011100`<br/>`01010111` | `10111000`<br/>`01010111` | `b857` |
| 7    | `ad41296` | `00001010`<br/>`11010100`<br/>`00010010`<br/>`10010110` | `11010110`<br/>`11010000`<br/>`10100101`<br/>`00010110` | `d6d0a516` |

### RUDP
RUDP is a general-purpose transport running on top of UDP, designed to achieve guaranteed and ordered packet delivery without the overhead TCP brings. The exact protocol is never documented, but RUDP will always have the following features:

- Acknowledgement of received packets
- Flow control and windowing
- Retransmission of lost packets
- Over-buffering

Ditzy attempts to implement some of the features, optionally with twists:

- Acknowledgement of last received packet IDs in each socket
- Retransmission when messages are considered lost
- Backpressure with customizable buffer/high watermark whenever possible
- Transmit-ahead window whenever possible

### QUIC
QUIC is a general-purpose transport running on top of UDP, seeking to be a replacement over traditional TCP. It offers various advantages over traditional TCP, with the most notable ones being seamless connection migration and reduced communication latency.

Ditzy aims to achieve seamless connection migration via its client ID binding mechanism with minimal connection overhead.

## Specification
### Structure
#### Transmission
```
Client data socket
|
| Ditzy encoder
| |
| | Client transport
| | |
| | | (the state of the outermost transport is unrelated
| | |  to the states of the reconstructed data sockets)
| | v
| | Server transport
| v
| Ditzy decoder
v
Server data socket
```
#### Message
Each Ditzy message is formed by directly combining multiple frames together. The structure of each frame is as follows.

| Length | Value | Description |
| ------ | ----- | ----------- |
| 1 | [#Commands](#commands) | Command ID |
| 1~4 | (7-bit VLV) | Socket ID |
| 1~4 | (7-bit VLV) | Frame ID |
| 1+ | (7-bit VLV) | Payload length |
| 0+ | (any) | Payload data |
| 1 | byte | End of payload + (optional) data checksum |

### Socket ID
The socket ID is randomly selected between `1` and `268435455` (`0xfffffff`, 2<sup>28</sup> - 1).

Socket ID `0` is reserved for special purposes and is forbidden from transmitting any payload. It is used to deliver signals that could affect all connections of the client.

### Frame ID
The frame ID is iterated from `0` to `268435455` (`0xfffffff`, 2<sup>28</sup> - 1) on the side where connections are initiated. When `268435455` is reached, the message ID is expected to roll back to `0`. Frame ID should only be validated and increased in certain commands, check "Step?" to see if they undergo such process.

### Length, EoP + Checksum
When Ditzy is set to fast mode (should only be used in safe environments), the payload length value only points to where the EoP byte is located. The EoP byte in fast mode only serves as a confirmation for bounds checking, and thus both sides should only select a random byte that has the 7th bit set to 0 (0~127) to do the job. When the supposed length doesn't match, Ditzy will discard all messages in the bundle completely in case of a decoration attack.

When Ditzy is set to strict mode, the payload length value is ignored, and Ditzy will attempt to validate the checksum once it finds the EoP byte. If the checksum does not match, Ditzy will discard all messages in the bundle completely in case of a decoration attack.

The checksum is calculated by setting the initial value to 63, and performing XOR operations to every byte in the payload. Once this is finished, the calculated value is then inverted, have `1` added. The final value would the the last 7 bits (`0b0xxxxxxx`) of the value. Example JavaScript code below.

```js
let ditzyChecksum = (bytes) => {
	let checksum = 63;
	for (let i = 0; i < bytes.length; i ++) {
		checksum ^= bytes[i];
	};
	return (~checksum + 1) & 127;
};
```

### Commands
IDs between `0` (`0x00`) and `31` (`0x1f`) are reserved for core functionalities. Extenstions are free to utilize any ID between `32` (`0x20`) and `255` (`0xff`).

Different commands have different support levels. To meet a certain support level, features of the indicated level must be implemented.

| ID | Command | Level | Step? |
| -- | ------- | ----- | ----- |
| 0  | Socket close | 1 | No |
| 1  | Socket open | 1 | No |
| 2  | Socket aftertouch / signalling | 1 | No |
| 3  | Jump | 1 | No |
| 4  | Full payload send | 1 | Yes |
| 5  | Frame acknowledge | 1 | Yes |
| 6  | Error | 2 | No |
| 7  | Implementation exclusive | 2 | No |
| 8  | Partial payload send | 3 | Yes |
| 9  | Partial payload send continue | 3 | Yes |
| 10 | Unordered tailing acknowledgement | 3 | No |

#### `0`: Socket close
> Can be initiated bidirectionally.
> 
> Response should be exactly the same as request.

Closes a single connection. Payload can be used to carry optional arbitrary printable error messages, UTF-8 encoded. Analogous to `8x nn vv` or `9x nn 00`.

#### `1`: Socket open
> Can be initiated bidirectionally.
> 
> Response should have the same frame ID as request.

Opens a connection. Payload is used to define suggested Socket timeout in milliseconds optionally. Frame ID must be set to `0`, or the message will be considered invalid.

(Optional) If sent from the receiving end, the value contains would be the final timeout value used in the connection. Analogous to `9x nn vv`.

#### `2`: Socket aftertouch/signalling
> Can be initiated bidirectionally.
> 
> Response should have the same frame ID as request.

Challenges a connection. Often used to implement socket latency tests. Analogous to `cx vv`.

Payload sets challenge type.

##### Types of aftertouch
* `0`: Latency test SYN1.
* `1`: Latency test ACK1.
* `2`: Latency test SYN2.
* `3`: Latency test ACK2.

##### Types of signalling
* `128`: Bind client ID, must be the very first message of every Ditzy connection. Frame ID contains the desired client ID. Each active connection can only have a client bound to an ID once, or the connection will be terminated to prevent flooding. Server response indicates a bound client ID.
* `129`: Client terminate. Frame ID contains the desired client ID, should match the client ID bound to the transmission session. All sockets managed under the provided client ID will be gracefully closed. Server response indicates a successful queue of graceful client termination.
* `130`: Saturated send buffer. Typically sent from the server to the client, this is used to signal the client to establish more connections with the server to help deplete its send buffer.

#### `3`: Jump
> Can be initiated bidirectionally.
> 
> No responses are needed for jumps.

Sends a junk frame. The receiving end should ignore jump messages. Useful to implement noise.

#### `4`: Full payload send
> Can be initiated bidirectionally.
> 
> Use type 5 (payload acknowledge) to send acknowledgements with the same frame ID.

Sends a full message. Analogous to `f0 .. .. f7`.

#### `5`: Frame acknowledge
> Can be initiated bidirectionally. Only required over unreliable channels.

Sends acknowledgement of the last received sequencial frame.

#### `6`: Error
> Can be initiated bidirectionally.
> 
> No response is needed for errors.

Sends arbitrary errors without closing the connection.

#### `7`: Implementation exclusive
> Can be initiated bidirectionally.
> 
> Response should have the same frame ID as request.

Implementation exclusive binary commands. Analogous to `f0 .. .. f7` or `ff .. ..`

#### `8`: Partial payload send
> Can be initiated bidirectionally. Certain underlying transports may disable this.
> 
> Use type 5 (payload acknowledge) to send acknowledgements with the same frame ID.

Sends a segment of a message. Used to begin and continue sending the segments of a full message. The server should begin to interpret "full payload send" messages as "payload send complete" on the same socket. Analogous to `f0 .. ..`.

#### `9`: Partial payload send continue
> Can be initiated bidirectionally. Certain underlying transports may disable this.
> 
> Use type 5 (payload acknowledge) to send acknowledgements with the same frame ID.

Sends the final segment of a message. The server should interpret "full payload send" messages as "payload send complete" on the same socket. Analogous to `f7 .. ..`.

#### `10`: Unordered tailing acknowledgement
> Can be initiated bidirectionally. Only required over unreliable channels.

Sends a list of unordered received frames *after* the last continuously received frame. Used to reduce frame retransmissions when a copy has already been received.