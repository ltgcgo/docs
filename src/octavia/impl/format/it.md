# Impulse Tracker
> See also: [Tracker](../../spec/tmod/), [generalised terms](../../spec/tmod/#generalised-terms)

## Meta fields
| Generalised Name        | Impulse / Schism             | ModPlug |
| ----------------------- | ---------------------------- | ------- |
| Sequence name           | Song name                    | ←       |
| Time signature hints    | Pattern highlight            | ←       |
| Rows per beat           | ←                            | ←       |
| Rows per measure        | ←                            | ←       |
| Sequence order count    | Order number                 | ←       |
| Instrument count        | Instrument number            | ←       |
| Oscillator count        | Sample number                | ←       |
| Pattern count           | Pattern number               | ←       |
| Created version         | Created with version         | ←       |
| Compatible version      | Compatible with version      | ←       |
| Basic flags             | Flag                         | ←       |
| Use stereo              | Flag (stereo)                | ←       |
| Use mixing₂             | Flag (mixing)                | ←       |
| Voice type              | Flag (instrument/sample)     | ←       |
| Slide type              | Flag (linear slide)          | ←       |
| Legacy controls₁        | Flag (old effects)           | ←       |
| Linked portamento       | Flag (link G with E & F)     | ←       |
| MIDI controlled pitch₂  | Flag (MIDI pitch controlled) | ←       |
| Request MIDI macros     | Flag (request MIDI macros)   | ←       |
| Extended filter range   |         | Flag (extended filter range) |
| Existence hint flags    | Special                      | ←       |
| Has song message        | Special (song message)       | ←       |
| Has edit history        | Special (edit history)       | ←       |
| Has embedded highlight₂ | Special (embedded highlight) | ←       |
| Has MIDI macro          | Special (embed MIDI macro)   | ←       |
| Master volume           | Global volume                | ←       |
| Oscillator volume       | Mix volume             | Sample Volume |
| Initial TPR₃            | Initial speed                   | TPR₃ |
| Initial tempo           | ←                            | ←       |
| Pan separation          | ←                            | ←       |
| Pitch bend range        | Pitch wheel depth            | ?       |
| Message size            | Message length               | ←       |
| Message offset          | ←                            | ←       |
| Reserved                | ←                            | ←       |
| Initial slot panpot     | Initial channel pan          | ?       |
| Initial slot loudness₄  | Initial channel volume       | ?       |
| Sequence order          | Orders                      | Sequence |
| Instrument offsets      | ←                            | ←       |
| Oscillator offsets      | Sample offsets               | ←       |
| Pattern offsets         | ←                            | ←       |

1. Tracker effects are called "controls" in Octavia to signify their relations with MIDI control changes.
2. These fields do not have their uses clearly known.
3. TPR: ticks per row.
4. Can be remapped to cc7, cc11 or note velocity/pressure.

## Sources
- [File format: Impulse Tracker](https://fileformats.fandom.com/wiki/Impulse_tracker)
- [Manual: Effect Reference](https://wiki.openmpt.org/Manual:_Effect_Reference)
