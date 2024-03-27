# Matrix services
Lightingale Community has been hosting [Matrix](https://matrix.org) services for ease of communication, ever since the community's early days in 2021.

## Homeserver
We run a [Synapse](https://github.com/matrix-org/synapse) homeserver for hosting all of our bridges and for internal communication. Only members of the Lightingale Community can apply for accounts on the homeserver.

## Bridges
As long as adhereing to the [Acceptable Usage Policy](/ltgc/aup.html), members on our homeserver can freely use any of the bridges we host.

### Platforms
Managed bridges to the following platforms are offered by us.

#### Group chat
The following bridges support both group chats and direct messages.

* [Discord](https://discord.com) (via [mautrix-discord](https://github.com/mautrix/discord))
* [Telegram](https://telegram.org) (via [mautrix-telegram](https://github.com/mautrix/telegram))

#### Direct message
The following bridges only support direct messages.

* [Twitter](https://twitter.com) (via [mautrix-twitter](https://github.com/mautrix/twitter))

### Known issues
#### Global
- Due to some unknown bug in Caddy, requests with bodies larger than 1000 KiB will be cut off by Caddy without emitting errors. This will cause some media messages fail to upload, and in turn, get bridged.
  - This is an issue plaguing all of the web infrastructure within LTGC for quite some while now.
- Animated stickers on certain platforms may only get their first frame be bridged, due to varying media codec support on different platforms.
- Double-bridged replies may not work on certain platforms.
- The bridge may become unresponsive when overloaded. You can help us relieve this problem via donations!

#### Telegram
- Reactions aren't bridged from Telegram.
- The Telegram bridge suffers from downtimes caused by Python, the underlying runtime. It has to be manually rebooted.
- The Telegram bridge will randomly become unresponsive for no other reason than the underlying Python runtime.
- Bot messages from Telegram cannot be bridged to other platforms, per Telegram's restriction.
- Senders from other platforms cannot be transparently bridged to Telegram, requiring embedding their display names as message content.

#### Discord
- Due to Discord validating time-sensitive HMAC codes on attachment URLs, media from Discord cannot be bridged currently.
  - This was fixed on 27th March 2024, where a combination of active and passive media proxying was deployed.

## Bridging service
### FLOSS projects
If applied and approved, we will offer free bridging services to the approved FLOSS projects.

* [RethinkDNS](https://rethinkdns.com) (Apache 2.0, MPL 2.0)
* [Xray](https://xtls.github.io/en/) (MPL)

### MLP fandom communities
We offer free bridging services to the approved communities within the MLP fandom after approval.

### Not-for-profit entities
We offer free bridging services to not-for-profit entities after approval.

* [Uncyclopedia (Traditional Chinese)](https://uncyclopedia.tw)

## Matrix media repo services
### Active Discord media proxy
As Discord began requiring expiring HMAC validations on media attachments, the Discord bridge now switches to an active proxying approach, before reuploading/re-serving re-encoded optimized media attachments becomes viable. Files delivered via this new approach will be served at `dma.ltgc.cc`.

### Passive Discord media proxy
Due to [MSC3860](https://github.com/matrix-org/matrix-spec-proposals/pull/3860) being unsupported on homeservers without conformation of the [Matrix 1.7 specification](https://github.com/matrix-org/synapse/issues/15661), homeservers will not recognize `discord-media.mau.dev`, the public redirecting Discord media repo. To circumvent this, we offer a custom cached Discord media proxy at `dmr.ltgc.cc` instead for use of bridges, however it will likely be shut down to public access if we notice it getting abused.

After Discord implemented expirations on media attachment links with HMAC validation, the media proxy now only serves non-attachment files, like avatars, stickers and custom emojis. Since passive media proxy is less costly to run than active media proxies, it's used whenever possible.