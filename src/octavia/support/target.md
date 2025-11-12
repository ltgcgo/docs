# Supported targets
## General support table
The following list of targets have their support by Octavia status presented in a table. A target can be a **m**odel, a **p**lugin board, a **l**ineup, or a **s**tandard.

A supported standard may also have a list of specific target models listed.

For specific SysEx support range, refer to [Supported SysEx Instructions](./sysex.md). For a list of supported modes, refer to [`state.mjs` internal mode IDs](../state/#midi-modes).

| Vendor | Target    | Type | Bank | SysEx |
| ------ | --------- | ---- | ---- | ----- |
| MMA    | GM        | S    | ✓    | ✓     |
| MMA    | GM2       | S    | ✓    | ✓     |
| Roland | MT-32     | S    | ✓    | ✓     |
| Roland | GS        | S    | ✓    | ✓     |
| Roland | SD        | S    | ✓    | ✓     |
| YAMAHA | TG        | L    | ✓    | ✓     |
| YAMAHA | XG¹       | S    | ✓    | ✓     |
| YAMAHA | PLG-150AN | P    | ✓    | -     |
| YAMAHA | PLG-150AP | P    | ✓    | ✕     |
| YAMAHA | PLG-150DR | P    | ✓    | ✕     |
| YAMAHA | PLG-150DX | P    | ✓    | -     |
| YAMAHA | PLG-150PC | P    | ✓    | ✕     |
| YAMAHA | PLG-150PF | P    | ✓    | ✕     |
| YAMAHA | PLG-150VL | P    | ✓    | ✓     |
| YAMAHA | PLG-100SG | P    | ✓    | ✓     |
| YAMAHA | S90 ES    | L    | ✓    | ✓     |
| YAMAHA | Motif ES  | L    | ✓    | ✓     |
| KORG   | AG-10     | M    | ✓    | ✓     |
| KORG   | 05R/W     | L    | ✓    | ✓     |
| KORG   | X5DR      | L    | ✓    | ✓     |
| KORG   | NS5R/NX5R | L    | ✓    | ✓     |
| KAWAI  | GMega     | L    | ✓    | ✓     |
| KAWAI  | GMega LX  | M    | ✓    | ✓     |
| AKAI   | SG01k     | M    | ✓    | ✓     |
| CASIO  | GZ-50M    | M    | ✓    | ✓     |
| ALESIS | NanoSynth | M    | ✕    | ✕     |

1. Octavia implements XG level 3.0 or later, and XG version 2.0 or later.

### Custom sound banks
- Voice name maps (`.mdat`)
- SysEx bank dumps (`.syx`)
  - KORG X5 (05R/W)
  - KORG X5D (X5DR)
  - KORG NS5R (NX5R)
  - ~~KORG Trinity~~
  - ~~Yamaha PLG-AN (AN200)~~
- Yamaha S90 ES Voice Editor (`.s7e`)
- ~~Yamaha Motif ES Voice Editor (`.w7e`)~~
- Korg Program/Combi/Global (`.pcg`)
  - Korg KROSS 2

## Specific targets
### Roland MT-32
| Target  | Type | Status |
| ------- | ---- | ------ |
| MT-32   | M    | ✓      |
| MT-100  | M    | -      |
| CM-32L  | M    | ✓      |
| CM-32LN | M    | -      |
| CM-64   | M    | -      |
| CM-500  | M    | -      |
| LAPC-I  | M    | -      |
| LAPC-N  | M    | -      |
| RA-50   | M    | -      |
| E-20    | M    | -      |

### Roland GS
| Level | Target |
| ----- | ------ |
| 1     | SC-55, SC-33, SC-155, SC-50, SD-35, SC-55K, SC-55ST, SK-50 |
| 2     | SC-88, SC-88ST, SC-88VL, M-GS64 |
| 3     | SC-88 Pro, SC-880, SC-88ST Pro, SK-88 Pro |
| 4     | SC-8850, SC-8820, SC-D70, SK-500 |

| Target    | Type | Status |
| --------- | ---- | ------ |
| CM-300    | M    | ✓      |
| SC-55     | L    | ✓      |
| SC-88     | L    | ✓      |
| SC-88 Pro | L    | ✓      |
| SC-8850   | L    | ✓      |
| SD-35     | M    | ✓      |
| SK-50     | M    | ✓      |
| SK-88 Pro | M    | ✓      |
| SK-500    | M    | ✓      |

### Roland SD
| Target    | Type | Status | Level |
| --------- | ---- | ------ | ----- |
| SD-20     | M    | ✓      | 1     |
| SD-80     | M    | ✓      | 2     |
| SD-90     | M    | ✓      | 2     |
| SD-50     | M    | ✓      | 0     |

### Yamaha TG
| Target | Type | Status |
| ------ | ---- | ------ |
| TG55   | M    | -      |
| TG33   | M    | -      |
| TG77   | M    | -      |
| TG100  | M    | -      |
| TG500  | M    | -      |
| TG300  | M    | ✓      |

### Yamaha XG
| Level | Target |
| ----- | ------ |
| 0     | XGlite |
| 1     | MU50, MU10, MU15, DB50XG, DB51XG, DB60XG, PLG100-XG, SW60XG, S-YXG50, S-YXG70, S-YXG100 |
| 2     | MU80 |
| 3     | QY70, QY100, QY700 |
| 4     | MU90 |
| 5     | MU100, SW1000XG |
| 6     | MU128 |
| 7     | MU1000, MU2000, MU500 |
| 8     | S-YXG2006LE |
| 9     | PSR-220, PSR-225, PSR-230, PSR-240, PSR-270, PSR-280, PSR-282, PSR-330, PSR-340, PSR-GX76 |
| 10    | PSR-203, PSR-205, PSR-273, PSR-275, PSR-290, PSR-292, PSR-293, PSR-295, PSR-350, PSR-450, PSR-E303, PSR-E403, PSR-E413, PSR-K1 |
| 12    |  |
| 13    |  |
| 14    |  |
| 64    | Unidentified modern XG synth |

- The levels depicted here do **not** refer to actual XG levels.
- Levels between 0 and 7 refer to classic XG, 8 and above refer to modern XG. Except for model-exclusive voices, higher classic XG support levels always encompass lower XG support levels.
- Levels equal to and above 12 are currently not truly assigned.
- PLG100-XG adds **Dance Kit** on top of the MU50 voices. QY100 and PLG100-XG share the same sample pool that's different from MU Basic sample pool.

#### Classic
| Target      | Type | Status |
| ----------- | ---- | ------ |
| DB50XG      | M    | ✓      |
| DB51XG      | M    | ✓      |
| DB60XG      | M    | ✓      |
| MU80        | M    | ✓      |
| MU50        | M    | ✓      |
| MU90        | L    | ✓      |
| MU10        | M    | ✓      |
| MU100       | L    | ✓      |
| MU15        | M    | ✓      |
| MU128       | L    | ✓      |
| MU1000      | L    | ✓      |
| MU2000      | L    | ✓      |
| MU500       | M    | ✓      |
| PLG100-XG   | P    | ✓      |
| QY700       | M    | ✓      |
| QY70        | M    | ✓      |
| QY100       | M    | ✓      |
| SW60XG      | M    | ✓      |
| SW1000XG    | M    | ✓      |
| S-YXG50     | M    | ✓      |
| S-YXG70     | M    | ✓      |
| S-YXG100    | M    | ✓      |

#### Modern
| Target      | Type | Status |
| ----------- | ---- | ------ |
| S-YXG2006LE | M    | ✓      |
| PSR-220     | L    | -      |
| PSR-203     | L    | -      |
| PSR-530     | L    | -      |
| PSR-1500    | L    | -      |
| PSR-1000    | L    | -      |