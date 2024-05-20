# Octavia standard visualizers
Octavia comes with a set of modular standard visualizers with each release.

## Visualizers
### Octavia Cambiare
* **Lead developer**: Lumière Élevé

The most feature-rich visualizer built on top of Octavia available. Inspired by MegaMID, vanBasco Karaoke Player and TiMidity++, Octavia Cambiare is designed from the ground up, and seeks to entirely replace what inspired it.

### Octavia MU
* **Lead developer**: Lumière Élevé

A recreation of the screens on the Yamaha MU line up. Bitmap is collected with collective effort.

Special thanks to all of the people who had contributed the MU bitmap! (contributor list lost)

### Octavia SC
* **Lead developer**: Lumière Élevé

A recreation of the screens on Roland SC-55, Roland SC-88 and Roland SC-88 Pro.

### Octavia NS5R
* **Lead developer**: Lumière Élevé

A recreation of the screens on KORG NS5R, with help from JayB.

### Octavia QY
* **Lead developer**: Lumière Élevé

A recreation of the screens on the Yamaha QY line up, with help from JayB.

### Octavia PSR
* **Lead developer**: GFHK-SDGM

A recreation of the screens on Yamaha PSR.

### Octavia SC-8850
* **Lead developer**: Lumière Élevé

A recreation of the screen on Roland SC-8850. Thanks SSQMinky and GFHK-SDGM for bitmap collection!

## Support and specification table
|                  | MU | SC | NS5R | QY | PSR | SC-8850 | Cambiare | TUI |
| ---------------- | -- | -- | ---- | -- | --- | ------- | -------- | --- |
| Max name length  | 8  | 12 | 10²  | 8  | 8   | 12      | 24       | 8   |
| Max shown parts  | 64 | 64 | 128  | 8  | 1   | 64      | 64       | 16  |
| PC# start index  | 1  | 1  | 1    | Both | 1 | 1       | 0        | N/A |
| Voice details    | PB | P  | PB   | PF | P   | PB      | PF       | N   |
| Current mode     | B  | L  | C    | B  | BL  | D       | CD       | D   |
| Voice bitmap     | ✓  | ✕  | ✕    | ✓  | ✓   | ✓       | ✕        | ✕   |
| Letter display   | ✓  | ✓  | ✓    | ✓  | ✓   | ✓       | ✓        | ✓   |
| Bitmap display   | ✓  | ✓  | ✓    | ✓  | ✓   | ✓       | ✓        | ✓   |
| Wider bitmap     | ✕  | ✕  | ✓    | ✓  | ✕   | ✓       | ✓        | ✕   |
| Chord display¹   | ✕  | ✕  | ✕    | ✓  | ✓   | ✕       | ✓        | ✕   |
| Pixel blur       | ✓³ | ✓  | ✓    | ✕  | ✓³  | ✓       | ✓        | ✕   |
| Lyrics           | ✕  | ✕  | ✕    | ✕  | ✓   | ✕       | ✓        | ✓   |
| Song title       | ✕  | ✓  | ✕    | ✓  | ✓   | ✕       | ✓        | ✓   |
| Meta events      | ✕  | ✕  | ✕    | ✕  | ✕   | ✕       | ✓        | ✓   |
| Effect sends     | ✓  | ✓  | ✓    | ✕  | ✕   | ✕       | ✓        | ✓   |
| Effect types     | ✕  | ✕  | ✓    | ✕  | ✕   | ✕       | ✓        | ✕   |
| Switch part      | ✓  | ✓  | ✓    | ✓  | ✓   | ✓       | ✓        | ✕   |
| PB/Transpose     | ✓  | ✓  | ✓    | ✓  | ✕   | ✕       | ✓        | ✓   |
| Current position | ✕  | ✕  | ✕    | ✓  | ✓   | ✕       | ✓        | ✓   |
| VL monitor       | ✕  | ✕  | ✕    | ✕  | ✕   | ✕       | ✓        | ✕   |
| DX monitor       | ✕  | ✕  | ✕    | ✕  | ✕   | ✕       | ✓        | ✕   |
| User sound sets  | ✓  | ✓  | ✓    | ✓  | ✓   | ✕       | ✓        | ✓   |
| Custom MDAT      | ✕  | ✕  | ✕    | ✕  | ✕   | ✕       | ✓        | ✕   |

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
3. Except for Octavia MU and Octavia PSR, the intensity of pixel blur is customizable.
