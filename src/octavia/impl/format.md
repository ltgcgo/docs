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
| `.kyc` | [**K**um**y**oung **C**ontainer](./format/kyc.md) | - | - | ✕ | ✕ |
| `.mia` `.mii` | [**M**IDI **I**nstruction **A**ssembly](./format/mia.md) | ✓ | - | - | - |
| `.mid` `.kar` | [Standard **MID**I File](./format/smf.md) | ✓ | ✓ | - | - |
| `.midi2` | [Standard **MIDI** Clip](./format/smf2.md) | ✓ | - | - | - |
| `.rmi` | [**R**IFF-wrapped Standard **MI**DI File](./format/smf.md#rmi) | ✓ | - | ✕ | ✕ |
| `.sng` | [Korg Synth Internal **S**o**ng**](./format/sng.md) | - | - | ✕ | ✕ |
| `.tjn` `.etjn` | [(**E**ncrypted) **T**ae**j**in Nolae](./format/tjn.md) | - | - | ✕ | ✕ |
| `.wrk` `.bun` | [Cakewalk **W**o**rk** Normal](./format/wrk.md) | - | - | ✕ | ✕ |
| `.xws` | [XGworks Original File](./format/xws.md) | ✓ | - | - | ✕ |
| `.yws` | [Sequence Object Linking File](./format/yws.md) | ✕ | ✕ | ✕ | ✕ |

#### Auxillary abbreviations
- `.xws`: **X**G**w**orks **S**equence
- `.yws`: **Y**amaha **W**orking **S**equence

### Tracker
| Extension | Name | <span title="Understood?">U?</span> | <span title="Import supported?">I?</span> | <span title="Export supported?">O?</span> | <span title="Lossless Canonical Roundtrip?">R?</span> |
| --------- | ---- | -- | -- | -- | -- |
| `.it` | [**I**mpulse **T**racker Module](./format/it.md) | - | - | - | - |
| `.mod` | [(ProTracker) **Mod**ule](./format/mod.md) | - | - | - | - |
| `.mptm` | [Open **M**od**P**lug **T**racker **M**odule](./format/mptn.md) | - | - | - | - |
| `.s3m` | [**S**cream Tracker **3** **M**odule](./format/s3m.md) | - | - | ✕ | ✕ |
| `.xm` | [E**x**tended **M**odule (Fast Tracker 2)](./format/xm.md) | - | - | ✕ | ✕ |

### Voice banks
| Extension | Name | <span title="Understood?">U?</span> | <span title="Import supported?">I?</span> | <span title="Export supported?">O?</span> | <span title="Lossless Canonical Roundtrip?">R?</span> |
| --------- | ---- | -- | -- | -- | -- |
| `.dls` | [**D**own**l**oadable **S**ound](./format/dls.md) | - | - | - | ✕ |
| `.m2a` `.m2k` | [Yamaha **M**U**2**000 Sampling **A**udio](./format/m2a.md) | - | - | ✕ | ✕ |
| `.mdat` | [Octavia Native Voice **M**ap **D**ata](./maps.md) | ✓ | - | - | ✕ |
| `.pcg` | [Korg **P**rogram, **C**ombi and **G**lobal](./format/pcg.md) | ✓ | - | ✕ | ✕ |
| `.sf2` `.sf3` | **S**ound**F**ont<sup>1</sup> | N/A | ✕ | ✕ | ✕ |
| `.syx` | **Sy**sE**x** Voice Bank Dump<sup>2</sup> | ✓ | ✕ | ✕ | ✕ |
| `.w7e` `.s7e` | [Yamaha ES Voice Editor](./format/s7e.md) | - | - | ✕ | ✕ |
| `.x5` `.05r` | [Korg X5 Voice Bank Dump](./format/x5.md)<sup>2,3</sup> | ✓ | ✕ | ✕ | ✕ |

1. Support for the format is denied.
2. Support is delegated to Octavia Lyre instead.
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