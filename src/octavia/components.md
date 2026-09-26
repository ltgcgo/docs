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

## Candy
> **Warning**: WIP

> _See also: [Octavia Candy]()_

**Octavia Candy**, formerly referred to as **AnyEdit**, is a synth editor. It aims to offer a modern alternative to various legacy editors like _XG Editor_, _GS Advanced Editor_ and _Korg X5/N5 Editor_. By leveraging both the state engine and Octavia MICC, Candy handles editing various supported synths in a unified interface, so users don't need to relearn using similar programs again and again, with support for dry running against the state engine and generating SysEx strings without sending them anywhere.

Unlike the `dasmSingle` tool being text-first and expert-facing, Octavia Candy is a GUI-first application, so you are not forced to learn MIA and Octavia Mane before wanting to edit anything. Octavia Candy is also MIDI-only, not intended for editing the self-embedding trackers.

## Coloratura
> **Warning**: WIP

> **Warning**
> 
> Pick one between Dirigere and Splash, or you may encounter conflicts.

**Octavia Coloratura**, formerly known as **Octavia Dirigere**, is a utility that bundles a player, an I/O router, and a translator together. Dirigere is akin to a patchbay, _Falcosoft MIDI Player_ and [_ShowMIDI_](https://github.com/gbevin/ShowMIDI) bundled into one. It's one of the two spiritual successors of the old Octavia middleware, with excellent built-in support for complex multi-port MIDI compositions.

If you are not able to use Dirigere for various reasons, following programs are recommended to hook up with Octavia Splash instead.

- [Falcosoft MIDI Player](https://falcosoft.hu/softwares.html#midiplayer) is recommended for single-port playback. Octavia Dirigere aims to be able to compete with Falcosoft MIDI Player.
- MIDITrail is recommended for multi-port playback, however the original website on OSDN is offline, and we're unable to confirm if the current website is genuine. Supports standard multi-port assignments.
- XGworks is recommended for multi-port playback, however it has been discontinued for decades. Supports XGworks-native multi-port assignments.
- vanBasco's MIDI Player can be used for single-port playback, however the official websites are offline.

Despite supporting multiple MIDI ports, TMIDI Player is **not** recommended due to time synchronisation problems.

## Dawn
> **Warning**: WIP

**Octavia Dawn**, formerly known as **Octavia Panorama**, is a macro-level file manipulation utility, backed by Octavia MICC and Seamstress. It handles rough file editing, like track splicing, track merging, and more.

## Lyre
> _See also: [JSR](https://jsr.io/@ltgc/octavia/doc/state), [JSR (full)](https://jsr.io/@ltgc/octavia/doc)_

**Octavia Lyre**, formerly referred to as just **Octavia**, is the state tracking engine. It tracks state by attempting interpretation of incoming events, then lightly emulate state changes of an imaginery synth that happens to speak a lot of dialects.

Octavia Lyre is the root of the project that every other project stemmed from.

## Mane
> _See also: [Octavia Mane](./components/mane.md)_

**Octavia Mane** (backronym _Mapped Addresses, Named Extensions_) is a data sheet collection that supplies bidirectional mappings between raw bytes and readable names, akin to Fabric Yarn mappings, which the name of this project was inspired from. Mane mappings are used to conduct readable assembly and disassembly in Octavia MICC, however Octavia's own SysEx interpreter uses binary data directly, thus does not rely on Mane in any way.

## MICC
> _See also: [Octavia MICC](), [MIA](./impl/format/mia.md), [Formats](./impl/format.md), [Extensions](./impl/ext.md), [JSR](https://jsr.io/@ltgc/octavia/doc/micc)_

**Octavia MICC** (_Musical Instructions Compiler Collection_) is a highly capable and extensible stream-native parsing, conversion and serialisation toolchain. MICC supplies MIDI-adjacent and tracker-adjacent file format support capabilities to Octavia.

MICC also ships various compatibility shims, both bundled into regular Octavia releases ([JSR](https://jsr.io/@ltgc/octavia/doc/miccCompat)) and released as standalone modules, to offer projects relying on alternatives a viable transition path to MICC, especially consumers of unmaintained libraries.

## Moonrise
> **Warning**: WIP

**Octavia Moonrise**, formerly referred to as **Octavia Sognare** and **AnyWorks**, is a sequencer built on top of Octavia MICC, Octavia Scroll and Octavia Mane, heavily inspired and influenced by XGworks.

## Scroll
> _See also: [Octavia Scroll](./components/midi-db.md)_

**Octavia Scroll**, also known as MIDI Database or `midi-db`, is a data sheet collection supplying comprehensive voice bank, variable name mappings and EFX ID mappings to the Octavia project.

## Simulacris
> **Warning**: WIP

**Octavia Simulacris** is a bitmap to SysEx bidirectional conversion utility. It is an alternative to `img2syx` written by [`@now-its-dark@github.com`](https://github.com/now-its-dark/). It supports the following SysEx bitmap delivery measures.

| Type | Dimensions |
| ---- | ---------- |
| XG Bitmap Display | 16×16, 2:1 |
| GS Frame Draw | 16×16, 2:1 |
| N5 Bitmap Display | 32×16, 1:1 |
| N5 Screen Dump | 144×40, 1:1 |
| SC-8850 Screen Dump | 160×64, 1:1 |

## Splash
> _See also: [Octavia Splash]()_

> **Warning**
> 
> Pick one between Dirigere and Splash, or you may encounter conflicts.

**Octavia Splash** is a lightweight MIDI event routing, real-time disassembly and manipulation tool, akin to _[Bome SendSX](https://www.bome.com/products/sendsx)_, _[SNoize MIDI Monitor](https://www.snoize.com/MIDIMonitor/)_, [ShowMIDI](https://github.com/gbevin/ShowMIDI) and the MIDI port settings dialogue in DAWs. It's one of the two spiritual successors of the old Octavia middleware.