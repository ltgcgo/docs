# Tracker Modules
## Generalised terms
| Tracker | Generalised |
| ------- | ----------- |
| Channel | (Oscillator) slot |
| Effect (slot) | Control (slot) |
| Volume slot | Envelope slot |

## Meta fields
| Generalised Name        | MICC IT Default |
| ----------------------- | ------------ |
| Sequence name           | `Untitled Sequence` |
| Time signature hints    | ↓ |
| Rows per beat           | `0x04` |
| Rows per measure        | `0x10` |
| Sequence order count    | `0x02` (follows Schism) |
| Instrument count        | `0x00` |
| Oscillator count        | `0x00` |
| Pattern count           | `0x00` () |
| Created version         | `0x4C4F`LE (`LO`, **L**ightingale **O**ctavia) |
| Compatible version      | `0x0214`LE (follows Schism) |
| Basic flags             | ↓ |
| Use stereo              | `true` |
| Use mixing₂             | `false` (obsolete field) |
| Voice type              | `false` (sample) |
| Slide type              | `true` |
| Legacy controls₁        | `false` |
| Linked portamento       | `false` |
| MIDI controlled pitch₂  | `true` |
| Request MIDI macros     | `false` |
| Extended filter range   | `false` |
| Existence hint flags    | ↓ |
| Has song message        | `false` |
| Has edit history        | `false` (`true` for Schism and ModPlug) |
| Has embedded highlight₂ | `true` |
| Has MIDI macro          | `false` |
| Master volume           | `0x80` (100%) |
| Oscillator volume       | `0x30` (37.5%) |
| Initial TPR₃            | `0x06` |
| Initial tempo           | `0x7D` (125 BPM) |
| Pan separation          | `0x80` (100%) |
| Pitch bend range        | `0x0C` (12 semitones/1 octave; `0` for ModPlug)
| Message size            | `0x0000`LE |
| Message offset          | `0x0000`LE |
| Reserved                | `0x4D494343`BE (`MICC`; `0x16160000` for Schism, `0x4F4D5054` for ModPlug) |
| Initial slot panpot     | `0x20`×64 (centre) |
| Initial slot loudness₄  | `0x40`×64 (100%) |
| Sequence order          | `FF FF` (end end; follows Schism) |
| Instrument offsets      | (blank) |
| Oscillator offsets      | (blank) |
| Pattern offsets         | `0x00000000`LE |

1. Tracker effects are called "controls" in Octavia to signify their relations with MIDI control changes.
2. These fields do not have their uses clearly known.
3. TPR: ticks per row.
4. Can be remapped to cc7, cc11 or note velocity/pressure.

## Sources
- [File format: Impulse Tracker](https://fileformats.fandom.com/wiki/Impulse_tracker)
- [Manual: Effect Reference](https://wiki.openmpt.org/Manual:_Effect_Reference)
