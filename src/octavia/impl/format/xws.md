# XGworks Original File
XGworks Original File (`.xws`) is the file format used to store sequenced projects for Yamaha XGworks.

## Format categorisation
### XWS
- **Schema**: Chunked TLV
- **Header size**: 0
- **Chunk type**: FourCC
- **Chunk size**: [`u32be`](../../../ltgc/list-dtype.md)
- **Padding**: None
- **Canonical order**: `S4WH <[S4WB ...]> [S4WT ...] S4ST SCRS SCRA SCRD`

## Chunks
All valid chunks are listed below.

### Working Header
- **Type**: `S4WH`
- **MICC group**: `yamaha.xgworks.header`

XGworks file header.

```
HEAD
```
Only a single element.

#### HEAD
```
vv 00 tt tt 00 00 bb bb dd dd 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
```
- `vv` (`u8`): XGworks major version or file version.
- `tt` (`u16be`): Contained track count.
- `bb` (`u16be`): Contained block/clip count.
- `dd` (`u16be`): MIDI time division. `01 E0` (`480`) is the most common value.

### Working Block
- **Type**: `S4WB`
- **MICC group**: [`mma.smfTrack`](./smf.md#)
- **Track type**: `S4WB`

Contains an ordinary SMF type 1 `MTrk` stream as a clip. Single channel only.

### Working Track
- **Type**: `S4WT`
- **MICC group**: `yamaha.xgworks.track` (not final)
- **Track type**: `S4WT`

Contains data for a track.

```
HEAD [TRCK ...]
```
Directly chained chunks, without distinct types and length to indicate or aid segmentation.

#### HEAD
```
tt 00 cc ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ??
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
ll [nn ...]
```
- `tt` (`u8`): Track type. `01` for MIDI, `02` for audio (wave).
- `cc` (`u8`): Track channel. Meaning depends on track type.
  - MIDI: MIDI channels. `00` for CH1, `0F` for CH16.
  - Audio: Panpot. `00` for L7 (left most), `07` for C (centre), `0E` for R7 (right most).
- `ll` (`u8`): Block name length.
- `nn` (`u8[]`): Raw bytes of the encoded block name string.

#### TRCK
```
tt 00 ss ss ss ss ee ee ee ee bb bb bb bb ?? ??
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
ll [nn ...]
```
- `tt` (`u8`): Block type. `01` for normal blocks, `02` for linked (pointer) blocks.
- `ss` (`u32be`): Starting MIDI tick.
- `ee` (`u32be`): Ending MIDI tick.
- `bb` (`u32be`): Selected MIDI block ID, inherently defined by the order of appearance as `S4WB` chunks.
- `ll` (`u8`): Block name length.
- `nn` (`u8[]`): Raw bytes of the encoded block name string.

### S4ST
Unknown. All files seem to have the same content.

### SCRS
Specifics unknown. Likely used for records of styles. All files seem to have four `00` bytes.

### SCRA
Specifics unknown. Likely used for records of audio. All files seem to have four `00` bytes.

### SCRD
Unknown. Support currently not intended. All files seem to have four `00` bytes.

## Shared data sectors
None.