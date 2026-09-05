# File Formats
These pages describes the current state of file support by the Octavia MICC subsystem.

## Support
- ✓: Yes
- -: Planned
- ✕: No

### MIDI
| Extension | Name | <span title="Understood?">U?</span> | <span title="Import supported?">I?</span> | <span title="Export supported?">O?</span> | <span title="Lossless Canonical Roundtrip?">R?</span> |
| --------- | ---- | -- | -- | -- | -- |
| `.mia` `.mii` | [MIDI Instruction Assembly](./format/mia.md) | ✓ | - | - | - |
| `.mid` `.kar` | [Standard MIDI File](./format/smf.md) | ✓ | ✓ | - | - |
| `.midi2` | [Standard MIDI Clip](./format/smf2.md) | ✓ | - | - | - |
| `.wrk` `.bun` | [Cakewalk Work Normal](./format/wrk.md) | - | - | ✕ | ✕ |
| `.xws` | [XGworks Original File](./format/xws.md) | ✓ | - | - | ✕ |
| `.yws` | [Yamaha SOL Project](./format/yws.md) | ✕ | ✕ | ✕ | ✕ |

### Tracker
| Extension | Name | <span title="Understood?">U?</span> | <span title="Import supported?">I?</span> | <span title="Export supported?">O?</span> | <span title="Lossless Canonical Roundtrip?">R?</span> |
| --------- | ---- | -- | -- | -- | -- |
| `.it` | [Impulse Tracker](./format/it.md) | ✕ | ✕ | ✕ | - |

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