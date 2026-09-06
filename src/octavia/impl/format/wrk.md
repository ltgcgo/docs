# Cakewalk Work Normal
Cakewalk Work Normal (`.wrk`) is the file format used to store sequenced projects by the original Cakewalk sequencer. A `.wrk` file contains sequenced track data and references to external audio.

Cakewalk Bundle (`.bun`) is the file format used by Cakewalk to bundle audio along with sequenced track data.

[Cakewalk](https://en.wikipedia.org/wiki/Cakewalk_%28sequencer%29) was a sequencer developed by Twelve Tone Systems. Cakewalk was superceded by [Cakewalk SONAR](https://en.wikipedia.org/wiki/Cakewalk_Sonar), which used `.cwp` for sequenced projects and `.cwb` for bundles instead.

> **Note**
> 
> An existing alternative implementation of `.wrk` parser, [Drumstick](https://github.com/pedrolcl/drumstick), was discovered through [`wrk2mid`](https://github.com/pedrolcl/wrk2mid). For the following reasons, we've decided to not get involved with Drumstick in any form, including interacting with its source code.
> - During our testing, `.wrk` files even remotely new (produced at least later than 1997) all fail the conversion proces of `wrk2mid`. This includes...
>   - Official demo songs distributed by Cakewalk (Twelve Tone Systems).
>   - Any `.wrk` file produced by our own validation target, _Cakewalk Home Studio 2002_.
> - Drumstick is licensed under GNU GPL v3, which conflicts with GNU LGPL v3, the license Octavia and its MICC subsystem distributes under. We do not want to impose additional restrictions GNU GPL v3 may impose on our downstream consumers that's not present in GNU LGPL v3 already.

## Format categorisation
### BUN
- **MICC group**: `12tone.cakewalk.bundle`
- **Schema**: RIFF, chunked TLV
- **Header size**: 12 (RIFF)
- **Chunk type**: FourCC
- **Chunk size**: [`u32le`](../../../ltgc/list-dtype.md)
- **Padding**: Even
- **Validation targets**: Cakewalk Home Studio 2002

### WRK
- **MICC group**: `12tone.cakewalk`
- **Schema**: Chunked TLV
- **Header size**: 11
- **Chunk type**: `u8`
- **Chunk size**: [`u32le`](../../../ltgc/list-dtype.md)
- **Padding**: None
- **Validation targets**: Cakewalk Home Studio 2002

## Canonical order
### BUN
```
RIFFHEAD
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
#### RIFF header
- **Type**: N/A
- **MICC group**: N/A

````
HEAD
````

Standard RIFF header typed the same as `.wav` files, likely used to prevent causing problems to programs not supporting the `wrk4` chunk.

##### `HEAD`
````
52 49 46 46 ss ss ss ss 57 41 56 45
````

- `ss` (`u32le`): File size, excluding both `52 49 46 46 ss ss ss ss` and the entire `wrk4` chunk.

#### Wave format
- **Type**: `fmt `
- **MICC group**: `microsoft.wave.format` (unused)

Standard `.wav` sample format description.

#### File padding
- **Type**: `PAD `
- **MICC group**: `ltgc.micc.junk` (unused)

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
- **Type**: `data`
- **MICC group**: `microsoft.wave.data` (unused)

Standard `.wav` sample data.

#### Sequence data
- **Type**: `wrk4`
- **MICC group**: `12tone.cakewalk.wrk` (unused)

Actual sequencer data. Exact same content as `.wrk` files.

### WRK