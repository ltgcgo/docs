# gel
⛏ Rolling server bases, batteries included.

Gel is a set of scripts to quickly prepare supported base Linux distributions for use in cloud, aiming to lessen the burden interacting with servers. For Alpine Linux, it comes with a simple OpenRC wrapper to get several `systemctl` commands working for OpenRC.

Gel is extensively used throughout Lightingale Community's infrastructure, either for host servers or for LXC containers. Read more on [infrastructure](../ltgc/infra.md).

## Flavours
Gel mostly comes with two flavours for each supported base distribution: **slim** and **full**.

The full flavour targets all sorts of servers. Unless storage is severely constrained, this is the flavour to go for.

The slim flavour targets container hosts and VM hosts, which barely gets interacted directly, but still requires the ease-of-use found in the full version of Gel. It can also be used in other scenarios, if the full flavour contains packages you'd prefer not to be present on your system.

### Full list

| Slim | Full | Name | LXC ready? | LXC base size |
| ---- | ---- | ---- | ---------- | ------------- |
| `slimalp` | `alpine` | Alpine Stable | No | 11 MiB |
| `slimalma` | `alma` | AlmaLinux | Yes | 433 MiB |
| `slimdeb` | `debian` | Debian Stable | Yes | 363 MiB |
| `slimleap` | `leapsuse` | openSUSE Leap | Yes | 190 MiB |
| `slimsuse` | `opensuse` | openSUSE Tumbleweed | No | - |
| `slimrock` | `rocky` | Rocky Linux | Yes | 433 MiB |
| `photon` | N/A | Photon Linux | No | N/A |

## Usage & Security
- [Installation and primitive security](usage.md)
- [LXC setup](lxc.md)