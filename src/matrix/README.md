# IM services
Lightingale Community has been hosting messaging services like [Matrix](https://matrix.org) for ease of communication, ever since the community's early days in 2021.

## Services
### Matrix
We run a [Synapse](https://github.com/matrix-org/synapse) homeserver for hosting all of our bridges and for internal communication. Only members of the Lightingale Community can apply for accounts on the homeserver.

### Mumble
Planned. Internal and mixnet access only, with no clearnet access planned.

### XMPP
We run a [Prosody](https://prosody.im) server with native mixnet access, for easier interfacing with the federated XMPP ecosystem. It is not intended for primary use, and its service availability is generally worse than Matrix.

### Bridges
As long as adhereing to the [Acceptable Usage Policy](/ltgc/aup.html), members on our homeserver can freely use any of the bridges we host. Certain bridges offer integration to mixnets and overlay networks, namely [I2P](https://geti2p.net/), [Tor](https://torproject.org) and [Yggdrasil](https://yggdrasil-network.github.io).

However, please note that integrations with alternative DNS systems (e.g. [OpenNIC](https://opennic.org), [ALFIS](https://github.com/Revertron/Alfis)) likely will not work.

#### Group chat bridges
The following bridges support both group chats and direct messages.

* [Discord](https://discord.com) to Matrix (via [mautrix-discord](https://github.com/mautrix/discord))
* [IRC](https://en.wikipedia.org/wiki/IRC) to Matrix (via [Heisenbridge](https://github.com/hifi/heisenbridge)) (planned)
* [Mumble](https://www.mumble.info) to Matrix (via [MandM-bridge](https://github.com/karlpip/MandM-bridge)) (planned)
* [Telegram](https://telegram.org) to Matrix (via [mautrix-telegram](https://github.com/mautrix/telegram))
* [XMPP/Jabber](https://xmpp.org) to Matrix (via [matrix-bifrost](https://github.com/matrix-org/matrix-bifrost)) (planned)

#### Direct message bridges
The following bridges only support direct messages.

* [Facebook Messenger](https://www.messenger.com) to Matrix (via [mautrix-meta](https://github.com/mautrix/meta)) (planned)
* [Instagram](https://instagram.com) to Matrix (via [mautrix-meta](https://github.com/mautrix/meta)) (planned)
* [Twitter](https://twitter.com) to Matrix (via [mautrix-twitter](https://github.com/mautrix/twitter))

#### Voice chat bridges
The following bridges only bridge voice chats.

* Mumble and Discord (via [mumble-discord-bridge](https://github.com/Stieneee/mumble-discord-bridge)) (planned)

### Media proxies
#### Active Discord media proxy
As Discord began requiring expiring HMAC validations on media attachments, the Discord bridge now switches to an active proxying approach, before reuploading/re-serving re-encoded optimized media attachments becomes viable. Files delivered via this new approach will be served at `dma.ltgc.cc`.

However due to poor design, the active Discord media proxy fails from time to time. We are working on a dedicated active media proxy written in either JS (Deno) or Go.

#### Passive Discord media proxy
Due to [MSC3860](https://github.com/matrix-org/matrix-spec-proposals/pull/3860) being unsupported on homeservers without conformation of the [Matrix 1.7 specification](https://github.com/matrix-org/synapse/issues/15661), homeservers will not recognize `discord-media.mau.dev`, the public redirecting Discord media repo. To circumvent this, we offer a custom cached Discord media proxy at `dmr.ltgc.cc` instead for use with bridges, however it will likely be shut down to public access if we notice it getting abused.

After Discord implemented expirations on media attachment links with HMAC validation, the media proxy now only serves non-attachment files, like avatars, stickers and custom emojis. Since passive media proxy is less costly to run than active media proxies, it's used whenever possible.

## Bridge utilisation
### Apply for use
Apart from internal use, we also offer bridging services to other entities upon approval with no SLA.

#### FLOSS projects
* [RethinkDNS](https://rethinkdns.com) (Apache 2.0, MPL 2.0)
* [Xray](https://xtls.github.io/en/) (MPL)

#### MLP fandom communities

#### Not-for-profit entities
* [Uncyclopedia (Traditional Chinese)](https://uncyclopedia.tw)

### Known issues
#### Global
<!--- Due to some unknown bug in Caddy, requests with bodies larger than 1000 KiB will be cut off by Caddy without emitting errors. This will cause some media messages fail to upload, and in turn, get bridged.
  - This is an issue plaguing all of the web infrastructure within LTGC for quite some while now.
  - The request body problem was **fixed** on 14th April 2024 when we updated Caddy network-wide with two plugins removed.-->
- Animated stickers on certain platforms may only get their first frame be bridged, due to varying media codec support on different platforms.
- Double-bridged replies may not work on certain platforms.
- The bridge may become unresponsive when overloaded. You can help us relieve this problem via donations!

#### Telegram
<!--- The Telegram bridge suffers from downtimes caused by Python, the underlying runtime. It has to be manually rebooted.
- The Telegram bridge will randomly become unresponsive for no other reason than the underlying Python runtime.-->
- Reactions aren't bridged from Telegram.
- The bridge suffers from unresponsiveness or even downtimes due to PostgreSQL. Migration to SQLite3 is currently scheduled.
- Bot messages from Telegram cannot be bridged to other platforms, per Telegram's restriction.
- Senders from other platforms cannot be transparently bridged to Telegram, requiring embedding their display names as message content.
- Member leave events aren't bridged to Matrix, as such the Telegram member list on Matrix is not representative.

#### Discord
- Due to Discord validating time-sensitive HMAC codes on attachment URLs, media from Discord cannot be bridged currently.
  - This was fixed on 27th March 2024, where a combination of active and passive media proxying was deployed.
- Some of the animated stickers were vector images encoded in custom-defined JSON files. As a result, none of the services other than Discord recognizes them.
- The Discord bridge invites bridged accounts to rooms on-demand, and does not bridge member leave events to Matrix, as such the Discord member list on Matrix is not representative.