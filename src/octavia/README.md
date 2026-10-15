# Octavia
Octavia is an event-driven multi-standard MIDI toolchain, consists of state tracking, parsing and serialising.

Made with ❤️ by Lightingale Community. Repository available on [Codeberg](https://codeberg.org/ltgc/octavia/) and [GitHub](https://github.com/ltgcgo/octavia/).

## Features
- Free, libre and open-source, licensed under GNU LGPL v3.0.
- Available as _web-compliant JS_ (standard ESM; browser and Deno) with TypeScript declarations.
- Beyond a capable runtime, standard ECMAScript, and web-compliance, _assumes nothing about the environment_.
- Comparatively stringent compliance of existing established standards.
- Developed with Firefox and open Web in mind, _not just bootlicking Chromium and V8_. Independent browsers like Servo and Ladybird are irregularly tested as well.
- _No modification required_ to run in hardened forks of browsers, like Tor Browser, Cromite and LibreWolf.

### Octavia Lyre
- Supports 16 ports, 256 channels, 768-voice polyphony maximum. More than you'll ever need.
- Keep your focus on building what matters, as Lyre behaves like a real MIDI module, taking over the heavy-lifting for you.
- Built-in support for multiple plug-in cards, various established standards, and tons of other devices, with instrument data backed by [Octavia Scroll](https://github.com/ltgcgo/midi-db).
- Emits warnings when MIDI programming errors are spotted, reducing chances of faulty programming.

### Octavia MICC
- Your parser and serialiser should not fight against you or hide information from you, while assisting and leaving you alone whenever needed. We endured the pain for years before, now you shouldn't have to.
- It's your choice to either keep close to the metal or get the abstraction you need. Unlike most MIDI parser libraries, you deserve to have your choice without being forced to either.
- (WIP) Relatively hands-off text decoding and port allocation. No need to bother with headaches like this when you don't want to, unlike most MIDI parser libraries.
- (WIP) Unlike most music-related parser libraries, don't get restricted by synchronous buffers, MIDI 1.0, Standard MIDI Files, or even MIDI. The world is vast, your project's coverage should be too without much headache.
- (WIP) Don't stop at merely parsing, get both serialisation and conversion as well, mostly for free!

## Backstory
The current MIDI landscape is a dumpster fire, at least in the FOSS world. Only proprietary software solutions respect existing MIDI standards, while the FOSS ecosystem largely ignores or even violates the conventions, with TiMidity as the single exception. Octavia, born out of being fed up by the existing antics exhibited by existing FOSS solutions, aims to reach full compliance with existing MIDI standards (MT-32, GM, XG, GS, GM2 and etc.), while exposing simple yet powerful interfaces for developers to build upon.

With Octavia, no longer will you worry about either standard compliance or non-standard environment extensions. Just focus on building what's important, be it visualizers, state browsers, event routers or even realtime event translators, Octavia's got your back. Feel free to test Octavia's capabilities with all available demos.

## Dev Talks
We're now hosting a new place to handle development talks! If you don't have a GitHub account, or just prefer to report bugs or give suggestions in a more casual way, feel free to chat with us with links below!

- Fediverse (Mastodon): [@lightingale@fosstodon.org](https://fosstodon.org/@lightingale)
- Telegram channel: [@ltgc_t](https://t.me/s/ltgc_t)
- Telegram group chat: [Click to join DTM Hub](https://t.me/+0I30mcOPTSQ0ZGIx)

## Further documentation
A list of frequently consulted documentation pages is available below. For the full documentation, please check the sidebar.

### Demo usage
- [Visualizers](demo/scr.md)
- [Middleware](demo/mw.md)

### Support coverage
- [Implementation sheet](support/implementation.md)
- [SysEx instructions sheet](support/sysex.md)
- [Targets](support/target.md)
- [Standard visualizers](support/screen.md)

### Developer Documentation
> API documentation is available on JSR (`jsr.io`). For user-facing components, please refer to the [components](./components.md) page.

#### Base API
- [`state.mjs`: State processing virtual device](https://jsr.io/@ltgc/octavia/doc/state/)
- [`basic.mjs`: Basis for building visualisers](https://jsr.io/@ltgc/octavia/doc/basic/)
- [`bridge.mjs`: Middleware components](https://jsr.io/@ltgc/octavia/doc/bridge/)
- [`chord.mjs`: Chord representations and IO](https://jsr.io/@ltgc/octavia/doc/chord/)
- [`micc.mjs`: Musical Instruction Compiler Collection](https://jsr.io/@ltgc/octavia/doc/micc/)

#### Component API
- [`cambiare.mjs`: Embeddable Octavia Cambiare](https://jsr.io/@ltgc/octavia/doc/cambiare/)
- [`disp.mjs`: Ready-made embeddable bundled visualisers](https://jsr.io/@ltgc/octavia/doc/disp/)
- [`middle.mjs`: Ready-made middleware]() (may get renamed or removed)