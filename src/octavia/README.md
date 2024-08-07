# Octavia
Octavia is an event-driven multi-standard MIDI state-tracking library.

## Features
* Free, libre and open-source, under GNU LGPL v3.0.
* Behaves like a real MIDI module.
* Developed with Firefox and an open Web in mind.
* Supports 8 ports, 128 channels, 512-voice polyphony maximum.
* Built-in support of several standards, multiple plug-in cards, and tons of devices.
* Tells when MIDI programming errors are spotted, reducing chances of faulty programming.
* Available in JavaScript (browser and Deno).
* No modification required to run in Tor Browser, Bromite and LibreWolf.
* Wide support of bank mapping and bitmaps via [`midi-db`](https://github.com/ltgcgo/midi-db).

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
* [RPN/NRPN values](impl/pn.md)
* [Audio Effects](impl/efx.md)

### SysEx documentation
* [Mutual instructions](sysex/mutual.md)
* [Roland MT-32](sysex/mt32.md)
* [KORG 05/X5/N5](sysex/korgOld.md)

### API documentation
* [`state.mjs`: the core processing unit](state/)
* [`basic.mjs`: the basis for visualizers](basic/)
* [`bridge.mjs`: the basis for middleware](bridge/)
* [`disp.mjs`: ready-made example visualizers](disp/)
* [`middle.mjs`: ready-made middleware](middle/)
* [`micc.mjs`: streaming assembler and disassembler](micc/)