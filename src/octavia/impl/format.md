# File Formats
These pages documents various file formats the Octavia MICC subsystem may or may not have an interest in supporting in detail. File formats with "non-applicable" in the "understood" field are formats having zero plans of supporting.

## Support
This section documents formats supported by the full Octavia MICC subsystem, **not** the compatibility shims released. Compatibility shims largely support SMF only.

- ✓: Yes
- -: Planned
- ✕: No

### MIDI
| Extension | Name | <span title="Understood?">U?</span> | <span title="Import supported?">I?</span> | <span title="Export supported?">O?</span> | <span title="Lossless Canonical Roundtrip?">R?</span> |
| --------- | ---- | -- | -- | -- | -- |
| `.mia` `.mii` | [MIDI Instruction Assembly](./format/mia.md) | ✓ | - | - | - |
| `.mid` `.kar` | [Standard MIDI File](./format/smf.md) | ✓ | ✓ | - | - |
| `.midi2` | [Standard MIDI Clip](./format/smf2.md) | ✓ | - | - | - |
| `.sng` | [Korg Synth Internal Song](./format/sng.md) | - | - | ✕ | ✕ |
| `.wrk` `.bun` | [Cakewalk Work Normal](./format/wrk.md) | - | - | ✕ | ✕ |
| `.xws` | [XGworks Original File](./format/xws.md) | ✓ | - | - | ✕ |
| `.yws` | [Sequence Object Linking File](./format/yws.md) | ✕ | ✕ | ✕ | ✕ |

### Tracker
| Extension | Name | <span title="Understood?">U?</span> | <span title="Import supported?">I?</span> | <span title="Export supported?">O?</span> | <span title="Lossless Canonical Roundtrip?">R?</span> |
| --------- | ---- | -- | -- | -- | -- |
| `.it` | [Impulse Tracker](./format/it.md) | ✕ | ✕ | ✕ | - |
| `.mptm` | [OpenMPT Module](./format/mptn.md) | ✕ | ✕ | ✕ | ✕ |

### Voice banks
| Extension | Name | <span title="Understood?">U?</span> | <span title="Import supported?">I?</span> | <span title="Export supported?">O?</span> | <span title="Lossless Canonical Roundtrip?">R?</span> |
| --------- | ---- | -- | -- | -- | -- |
| `.dls` | [Downloadable Sound](./format/dls.md) | - | - | - | ✕ |
| `.m2a` `.m2k` | [Yamaha MU2000 Sampling Audio](./format/m2a.md) | - | - | ✕ | ✕ |
| `.mdat` | [Octavia Native Voice Map Data](./maps.md) | ✓ | - | - | ✕ |
| `.pcg` | [Korg Program, Combi and Global](./format/pcg.md) | ✓ | - | ✕ | ✕ |
| `.sf2` `.sf3` | SoundFont | N/A | ✕ | ✕ | ✕ |
| `.syx` | SysEx Voice Bank Dump<sup>2</sup> | ✓ | ✕ | ✕ | ✕ |
| `.w7e` `.s7e` | [Yamaha ES Voice Editor](./format/s7e.md) | - | - | ✕ | ✕ |
| `.x5` `.05r` | [Korg X5 Voice Bank Dump](./format/x5.md)<sup>2,3</sup> | ✓ | ✕ | ✕ | ✕ |

1. Support for the format is denied.
2. Support is delegated to the Octavia state engine instead.
3. Converted to `.syx` first before handling begins.

## Lossless Canonical Roundtrip
Lossless roundtrip describes the ability to keep input and output byte-identical. MICC only targets lossless roundtripping of canonical representations of the file formats, as it's not practical to preserve the full original file data for downstream handling and processing.

For a detailed list of actual features preserved as-is or canonically, read the documentations of relevant file formats.

### Current target LCR routes
For the actual current state of LCR support, check the tables above.

- SMF → SMF
- MIA → MIA
- SMF → MIA → SMF
- SMF → XWS → SMF
- MIA → XWS → MIA