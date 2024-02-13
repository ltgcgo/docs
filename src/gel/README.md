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

## Usage
### Native
For bare-metal, virtual machines and LXC containers. Do <u>not</u> run native install scripts other than on new machines.

1. On any of the supported distros, make sure `curl` is available.
2. Execute `sh <(curl -Ls https://github.com/ltgcgo/gel/releases/latest/download/install.sh)`.
3. Connect to the SSH with `ssh -p 1122 <serverIP>`. User passwords won't change, but SSH settings will. See the [SSH](#ssh) section for details.

#### Additional considerations
##### Alpine Linux
Gel needs the community repo to be enabled in order to function.

##### openSUSE Leap
`doas` is not available on the platform. The regular `sudo` is used instead.

### Containers
Container images are only offered as a convenient way of inspecting the installations.

1. Spin up one of the available Gel flavours.
    1. Images are available on the [Docker Hub](https://hub.docker.com/r/ltgc/gel) if you want to save time. Use `podman pull docker.io/ltgc/gel:<flavour>` to pull the images.
    2. Or feel free to build the image yourself with `./shx up <flavour>`.
2. Connect to the SSH with `ssh -p 1122 root@127.0.1.1`. The default password is `root`.

## Security
### Privilege elevation
To reduce attack surface, Gel will attempt to replace `sudo` with `doas` from OpenBSD. By default, only the `root` user is allowed to use the `doas` command.

To allow other users to execute the `doas` command as `root`, append the following directives to a new line in `/etc/doas.conf`.

```
permit keepenv <user> as root
```

Make sure there is a trailing new line at the end of `/etc/doas.conf`. If not, `doas` command will not work.

### SSH
The SSH settings will be changed with a relatively more secure one, except for permitting password logins to prevent you from losing access with an unfinished setup.

After finishing the automated Gel setup, do the following to secure your SSH access.

1. If the password of the `root` user wasn't set by you, change it to a stronger one.
2. Add a custom new user, which would be used for SSH logins.
3. As the newly-created custom user, add the public keys used for SSH authorization.
4. Keep the current SSH session active, and login as the new user to ensure access to machine is not lost.
5. Allow the new user to use the `doas` command and verify. See the [Privilege elevation](#privilege-elevation) section for details.
6. Add the new user to the `sshuser` group, added automatically by the setup script. Example: `usermod -aG sshuser <user>`.
7. In `/etc/ssh/sshd_config`, do the following.
  * Set `PermitRootLogin` from `yes` to `no`.
  * Uncomment `AllowGroups` and `DenyGroups`.
  * (optional) Change the listening port from `1122` to another.
8. Restart `sshd` with `systemctl restart sshd`.