# Octavia standard visualizers
Octavia comes with a set of modular standard visualizers with each release.

## Visualizers
### Octavia MU
* **Lead developer**: Lumière Élevé

A recreation of the screens on the Yamaha MU line up.

### Octavia SC
* **Lead developer**: Lumière Élevé

A recreation of the screens on Roland SC-55, Roland SC-88 and Roland SC-88 Pro.

### Octavia NS5R
* **Lead developer**: Lumière Élevé

A recreation of the screens on KORG NS5R.

### Octavia QY
* **Lead developer**: Lumière Élevé

A recreation of the screens on the Yamaha QY line up.

### Octavia PSR
* **Lead developer**: GFHK-SDGM

A recreation of the screens on Yamaha PSR.

### Octavia Cambiare
* **Lead developer**: Lumière Élevé

The most feature-rich visualizer built on top of Octavia available. Inspired by MegaMID, vanBasco Karaoke Player and TiMidity++, Octavia Cambiare is designed from the ground up, and seeks to entirely replace what inspired it.

## Support and specification table
|                  | MU | SC | NS5R | QY | PSR | Cambiare | TUI |
| ---------------- | -- | -- | ---- | -- | --- | -------- | --- |
| Max name length  | 8  | 12 | 10²  | 8  | 8   | 24       | 8   |
| Max shown parts  | 64 | 64 | 128  | 8  | 1   | 64       | 16  |
| PC# start index  | 1  | 1  | 1    | Both | 1 | 0        | N/A |
| Voice details    | PB | P  | PB   | PF | P   | PF       | N   |
| Letter display   | ✓  | ✓  | ✓    | ✓  | ✓   | ✓        | ✓   |
| Bitmap display   | ✓  | ✓  | ✓    | ✓  | ✓   | ✓        | ✓   |
| Wider bitmap     | ✕  | ✕  | ✓    | ✓  | ✕   | ✓        | ✕   |
| Pixel blur       | ✓³ | ✓  | ✓    | ✕  | ✓³  | ✓        | ✕   |
| Lyrics           | ✕  | ✕  | ✕    | ✕  | ✓   | ✓        | ✓   |
| Chord display¹   | ✕  | ✕  | ✕    | ✓  | ✓   | ✓        | ✕   |
| Effect sends     | ✓  | ✓  | ✓    | ✕  | ✕   | ✓        | ✓   |
| Effect types     | ✕  | ✕  | ✓    | ✕  | ✕   | ✓        | ✕   |
| Switch part      | ✓  | ✓  | ✓    | ✓  | ✓   | ✓        | ✕   |
| PB/Transpose     | ✓  | ✓  | ✓    | ✓  | ✕   | ✓        | ✓   |
| VL monitor       | ✕  | ✕  | ✕    | ✕  | ✕   | ✓        | ✕   |
| DX monitor       | ✕  | ✕  | ✕    | ✕  | ✕   | ✓        | ✕   |
| User sound sets  | ✓  | ✓  | ✓    | ✓  | ✓   | ✓        | ✓   |
| Custom MDAT      | ✕  | ✕  | ✕    | ✕  | ✕   | ✓        | ✕   |

* N: Name only
* P: With program number
* B: With bank number
* F: With full bank numbers

1. Planned feature, not yet implemented.
2. Octavia NS5R can render voice names with at most 12 characters under certain conditions.
3. Except for Octavia MU and Octavia PSR, the intensity of pixel blur is customizable.
