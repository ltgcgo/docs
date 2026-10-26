# Impulse Tracker
> See also: [Tracker](../../spec/tmod/), [generalised terms](../../spec/tmod/#generalised-terms)

Impulse Tracker Module (`.it`) is the file format used to store modules by Impulse Tracker. A `.it` file contains data regarding but not limited to patterns, pattern sequence order, oscillators, etc. Like most classic tracker module formats, `.it` files are self-contained.

[Impulse Tracker](https://en.wikipedia.org/wiki/Impulse_Tracker) was a proprietary music tracker developed by Jeffery Lim for the DOS platform, with its last version released back in 1999, and since becoming abandonware. It was [made open-source](https://github.com/jthlim/impulse-tracker) in 2014. [Schism Tracker](https://schismtracker.org) is an up-to-date, open-source, and cross-platform re-implementation of Impulse Tracker.

The `.it` file format implementation in MICC follows the Schism Tracker, only falling back to _Open_ ModPlug Tracker for features unavailable in the Schism Tracker.

## Fields
### Header fields
> See also: [Meta fields](../../spec/tmod/#meta-fields)

| Generalised Name          | Impulse / Schism             | ModPlug | Type |
| ------------------------- | ---------------------------- | ------- | ---- |
| Sequence name             | Song name                    | ←       | `u8[26]` |
| **Time signature hints**  | Pattern highlight            | ←       | ↓ `u8[2]` |
| _Rows per beat_           | ←                            | ←       | `u8` |
| _Rows per measure_        | ←                            | ←       | `u8` |
| Sequence order count      | Order number                 | ←       | `u16le` |
| Instrument count          | Instrument number            | ←       | `u16le` |
| Oscillator count          | Sample number                | ←       | `u16le` |
| Pattern count             | Pattern number               | ←       | `u16le` |
| Created version           | Created with version         | ←       | `u16le` |
| Compatible version        | Compatible with version      | ←       | `u16le` |
| **Basic flags**           | Flag                         | ←       | ↓ `bool[16]` |
| _Toggle stereo_           | Flag (stereo)                | ←       | `bool` |
| _Toggle mixing₂_          | Flag (mixing)                | ←       | `bool` |
| _Voice type_              | Flag (instrument/sample)     | ←       | `bool` |
| _Slide type_              | Flag (linear slide)          | ←       | `bool` |
| _Legacy controls₁_        | Flag (old effects)           | ←       | `bool` |
| _Linked portamento_       | Flag (link G with E & F)     | ←       | `bool` |
| _MIDI controlled pitch₂_  | Flag (MIDI pitch controlled) | ←       | `bool` |
| _Request MIDI macros_     | Flag (request MIDI macros)   | ←       | `bool` |
| _Extended filter range_   |         | Flag (extended filter range) | `bool` |
| **Existence hint flags**  | Special                      | ←       | ↓ `bool[16]` |
| _Has song message_        | Special (song message)       | ←       | `bool` |
| _Has edit history_        | Special (edit history)       | ←       | `bool` |
| _Has embedded highlight₂_ | Special (embedded highlight) | ←       | `bool` |
| _Has MIDI macro_          | Special (embed MIDI macro)   | ←       | `bool` |
| Master volume             | Global volume                | ←       | `u8` |
| Oscillator volume         | Mix volume             | Sample Volume | `u8` |
| Initial TPR₃              | Initial speed                   | TPR₃ | `u8` |
| Initial tempo             | ←                            | ←       | `u8` |
| Pan separation            | ←                            | ←       | `u8` |
| Pitch bend range          | Pitch wheel depth            | ?       | `u8` |
| Message size              | Message length               | ←       | `u16le` |
| Message offset            | ←                            | ←       | `u32le` |
| Reserved                  | ←                            | ←       | `u32le` |
| Initial slot panpot       | Initial channel pan          | ?       | `u8[64]` |
| Initial slot loudness₄    | Initial channel volume       | ?       | `u8[64]` |
| Sequence order            | Orders                      | Sequence | `u8[]` |
| Instrument offsets        | ←                            | ←       | `u32le[]` |
| Oscillator offsets        | Sample offsets               | ←       | `u32le[]` |
| Pattern offsets           | ←                            | ←       | `u32le[]` |

1. Tracker effects are called "controls" in Octavia to signify their relations with MIDI control changes.
2. These fields do not have their uses clearly known.
3. TPR: ticks per row.
4. Can be remapped to cc7, cc11 or note velocity/pressure.

## Sources
- [File format: Impulse Tracker](https://fileformats.fandom.com/wiki/Impulse_tracker)
- [Manual: Effect Reference](https://wiki.openmpt.org/Manual:_Effect_Reference)
