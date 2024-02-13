# gel
⛏ Rolling server bases, batteries included.

Gel is a set of scripts to quickly prepare supported base Linux distributions for use in cloud, aiming to lessen the burden interacting with servers. For Alpine Linux, it comes with a simple OpenRC wrapper to get several `systemctl` commands working for OpenRC.

Gel is never intended to be used as a base image for containers, as the ease-of-use provided by Gel has little sense to exist in base container images.

Gel is extensively used throughout Lightingale Community's infrastructure.

## Flavours
Gel comes with two flavours for each supported base distribution: **slim** and **full**.

The full flavour targets all sorts of servers. Unless storage is severely constrained, this is the flavour to go for.

The slim flavour targets container hosts and VM hosts, which barely gets interacted directly, but still requires the ease-of-use found in Gel. It can also be used in other scenarios, if the full flavour contains packages you'd like not to be present on your system.

### Full list
| Slim | Full | Name | LXC ready? |
| ---- | ---- | ---- | ---------- |
| `slimalp` | `alpine` | Alpine Stable | No |
| `slimdeb` | `debian` | Debian Stable | Yes |
| `slimsuse` | `opensuse` | openSUSE Tumbleweed | No |
| `slimleap` | `leapsuse` | openSUSE Leap | Yes |
| `slimrock` | `rocky` | Rocky Linux | Yes |
| `slimalma` | `alma` | AlmaLinux | Yes |
<!--| `slimfed` | `fedora` | Fedora Linux |-->

## Usage & Security
[Read here](usage.md).