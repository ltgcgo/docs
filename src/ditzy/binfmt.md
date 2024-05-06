# Binary encoding format
## Concepts
### Meek
Originally, Meek is a technique emulating stateful connections over HTTP, utilized by Tor for its pluggable transports. It is now generalized to refer to any technique reconstructing stateful connections, regardless of the statefulness of underlying transport.

### MIDI
MIDI is a standard for real-time communication between devices. It's originally designed for musical instruments, but has found its places in other fields requiring synchronization and/or automation as well, such as stage lighting systems.

### Variable Length Value
Variable Length Value (VLV) is a way of encoding integer values to multiple bytes, utilizing as many bits inside as they want. With VLV, integer values can be as large as they want.

VLV is defined as a part of Standard MIDI File (SMF) Format Specification.

A VLV can take multiple bytes, and all data encoded are stored in Big-Endian format. VLV bytes use the bit before actual values of each byte to indicate whether or not to continue decoding, and the rest to carry actual values.

Examples below.

| Bits | Value (hex) | Value (binary) | VLV (binary) | VLV (hex) |
| ---- | ----------- | -------------- | ------------ | --------- |
| 7    | `43` | `01000011` | `01000011` | `43` |
| 6    | `43` | `01000011` | `01000001 00000011` | `4103` |
| 7    | `1c57` | `00011100`<br/>`01010111` | `10111000`<br/>`01010111` | `b857` |
| 7    | `ad41296` | `00001010`<br/>`11010100`<br/>`00010010`<br/>`10010110` | `11010110`<br/>`11010000`<br/>`10100101`<br/>`00010110` | `d6d0a516` |

### QUIC
QUIC is a general-purpose transport running on top of UDP, seeking to be a replacement over traditional TCP. It offers various advantages over traditional TCP, with the most notable ones being seamless connection migration and reduced communication latency.

## Specification
### Structure
Each Ditzy message is formed by directly combining multiple frames together. The structure of each frame is as follows.

| Length | Value | Description |
| ------ | ----- | ----------- |
| 1 | [#Commands](#commands) | Command ID |
| 1~4 | (7-bit VLV) | Socket ID |
| 1~4 | (7-bit VLV) | Frame ID |
| 1+ | (7-bit VLV) | KORG87 payload length |
| 0+ | (any) | KORG87 payload data |
| 1 | byte | End of payload + Data checksum |

### Socket ID
The socket ID is randomly selected between `0` and `268435455` (`0xfffffff`, 2<sup>28</sup> - 1).

### Frame ID
The frame ID is iterated from `0` to `268435455` (`0xfffffff`, 2<sup>28</sup> - 1) on the side where connections are initiated. When `268435455` is reached, the message ID is expected to roll back to `0`. Frame ID should only validated and increased when a message is fully sent.

### Length, EoP + Checksum
When Ditzy is set to fast mode (should only be used in safe environments), the payload length value only points to where the EoP byte is located. The EoP byte in fast mode only serves as a confirmation for bounds checking, and thus both sides should only select a random byte that has the 7th bit set to 1 (128~255) to do the job. When the supposed length doesn't match, Ditzy will try to search for bytes exceeding 127 from the beginning, and truncate the message accordingly.

When Ditzy is set to strict mode, the payload length value is ignored, and Ditzy will attempt to validate the checksum once it finds the EoP byte. If the checksum does not match, Ditzy will discard the message completely.

The checksum is calculated by setting the initial value to 63, and performing XOR operations to every byte in the payload. Once this is finished, the calculated value is then inverted, have `1` added. The final value would the the first 7 bits of the value. Example JavaScript code below.

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

Different commands have different support levels. To meet a certain support level, features of the indicated level  must be implemented.

| ID | Command | Level |
| -- | ------- | ----- |
| 0  | Socket close | 1 |
| 1  | Socket open | 1 |
| 2  | Socket aftertouch | 1 |
| 3  | Jump | 1 |
| 4  | Full message send | 1 |
| 5  | Message acknowledge | 2 |
| 6  | Error | 2 |
| 7  | Set client ID | 1 |
| 8  | Implementation exclusive | 3 |
| 9  | Partial message send | 3 |
| 10 | Partial message send complete | 3 |

#### `0`: Socket close
> Can be initiated bidirectionally.
> 
> Response should be exactly the same as request.

Closes a connection. Payload can be used to carry optional arbitrary error messages.

#### `1`: Socket open
> Can be initiated bidirectionally.
> 
> Response should have the same frame ID as request.

Opens a connection. Payload is used to define suggested Socket timeout in milliseconds optionally. Frame ID must be set to `0`.

(Optional) If sent from the receiving end, the value contains would be the final timeout value used in the connection.

#### `2`: Socket aftertouch
> Can be initiated bidirectionally.
> 
> Response should have the same frame ID as request. Frame ID has no effect otherwise.

Challenges a connection. Often used to implement Socket latency tests.

Payload sets challenge type.

##### Types
* `0`: Latency test SYN1.
* `1`: Latency test ACK1.
* `2`: Latency test SYN2.
* `3`: Latency test ACK2.

#### `3`: Jump
> Can be initiated bidirectionally.
> 
> No responses are needed for jumps. Frame ID has no effect.

Sends a junk frame. The receiving end should ignore jump messages.

#### `4`: Full message send
> Can be initiated bidirectionally.
> 
> Use type 5 (message acknowledge) to send acknowledgements with the same frame ID.

Sends a full message.

#### `5`: Message acknowledge
> Can be initiated bidirectionally. Only required over unreliable channels.

Sends acknowledgements of messages. Additional acknowledgements of tail frame IDs are all encoded via VLV7.

#### `6`: Error
> Can be initiated bidirectionally.
> 
> No response is needed for errors. Frame ID has no effect.

Sends arbitrary errors without closing the connection.

#### `7`: Set client ID
> Can only be sent from clients. No responses from the server whatsoever.

Sets a request of Ditzy message to a client ID. Client IDs are random 16-char Base64-like sequences that are never decoded. This **must** be the first message in every Ditzy request.

#### `8`: Implementation exclusive
> Can be initiated bidirectionally.
> 
> Response should have the same frame ID as request. Frame ID has no effect otherwise.

Implementation exclusive binary commands.