# Voice data maps
## Types
### ID maps
TSV files mapping MSB, PRG and LSB into voices.

- `MSB`: cc0 (bank MSB) value of the voice.
- `PRG`: PC (program change) value of the voice.
- `LSB`: cc32 (bank LSB) value of the voice.
- `NME`: 8-character ID of the voice.
- `ELC`: Element count (minus one) of the voice.
  - When set to `0`, the voice takes up one element. `1` for two, `2` for three, the same goes on.
  - When set to `16`, the voice is treated as a drum kit.
  - When set to `17`, the voice is treated as a voice menu.
  - Any value above is not defined.
- `DRM`: Drum map ID used. Can also be used by voice menus.
- `VXP`: Voice property map ID used.

### Drum maps
Custom script files defining properties of drum kits and their voices.

- `drm` defines the current drum map ID to write to.
  - e.g. `drm xgStdKit` switches to `xgStdKit`.
- `dcp` copies parameters from a set drum kit.
  - e.g. `dcp xgStdKit` copies parameters from `xgStdKit` to the current drum kit.
- `nno` defines the current drum note number to write to.
  - e.g. `nno 39` switches to `39`.
- `npw` writes multiple parameters to a single drum note.
  - `npw <note> <exclusiveGroup> <elementCount>`
- `neg` sets the exclusive group (aka. alternate assign) of the current note number. Defaults to `0` (disabled).
- `nec` sets the note element count of the current note number. Defaults to `1`.

### Voice property maps
TSV files describing certain properties of individual voices.

#### VL properties
- `BNS`: VL Breath Noise Source
  - `0`: None
  - `1`: Modulation wheel
  - `2`: Blow strength
  - `3`: Blow strength + throat formant
- `BAD`: VL Breath Attack Duration, specified in milliseconds
- `BAL`: VL Breath Attack Level
  - `0`: -64 (from a very wide triangle)
  - `64`: 0 (no attack EG)
  - `127`: 63 (from a very narrow triangle)
- `BDD`: VL Breath Decay Duration, specified in milliseconds
- `BDL`: VL Breath Decay Level
  - `0`: Decay to 0 (pluck)
  - `64`: Decay to 50.4%
  - `127`: No decay
- `TOM`: VL Throat Formant Oscillation from Modulation
  - `0`: None
  - `127`: Maximum
- `TOS`: VL Throat Formant Oscillation Speed, specified in milliseconds when a cycle completes.
- `TOT`: VL Throat Formant Oscillation Type
  - `0`: None
  - `1`: Single oscillator
  - `2`: Double oscillator (single oscillator modulated by an additional LFO)
- `TFS`: VL Throat Formant Source
  - `0`: Constant until set
  - `1`: cc1 (Modulation wheel)
  - ...
  - `13`: cc13 (default VL throat formant source)
  - ...
  - `32`: Always constant
- `TFV`: VL Throat Formant Value, the fixed default value for certain instruments.