# gel
⛏ Rolling server bases, batteries included.

Gel is a set of scripts to quickly prepare supported base Linux distributions for use in cloud, aiming to lessen the burden interacting with servers. For Alpine Linux, it comes with a simple OpenRC wrapper to get several `systemctl` commands working for OpenRC.

Gel is extensively used throughout Lightingale Community's infrastructure.

## Flavours
Gel comes with two flavours for each supported base distribution: **slim** and **full**.

The full flavour targets all sorts of servers. Unless storage is severely constrained, this is the flavour to go for.

The slim flavour targets container hosts and VM hosts, which barely gets interacted directly, but still requires the ease-of-use found in the full version of Gel. It can also be used in other scenarios, if the full flavour contains packages you'd prefer not to be present on your system.

### Full list
| Slim | Full | Name | LXC ready? |
| ---- | ---- | ---- | ---------- |
| `slimalp` | `alpine` | Alpine Stable | No |
| `slimalma` | `alma` | AlmaLinux | Yes |
| `slimdeb` | `debian` | Debian Stable | Yes |
| `slimleap` | `leapsuse` | openSUSE Leap | Yes |
| `slimsuse` | `opensuse` | openSUSE Tumbleweed | No |
| `slimrock` | `rocky` | Rocky Linux | Yes |
| `photon` | N/A | Photon Linux | No |

## Usage & Security
Further instructions [available here](usage.md).