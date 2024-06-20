# Octavia standard visualizers
Octavia comes with a set of modular standard visualizers with each release.

For a guide on how to use the public demos, refer to [demo visualizer usage](../demo/scr.md).

## Visualizers
### Octavia Cambiare
* **Lead developer**: Lumière Élevé

The most feature-rich visualizer built on top of Octavia available. Inspired by MegaMID, vanBasco Karaoke Player and TiMidity++, Octavia Cambiare is designed from the ground up, and seeks to entirely replace what inspired it.

### Octavia MU
* **Lead developer**: Lumière Élevé

A recreation of the screens on the Yamaha MU line up. Bitmap is collected with collective effort.

The font used for labels is Public Sans, licensed under SIL OFL.

#### Bitmap contributors
Special thanks to all of the people who had contributed the MU bitmap! If you see your name missing here, please contact us for proper credits.

* MIDIMan
* Lumière Élevé
* GFHK-SDGM
* MJG0117

### Octavia SC
* **Lead developer**: Lumière Élevé

A recreation of the screens on Roland SC-55, Roland SC-88 and Roland SC-88 Pro.

The font used for labels is Numito Sans, licensed under SIL OFL.

### Octavia NS5R
* **Lead developer**: Lumière Élevé

A recreation of the screens on KORG NS5R, with help from JayB.

The font used for labels is Jost, licensed under SIL OFL.

### Octavia QY
* **Lead developer**: Lumière Élevé

A recreation of the screens on the Yamaha QY line up, with help from JayB.

### Octavia PSR
* **Lead developer**: GFHK-SDGM

A recreation of the screens on Yamaha PSR.

### Octavia SC-8850
* **Lead developer**: Lumière Élevé

A recreation of the screen on Roland SC-8850.

#### Bitmap contributors
Special thanks to all of the people who had contributed the SC-8850 bitmap!

* SSQMinky
* MasteredRealm
* Thorndust
* GFHK-SDGM
* Lumière Élevé

### Octavia MU15
* **Lead developer**: Lumière Élevé

A recreation of the screen on Yamaha MU15.

## Support and specification table
|                  | MU | SC | NS5R | QY | PSR | SC-8850 | MU15 | Cambiare | TUI |
| ---------------- | -- | -- | ---- | -- | --- | ------- | ---- | -------- | --- |
| Max name length  | 8  | 12 | 10²  | 8  | 8   | 12      | 8    | 24       | 8   |
| Max shown parts  | 64 | 64 | 128  | 8  | 1   | 64      | 64   | 64       | 16  |
| PC# start index  | 1  | 1  | 1    | Both | 1 | 1       | 1    | 0        | N/A |
| Voice details    | PB | P  | PB   | PF | P   | PB      | P    | PF       | N   |
| Current mode     | B  | L  | C    | B  | BL  | D       | B    | CD       | D   |
| Voice bitmap     | ✓  | ✕  | ✕    | ✓  | ✓   | ✓       | ✕    | ✕        | ✕   |
| Letter display   | ✓  | ✓  | ✓    | ✓  | ✓   | ✓       | ✓    | ✓        | ✓   |
| Bitmap display   | ✓  | ✓  | ✓    | ✓  | ✓   | ✓       | ✓    | ✓        | ✓   |
| Wider bitmap     | ✕  | ✕  | ✓    | ✓  | ✕   | ✓       | ✕    | ✓        | ✕   |
| Chord display¹   | ✕  | ✕  | ✕    | ✓  | ✓   | ✕       | ✕    | ✓        | ✕   |
| Pixel blur       | ✓³ | ✓  | ✓    | ✕  | ✓³  | ✓       | ✓³   | ✓        | ✕   |
| Lyrics           | ✕  | ✕  | ✕    | ✕  | ✓   | ✕       | ✕    | ✓        | ✓   |
| Song title       | ✕  | ✓  | ✕    | ✓  | ✓   | ✕       | ✕    | ✓        | ✓   |
| Meta events      | ✕  | ✕  | ✕    | ✕  | ✕   | ✕       | ✕    | ✓        | ✓   |
| Effect sends     | ✓  | ✓  | ✓    | ✕  | ✕   | ✕       | ✕    | ✓        | ✓   |
| Effect types     | ✕  | ✕  | ✓    | ✕  | ✕   | ✕       | ✕    | ✓        | ✕   |
| Switch part      | ✓  | ✓  | ✓    | ✓  | ✓   | ✓       | ✓    | ✓        | ✕   |
| PB/Transpose     | ✓  | ✓  | ✓    | ✓  | ✕   | ✕       | ✕    | ✓        | ✓   |
| Current position | ✕  | ✕  | ✕    | ✓  | ✓   | ✕       | ✕    | ✓        | ✓   |
| VL monitor       | ✕  | ✕  | ✕    | ✕  | ✕   | ✕       | ✕    | ✓        | ✕   |
| DX monitor       | ✕  | ✕  | ✕    | ✕  | ✕   | ✕       | ✕    | ✓        | ✕   |
| User sound sets  | ✓  | ✓  | ✓    | ✓  | ✓   | ✓       | ✓    | ✓        | ✓   |
| Custom MDAT      | ✕  | ✕  | ✕    | ✕  | ✕   | ✕       | ✕    | ✓        | ✕   |

### Voice details
* N: Name only
* P: With program number
* B: With bank number
* F: With full bank numbers

### Current mode
* B: Bitmap prompt
* L: Letter prompt
* C: Colour change
* D: Dedicated slot

### Additional notes
1. Planned feature, not yet implemented.
2. Octavia NS5R can render voice names with at most 12 characters under certain conditions.
3. Except for Octavia MU, Octavia PSR and Octavia MU15, the intensity of pixel blur is customizable.
