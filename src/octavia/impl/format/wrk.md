# Cakewalk Work Normal
Cakewalk Work Normal (`.wrk`) is the file format used to store sequenced projects by the original Cakewalk sequencer. A `.wrk` file contains sequenced track data and references to external audio.

Cakewalk Bundle (`.bun`) is the file format used by Cakewalk to bundle audio along with sequenced track data.

[Cakewalk](https://en.wikipedia.org/wiki/Cakewalk_%28sequencer%29) was a sequencer developed by Twelve Tone Systems. Cakewalk was superceded by [Cakewalk SONAR](https://en.wikipedia.org/wiki/Cakewalk_Sonar), which used `.cwp` for sequenced projects and `.cwb` for bundles instead.

## Format categorisation
### BUN
- **Schema**: RIFF, chunked TLV
- **Header size**: 12 (RIFF)
- **Chunk type**: FourCC
- **Chunk size**: [`u32le`](../../../ltgc/list-dtype.md)
- **Padding**: Even
- **Validation targets**: Cakewalk Home Studio 2002

### WRK
- **Schema**: Chunked TLV
- **Header size**: 7
- **Chunk type**: `u8`
- **Chunk size**: [`u32le`](../../../ltgc/list-dtype.md)
- **Padding**: None
- **Validation targets**: Cakewalk Home Studio 2002

## Canonical order
### BUN
```
fmt 
PAD 
<[data ...]>
wrk4
```

### WRK
```

```

## Chunks
### BUN
#### Wave format
- **Type**: `fmt `
- **MICC group**: `microsoft.wave.format` (unused)

Standard `.wav` sample format description.

#### File padding
- **Type**: `PAD `
- **MICC group**: `12tone.cakewalk.pad` (unused)

File-level padding. Its whole existence is to make the PCM sample data start at `0x1000` offset.

```
PADZ
```

Only a single element.

##### `PADZ`
```
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ...
```

Padded zero. All bytes are `00`.

#### Wave data
- **Type**: `fmt `
- **MICC group**: `microsoft.wave.format` (unused)

Standard `.wav` sample data.

#### Sequence data
- **Type**: `wrk4`
- **MICC group**: `12tone.cakewalk.wrk` (unused)

Actual sequencer data. Exact same content as `.wrk` files.

### WRK