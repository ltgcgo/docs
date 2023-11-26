# Matrix services
Lightingale Community hosts several managed services on Matrix for ease of communication.

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

## Bridging service
### FLOSS projects
If applied, we will offer free bridging services to the approved FLOSS projects.

* [RethinkDNS](https://rethinkdns.com) (Apache 2.0, MPL 2.0)

### MLP fandom communities
We also offer free bridging services to the approved communities within the MLP fandom.

## Matrix media repo services
### Discord media proxy
Due to [MSC3860] being not supported on homeservers not implementing the [Matrix 1.7 specification](https://github.com/matrix-org/synapse/issues/15661), most Matrix homeservers will not recognize `discord-media.mau.dev`, the public redirecting Discord media repo. To circumvent this, we offer a custom cached Discord media proxy at `dmr.ltgc.cc` instead for use of bridges.

However, it will likely be shut down to public access if we notice it getting abused.