# Scope
> **Warning**
> 
> - The JS version of Scope only runs on Linux. A Go/Rust/C# AOT rewrite is expected to fix this.
> - Scope is alpha-quality software. While it can work, use it at your own risk.
> - While Scope is tested extensively with a cluster with around 20 peers, there's no guarantee that it can scale to larger ones.
> - Scope's direct peer connection currently **only** works on networks with open NATs (NAT type 1-3). It may fall back to relayed connection via hubs only if configured.

Scope is a WireGuard network orchestration utility mainly geared towards establishing meshed networks, inspired by the poorly-maintained [`wgsd`](https://github.com/jwhited/wgsd). Unlike `wgsd`, Scope utilizes HTTP for information exchange and UDP for connectivity probe.

Scope allows use cases like:

- Direct peer connection via UDP hole punching, if behind [open UDP NAT](https://tailscale.com/blog/how-nat-traversal-works#naming-our-nats)<sup>1</sup>.
- Build a dynamic mesh network of (mostly) directly connected WireGuard peers, with automatic migration and allows joining and leaving at will.
- Rotate PSKs to existing networks with [ML-KEM](https://en.wikipedia.org/wiki/Kyber) and [X448](https://en.wikipedia.org/wiki/Curve448), ensuring post-quantum security.
- Build a mesh tree network, where only hubs are the directly connected peers (mesh), and traffic between edges must be routed through the mesh.

1. "Open UDP NAT" means UDP NAT with endpoint-independent mapping, which only includes the following UDP NAT: full-cone (type 1), restricted cone (type 2), port-restricted cone (type 3).

## How does it work?
1. A central registry server is configured.
2. An edge client connects to the registry server, then requests for a list of peers to connect to, as well as broadcasting a peer join message (`cc.ltgc.scope:peerJoin`). The peer join message causes every other edge client to add the new peer.
3. The edge client attempts connection to all of these peers, prioritizing IPv6 unless told otherwise, and spins up the UDP service, pinging all servers at a 2-second interval.
4. After 8 seconds, if no echoes are observed on certain peers, the edge client moves from the prioritized address to a less prioritized one (usually IPv4) on these unresposive peers.
5. After 16 seconds, all peers will report their observed endpoint of the new peer, as well as the latency. The new joining peer should now already connect to all existing peers on networks with open UDP NAT.
6. After 20 seconds, a peer connect message is broadcast (`cc.ltgc.scope:peerConn`) from the new edge peer. All peers who did not observe pings from UDP will then start actively connecting back to the new peer on the observed endpoints (same behaviour on Scope 0.0.x), in which should observe success if the new peer itself is not behind a network with non-open UDP NAT.
7. After 60 seconds, if all existing attempts fail, scope will then fall back to hub mode.

## Further reading
To install Scope, consult the [installation guide](./install.md).

To observe the actual API and messaging schema, read the [API docs](./api.md).
