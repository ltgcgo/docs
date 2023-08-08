# Events, CC and RPN
## Events
### Assembly
Except System Exclusive messages, the first byte of each MIDI event defines the event type and target channel. The first four bits define the event type, with the last four bits defining the target channel.

#### Types
| ID# | ID    | Type                     |
| --- | ----- | ------------------------ |
| 8   | `0x8` | Note off                 |
| 9   | `0x9` | Note on                  |
| 10  | `0xa` | Note aftertouch (PAT)    |
| 11  | `0xb` | Control change           |
| 12  | `0xc` | Program change           |
| 13  | `0xd` | Channel aftertouch (CAT) |
| 14  | `0xe` | Pitch bend               |
| 15  | `0xf` | System messages          |

#### System message types
| ID# | ID     | Type                                  | Optional |
| --- | ------ | ------------------------------------- | -------- |
| 240 | `0xf0` | System Exclusive (Start of Exclusive) | No       |
| 247 | `0xf7` | System Exclusive (End of Exclusive)   | No       |
| 248 | `0xf8` | Clock                                 | Yes      |
| 250 | `0xfa` | Start                                 | Yes      |
| 251 | `0xfb` | Continue                              | Yes      |
| 252 | `0xfc` | Stop                                  | Yes      |
| 254 | `0xfe` | Active sensing                        | Yes      |
| 255 | `0xff` | (Line invalid) Meta events            | No       |

### Types

## Control Changes
### Mapping
#### Data
| ID# | ID     | Type            | Range | Optional |
| --- | ------ | --------------- | ----- | -------- |
| 0   | `0x00` | MSB Bank Select | 0-127 | No       |
| 32  | `0x20` | LSB Bank Select | 0-127 | No       |
| 6   | `0x06` | MSB Data Commit | 0-127 | No       |
| 38  | `0x26` | LSB Data Commit | 0-127 | No       |
| 98  | `0x62` | LSB NRPN        | 0-127 | No       |
| 99  | `0x63` | MSB NRPN        | 0-127 | No       |
| 100 | `0x64` | LSB RPN         | 0-127 | No       |
| 101 | `0x65` | MSB RPN         | 0-127 | No       |
| 96  | `0x60` | RPN Increase    | 0-127 | No       |
| 97  | `0x61` | RPN Decrease    | 0-127 | No       |

#### Voice
| ID# | ID     | Type               | Range | Optional |
| --- | ------ | -----------------  | ----- | -------- |
| 1   | `0x01` | Modulation         | 0-127 | No       |
| 5   | `0x05` | Portamento Time    | 0-127 | No       |
| 7   | `0x07` | Volume             | 0-127 | No       |
| 10  | `0x0a` | Pan                | 0-127 | No       |
| 11  | `0x0b` | Expression         | 0-127 | No       |
| 64  | `0x40` | Sustain (Hold)     | 0-127 | No       |
| 65  | `0x41` | Portamento Switch  | 0-127 | No       |
| 66  | `0x42` | Sostenuto          | 0-127 | No       |
| 67  | `0x43` | Soft Pedal         | 0-127 | No       |
| 71  | `0x47` | Resonance          | 0-127 | No       |
| 72  | `0x48` | Release Time       | 0-127 | No       |
| 73  | `0x49` | Attack Time        | 0-127 | No       |
| 74  | `0x4a` | Brightness         | 0-127 | No       |
| 75  | `0x4b` | Decay Time         | 0-127 | Yes      |
| 76  | `0x4c` | Vibrato Rate       | 0-127 | Yes      |
| 77  | `0x4d` | Vibrato Depth      | 0-127 | Yes      |
| 78  | `0x4e` | Vibrato Delay      | 0-127 | Yes      |
| 84  | `0x54` | Portamento Source  | 0-127 | No       |
| 91  | `0x5b` | Effect (Reverb)    | 0-127 | No       |
| 92  | `0x5c` | Effect (Tremelo)   | 0-127 | Yes      |
| 93  | `0x5d` | Effect (Chorus)    | 0-127 | No       |
| 94  | `0x5e` | Effect (Variation) | 0-127 | No       |
| 95  | `0x5f` | Effect (Phaser)    | 0-127 | No       |

### Modes
| ID# | ID     | Type                  | Range | Optional |
| --- | ------ | --------------------- | ----- | -------- |
| 120 | `0x78` | All Sound Off         | 0     | No       |
| 121 | `0x79` | Reset All Controllers | 0     | No       |
| 123 | `0x7b` | All Note Off          | 0     | No       |
| 124 | `0x7c` | Omni Off              | 0     | Yes      |
| 125 | `0x7d` | Omni On               | 0     | Yes      |
| 126 | `0x7e` | Mono                  | 0-16  | No       |
| 127 | `0x7f` | Poly                  | 0     | No       |

### Types

## Registered Parameter Numbers

## Non-registered Parameter Numbers
> **Warning**
> 
> This section is optional.