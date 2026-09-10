# Components
## Cambiare
> _See also: [Visualiser](./demo/scr.md), [Standard visualizers](./support/screen.md)_

**Octavia Cambiare** is a feature-rich dashboard-like visualiser designed to maximise information exposure, backed by the Octavia state engine. Its usage overlaps with but is not limited to the following cases:

- Archive-grade and research-grade visualisation
- Behaviour (compatibility, ideal synth state, sequencer) monitoring
- MIDI forensic analysis
- MIDI internals teaching
- Troubleshooting
- Video overlay composition

## Dirigere
**Octavia Dirigere** is a utility that bundles a player, an I/O router, and a translator together. It's one of the two spiritual successors of the old Octavia middleware.

## Mane
> _See also: [Octavia Mane]()_

**Octavia Mane** (backronym _Mapped Addresses, Named Extensions_) supplies bidirectional mappings between raw bytes and readable names, akin to Fabric Yarn mappings, which the name of this project was inspired from. Mane mappings are used to conduct readable assembly and disassembly in Octavia MICC, however Octavia's own SysEx interpreter uses binary data directly, thus does not rely on Mane in any way.

## MICC
> _See also: [Octavia MICC](), [MIA](./impl/format/mia.md), [Formats](./impl/format.md), [Extensions](./impl/ext.md)_

**Octavia MICC** (_Musical Instructions Compiler Collection_) is a highly capable and extensible stream-native parsing, conversion and serialisation toolchain. MICC supplies MIDI-adjacent and tracker-adjacent file format support capabilities to Octavia.

MICC also ships various compatibility shims, both bundled into regular Octavia releases and released as standalone modules, to offer projects relying on alternatives a viable transition path to MICC, especially consumers of unmaintained libraries.

## Panorama
**Octavia Panorama** is a macro-level file manipulation utility, backed by Octavia MICC and Seamstress. It handles rough file editing, like track splicing, track merging, and more.

## Scroll
> _See also: [Octavia Scroll]()_

**Octavia Scroll**, also known as MIDI Database or `midi-db`, is a data sheet collection supplying voice bank, variable name mappings and EFX ID mappings to the Octavia project.

## Sognare
**Octavia Sognare** (formerly referred to as **AnyWorks**) is a sequencer built on top of Octavia MICC, Octavia Scroll and Octavia Mane, heavily inspired by XGworks.

## (state engine)

## Splash
> _See also: [Octavia Splash]()_

**Octavia Splash** is a lightweight MIDI event routing, real-time disassembly and manipulation tool, akin to _Bome SendSX_, _SNoize MIDI Monitor_  and the MIDI port settings dialogue in DAWs. It's one of the two spiritual successors of the old Octavia middleware.