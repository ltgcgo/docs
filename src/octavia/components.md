# Components
> _See also: [Project Origin](../ltgc/project-origin.md)_

## Cambiare
> _See also: [Visualiser](./demo/scr.md), [Standard visualizers](./support/screen.md), [JSR](https://jsr.io/@ltgc/octavia/doc/cambiare)_

**Octavia Cambiare** is a feature-rich dashboard-like visualiser designed to maximise information exposure, backed by the Octavia state engine. Its usage overlaps with but is not limited to the following cases:

- Archive-grade and research-grade visualisation
- Behaviour (compatibility, ideal synth state, sequencer) monitoring
- MIDI forensic analysis
- MIDI internals teaching
- Troubleshooting
- Video overlay composition

> Octavia bundles other recreated embeddable synth LCD-style displays into its releases as well. They are not related to Cambiare.

## Dirigere
> **Warning**: WIP, name change pending

**Octavia Dirigere** is a utility that bundles a player, an I/O router, and a translator together. It's one of the two spiritual successors of the old Octavia middleware, with excellent built-in support for complex multi-port MIDI compositions. Pick one between Dirigere and Splash, or you may encounter conflicts.

If you are not able to use Dirigere for various reasons, following programs are recommended to hook up with Octavia Splash instead.

- [Falcosoft MIDI Player](https://falcosoft.hu/softwares.html#midiplayer) is recommended for single-port playback. Octavia Dirigere aims to be able to compete with Falcosoft MIDI Player.
- MIDITrail is recommended for multi-port playback, however the official website on OSDN is offline. Supports standard multi-port assignments.
- XGworks is recommended for multi-port playback, however it has been discontinued for decades. Supports XGworks-native multi-port assignments.
- vanBasco's MIDI Player can be used for single-port playback, however the official websites are offline.

TMIDI Player is **not** recommended due to time synchronisation problems.

## Mane
> _See also: [Octavia Mane](./components/mane.md)_

**Octavia Mane** (backronym _Mapped Addresses, Named Extensions_) is a data sheet collection that supplies bidirectional mappings between raw bytes and readable names, akin to Fabric Yarn mappings, which the name of this project was inspired from. Mane mappings are used to conduct readable assembly and disassembly in Octavia MICC, however Octavia's own SysEx interpreter uses binary data directly, thus does not rely on Mane in any way.

## MICC
> _See also: [Octavia MICC](), [MIA](./impl/format/mia.md), [Formats](./impl/format.md), [Extensions](./impl/ext.md), [JSR](https://jsr.io/@ltgc/octavia/doc/micc)_

**Octavia MICC** (_Musical Instructions Compiler Collection_) is a highly capable and extensible stream-native parsing, conversion and serialisation toolchain. MICC supplies MIDI-adjacent and tracker-adjacent file format support capabilities to Octavia.

MICC also ships various compatibility shims, both bundled into regular Octavia releases ([JSR](https://jsr.io/@ltgc/octavia/doc/miccCompat)) and released as standalone modules, to offer projects relying on alternatives a viable transition path to MICC, especially consumers of unmaintained libraries.

## Octavia
> _See also: [Octavia](./), [JSR](https://jsr.io/@ltgc/octavia/doc/state), [JSR (full)](https://jsr.io/@ltgc/octavia/doc)_

**Octavia** is the state engine making state tracking possible.

## Panorama
> **Warning**: WIP

**Octavia Panorama** is a macro-level file manipulation utility, backed by Octavia MICC and Seamstress. It handles rough file editing, like track splicing, track merging, and more.

## Scroll
> _See also: [Octavia Scroll](./components/midi-db.md)_

**Octavia Scroll**, also known as MIDI Database or `midi-db`, is a data sheet collection supplying comprehensive voice bank, variable name mappings and EFX ID mappings to the Octavia project.

## Simulacris
> **Warning**: WIP

**Octavia Simulacris** is a bitmap to SysEx bidirectional conversion utility. It is an alternative to `img2syx` written by [`@now-its-dark@github.com`](). It supports the following SysEx bitmap delivery measures.

| Type | Dimensions |
| ---- | ---------- |
| XG Bitmap Display | 16×16, 2:1 |
| GS Frame Draw | 16×16, 2:1 |
| N5 Bitmap Display | 32×16, 1:1 |
| N5 Screen Dump | 144×40, 1:1 |
| SC-8850 Screen Dump | 160×64, 1:1 |

## Sognare
> **Warning**: WIP, name change pending

**Octavia Sognare** (formerly referred to as **AnyWorks**) is a sequencer built on top of Octavia MICC, Octavia Scroll and Octavia Mane, heavily inspired by XGworks.

## Splash
> _See also: [Octavia Splash]()_

**Octavia Splash** is a lightweight MIDI event routing, real-time disassembly and manipulation tool, akin to _Bome SendSX_, _SNoize MIDI Monitor_  and the MIDI port settings dialogue in DAWs. It's one of the two spiritual successors of the old Octavia middleware.