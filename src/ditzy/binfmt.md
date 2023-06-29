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
| 1~7 | (7-bit VLV) | Connection ID |
| 1~4 | (7-bit VLV) | Frame ID |
| 1+ | (7-bit VLV) | Payload length |
| 0+ | (any) | Payload data |

### Connection ID
The connection ID is randomly selected between `0` and `281474976710655` (`0xffffffffffff`, 2<sup>48</sup> - 1).

### Frame ID
The frame ID is iterated from `0` to `268435455` (`0xfffffff`, 2<sup>28</sup> - 1) on the side where connections are initiated. When `268435455` is reached, the message ID is expected to roll back to `0`.

### Commands
IDs between `0` (`0x00`) and `31` (`0x1f`) are reserved for core functionalities. Extenstions are free to utilize any ID between `32` (`0x20`) and `255` (`0xff`).

| ID | Command |
| -- | ------- |
| 0 | Connection close |
| 1 | Connection open |
| 2 | Connection aftertouch |
| 3 | Jump |
| 4 | Full message send |
| 5 | Message acknowlege |
| 6 | Error |
| 7 | Implementation exclusive |
| 8 | Partial message send |
| 9 | Partial message send complete |