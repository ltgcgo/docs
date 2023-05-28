# Silk
Silk is an attempt to unify timelines of the MLP fandom on the Fediverse. It is achieved by merging all public timelines of instances with Mastodon-compatible APIs, and accounts that followed this account if on other instances. To avoid stressing tracked servers and accounts, WebSocket and SSE connections are utilized whenever possible, with caches enforced.

By bringing the MLP fandom on the Fediverse together, we attempt to make the Fediverse an appealing place for bronies and pegasisters alike, without any grip from a commercial entity. Find interesting people, discover content creators, anything is possible.

Don't know what Fediverse is? [Read this explanation](https://www.littleshyfim.com/brony-mastodon) written by LittleshyFiM.

Don't know which server to join? A list of servers is [available here](include.md#instances)!

* [Inclusion](include.md): What's included in the timeline, and which server to join.
* [Moderation](mod.md): How we moderate the merged timeline.
* [Usage](use.md): How to use Silk.

## Technical implementation
The list of servers to merge timelines can be customized, while moderation on specific users are implemented with existing Mastodon features. Accounts muted by the hook account are excluded from any self-service exemptions, while ones blocked by the hook account are excluded from the timeline altogether.

## Hook accounts
The primary hook account is used for storing moderation information. Other instances usually do not need a hook account to be set up to read the local timeline.

Not every instance has its public timeline open to everyone though. As such, additional hook accounts are required on these instances.

Below is the list of hook accounts.

* <a rel="me" href="https://equestria.social/@silk">@silk@equestria.social</a> (primary)
* <a rel="me" href="https://social.inex.rocks/@silk">@silk@social.inex.rocks</a>

## Open Source
Silk is a piece of open source software, licensed under GNU AGPL 3.0 or later.

If ready for public use, source code would be available on [GitHub](https://github.com/ltgcgo/silk/).
