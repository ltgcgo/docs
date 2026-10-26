# Impulse Tracker
> See also: [Tracker](../../spec/tmod/), [generalised terms](../../spec/tmod/#generalised-terms)

Impulse Tracker Module (`.it`) is the file format used to store modules by Impulse Tracker. A `.it` file contains data regarding but not limited to patterns, pattern sequence order, oscillators, etc. Like most classic tracker module formats, `.it` files are self-contained.

[Impulse Tracker](https://en.wikipedia.org/wiki/Impulse_Tracker) was a proprietary music tracker developed by Jeffery Lim for the DOS platform, with its last version released back in 1999, and since becoming abandonware. It was [made open-source](https://github.com/jthlim/impulse-tracker) in 2014. [Schism Tracker](https://schismtracker.org) is an up-to-date, open-source, and cross-platform re-implementation of Impulse Tracker.

The `.it` file format implementation in MICC follows the Schism Tracker, only falling back to _Open_ ModPlug Tracker for features unavailable in the Schism Tracker. Do note that all strings in the Impulse Tracker should use the slightly-modified DOS (CP 437) encoding, and reserve at least a null byte (`0x00`) at the end to prevent bugs with C strings in other implementations.

## Format categorisation
### IT
> This format cannot be read by TLV libraries like Seamstress, as it does not contain a size field for each chunk.

- **MICC group**: `tracker.impulse`
- **Schema**: Custom
- **Header size**: 0
- **Chunk type**: FourCC
- **Chunk size**: N/A
- **Padding**: None
- **Validation targets**: Schism Tracker 20260524

## Canonical order
### IT
```
IMPM
IMPI
IMPS
IMPP
XTPM(?)
STPM
```

## Chunks
### IT
#### Header
- **Type**: `IMPM`
- **MICC group**: `tracker.impulse.header`

##### Header fields
> See also: [Meta fields](../../spec/tmod/#meta-fields)

| Offset | Generalised Name          | Impulse / Schism             | ModPlug | Type | Note |
| ------ | ------------------------- | ---------------------------- | ------- | ---- | ---- |
| `0004` | Sequence name             | Song name                    | ←       | `u8[26]` | |
| `001E` | **Time signature hints**  | Pattern highlight            | ←       | ↓ `u8[2]` | |
| `001E` | _Rows per beat_           | ←                            | ←       | `u8` | ... |
| `001F` | _Rows per measure_        | ←                            | ←       | `u8` | ... |
| `0020` | Sequence order count      | Order number                 | ←       | `u16le` | [0, 256) |
| `0022` | Instrument count          | Instrument number            | ←       | `u16le` | [0, 256) |
| `0024` | Oscillator count          | Sample number                | ←       | `u16le` | [0, 256) |
| `0026` | Pattern count             | Pattern number               | ←       | `u16le` | [0, 200] |
| `0028` | Created version           | Created with version         | ←       | `u16le` | |
| `002A` | Compatible version        | Compatible with version      | ←       | `u16le` | |
| `002C` | **Basic flags**           | Flag                         | ←       | ↓ `bool[16]` | |
| `002C` | _Toggle stereo_           | Flag (stereo)                | ←       | `bool` | bit 0 |
| `002C` | _Toggle mixing₂_          | Flag (mixing)                | ←       | `bool` | bit 1 |
| `002C` | _Voice type_              | Flag (instrument/sample)     | ←       | `bool` | bit 2 |
| `002C` | _Slide type_              | Flag (linear slide)          | ←       | `bool` | bit 3 |
| `002C` | _Legacy controls₁_        | Flag (old effects)           | ←       | `bool` | bit 4 |
| `002C` | _Linked portamento_       | Flag (link G with E & F)     | ←       | `bool` | bit 5 |
| `002C` | _MIDI controlled pitch₂_  | Flag (MIDI pitch controlled) | ←       | `bool` | bit 6 |
| `002C` | _Request MIDI macros_     | Flag (request MIDI macros)   | ←       | `bool` | bit 7 |
| `002D` | _Extended filter range_   |         | Flag (extended filter range) | `bool` | bit 7 |
| `002E` | **Existence hint flags**  | Special                      | ←       | ↓ `bool[16]` | |
| `002E` | _Has song message_        | Special (song message)       | ←       | `bool` | |
| `002E` | _Has edit history_        | Special (edit history)       | ←       | `bool` | |
| `002E` | _Has embedded highlight₂_ | Special (embedded highlight) | ←       | `bool` | |
| `002E` | _Has MIDI macro_          | Special (embed MIDI macro)   | ←       | `bool` | |
| `0030` | Master volume             | Global volume                | ←       | `u8` | [0, 128] |
| `0031` | Oscillator volume         | Mix volume             | Sample Volume | `u8` | [0, 128] |
| `0032` | Initial TPR₃              | Initial speed                   | TPR₃ | `u8` | [0, 96] |
| `0033` | Initial tempo             | ←                            | ←       | `u8` | [0, 256) |
| `0034` | Pan separation            | ←                            | ←       | `u8` | [0, 128] |
| `0035` | Pitch bend range          | Pitch wheel depth            | ?       | `u8` | [0, 48] |
| `0036` | Message size              | Message length               | ←       | `u16le` | [0, 2¹⁶) |
| `0038` | Message offset            | ←                            | ←       | `u32le` | [0, 2³²) |
| `003C` | Reserved                  | ←                            | ←       | `u8[4]` | |
| `0040` | Initial slot panpot       | Initial channel pan          | ?       | `u8[64]` | 0 .. 32 .. 64: L .. C .. R |
| `0080` | Initial slot loudness₄    | Initial channel volume       | ?       | `u8[64]` | [0, 64] |
| `00C0` | Sequence order            | Orders                      | Sequence | `u8[]` | |
| ? | Instrument offsets        | ←                            | ←       | `u32le[]` | |
| ? | Oscillator offsets        | Sample offsets               | ←       | `u32le[]` | |
| ? | Pattern offsets           | ←                            | ←       | `u32le[]` | |

- **Sequence name**: Only 25 CP 437 characters are allowed in practice.
- **Rows per beat**: Should be a positive integer. Should not exceed the minimum row count of all patterns.
- **Rows per measure**: Should be a positive integer equal to or larger than **rows per beat**. Should not exceed the minimum row count of all patterns.
- **Created version**: If the high byte is either `01` or `02`, the versions denote actual Impulse Tracker versions, and the hexadecimal value of the low byte should be interpreted as decimal. Same for **Compatible version**.
- **Sequence order**: Size determined by **Sequence order count**.
- **Instrument offsets**: Size determined by **Instrument count**.
- **Oscillator offsets**: Size determined by **Oscillator count**.
- **Pattern offsets**: Size determined by **Pattern count**.

1. Tracker effects are called "controls" in Octavia to signify their relations with MIDI control changes.
2. These fields do not have their uses clearly known.
3. TPR: ticks per row.
4. Can be remapped to cc7, cc11 or note velocity/pressure.

#### Instrument

#### Oscillator

#### Pattern
> Actual raw data of this type of chunks do not actually contain the chunk type, only raw data.

#### `XTPM`
- **Type**: `XTPM`
- **MICC group**: `tracker.impulse.unknown-xtpm`

Unknown. Observed samples do not have payload in these chunks, only chunk types.

#### `STPM`
- **Type**: `STPM`
- **MICC group**: `tracker.impulse.metadata`

Actual full name unknown. Contains additional metadata fields, encoded in TLV with FourCC chunk types and `u16le` chunk sizes.

## Sources
- [File format: Impulse Tracker](https://fileformats.fandom.com/wiki/Impulse_tracker)
- [Manual: Effect Reference](https://wiki.openmpt.org/Manual:_Effect_Reference)
