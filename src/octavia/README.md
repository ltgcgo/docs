# Octavia
Octavia is an event-driven multi-standard MIDI toolchain, consists of state tracking, parsing and serialising.

Made with ❤️ by Lightingale Community. Repository available on [Codeberg](https://codeberg.org/ltgc/octavia/) and [GitHub](https://github.com/ltgcgo/octavia/).

## Features
* Free, libre and open-source, licensed under GNU LGPL v3.0.
* Keep your focus on building what matters, as Octavia behaves like a real MIDI module, taking over the heavy-lifting for you.
* Built-in support for multiple plug-in cards and tons of other devices.
* Wide support of bank mapping and bitmaps via [`midi-db`](https://github.com/ltgcgo/midi-db).
* Stringent compliance of existing established standards.
* Emits warnings when MIDI programming errors are spotted, reducing chances of faulty programming.
* Available in web-compliant JS (standard ESM; browser and Deno).
* Developed with Firefox and an open Web in mind, not just bootlicking Chromium and V8.
* No modification required to run in hardened forks of browsers, like Tor Browser, Cromite and LibreWolf.
* Supports 16 ports, 256 channels, 768-voice polyphony maximum. More than you'll ever need.

## Backstory
The current MIDI landscape is a dumpster fire, at least in the FOSS world. Only proprietary software solutions respect existing MIDI standards, while the FOSS ecosystem largely ignores or even violates the conventions, with TiMidity as the single exception. Octavia, born out of being fed up by the existing antics exhibited by existing FOSS solutions, aims to reach full compliance with existing MIDI standards (MT-32, GM, XG, GS, GM2 and etc.), while exposing simple yet powerful interfaces for developers to build upon.

With Octavia, no longer will you worry about standard compliance. Just focus on building what's important, be it visualizers, state browsers, event routers or even realtime event translators, Octavia's got your back. Feel free to test Octavia's capabilities with all available demos.

## Dev Talks
We're now hosting a new place to handle development talks! If you don't have a GitHub account, or just prefer to report bugs or give suggestions in a more casual way, feel free to chat with us with links below!

* Fediverse (Mastodon): [@lightingale@fosstodon.org](https://fosstodon.org/@lightingale)
* Telegram channel: [@ltgc_t](https://t.me/s/ltgc_t)
* Telegram group chat: [Click to join DTM Hub](https://t.me/+0I30mcOPTSQ0ZGIx)

## Further documentation
### Demo usage
* [Visualizers](demo/scr.md)
* [Middleware](demo/mw.md)

### Support coverage
* [Implementation sheet](support/implementation.md)
* [SysEx instructions sheet](support/sysex.md)
* [Targets](support/target.md)
* [Standard visualizers](support/screen.md)

### Implementation
* [Basic messages](impl/basic.md)
* [Control changes](impl/cc.md)
* [Mode](impl/mode.md)
* [RPN/NRPN values](impl/pn.md)
* [Audio Effects](impl/efx.md)

### SysEx documentation
* [Mutual instructions](sysex/mutual.md)
* [Roland MT-32](sysex/devex/mt32.md)
* [KORG 05/X5/N5](sysex/devex/korgX5N5.md)

### Documentation
_API documentation is available on JSR (`jsr.io`)._

#### Base API
* [`state.mjs`: State processing virtual device](https://jsr.io/@ltgc/octavia/doc/state/)
* [`basic.mjs`: Basis for building visualisers](https://jsr.io/@ltgc/octavia/doc/basic/)
* [`bridge.mjs`: Basis for middleware](https://jsr.io/@ltgc/octavia/doc/bridge/)
* [`chord.mjs`: Chord representations and IO](https://jsr.io/@ltgc/octavia/doc/chord/)
* [`micc.mjs`: Musical Instruction Compiler Collection](https://jsr.io/@ltgc/octavia/doc/micc/)

#### Component API
* [`cambiare.mjs`: Embeddable Octavia Cambiare](https://jsr.io/@ltgc/octavia/doc/cambiare/)
* [`disp.mjs`: Ready-made embeddable bundled visualisers](https://jsr.io/@ltgc/octavia/doc/disp/)
* [`middle.mjs`: Ready-made middleware components]()