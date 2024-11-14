## Installation
### Native
For bare-metal, virtual machines and LXC containers. Do <u>not</u> run native install scripts other than on new machines.

1. On any of the supported distros, make sure `curl` is available.
2. Execute `sh <(curl -Ls https://github.com/ltgcgo/gel/releases/latest/download/install.sh)`. (or `sh <(curl -Ls https://codeberg.org/ltgc/gel/releases/download/latest/install.sh)`, use `GEL_SLIM=1` to enable slim installation)
3. Connect via SSH with `ssh -p 1122 <serverIP>`. User passwords won't change, but SSH settings will. See the [SSH](#ssh) section for details.

### Containers
Container images are only offered as a convenient way of evaluating the installations.

1. Spin up one of the available Gel flavours.
    1. Images are available on the [Docker Hub](https://hub.docker.com/r/ltgc/gel) if you want to save time. Use `podman pull docker.io/ltgc/gel:<flavour>` to pull the images.
    2. Or feel free to build the image yourself with `./shx up <flavour>`.
2. Connect to the SSH with `ssh -p 1122 root@127.0.1.1`. The default password is `root`.

## Additional considerations
### Offloading RAM
> **Warning**
> 
> Avoid offloading RAM in guests as much as possible, when the root host you have access to of the guest could have RAM offloading enabled instead.

Gel does not configure RAM offloading automatically in any way.

#### `swap`
When enabled, the system will swap memory pages used less frequently off the active RAM, freeing up system resources whenever possible. This will lessen the impact of memory hungry processes, at the cost of disk wear and tear.

`swap` comes in two types, disk partition and files. Swapfiles are generally not supported in certain file systems like `btrfs`, however they're much more flexible compared to disk partitions, since they could be created without threatening the underlying filesystem and can have multiple active simultaneously, as such swapfiles should be preferred whenever possible.

Depending on the actual size of RAM and remaining vacancy on the disk, the chosen size of the swap is generally between 50% and 200% of it. Generally for a system with small RAM (e.g. 1 GB), a swap with the size of 2 GiB is desired; for a system with large RAM (e.g. 32 GB), a swap with the size of 16 GiB could be considered sufficient. If you want to have hibernation enabled on your system, the swap size should be no smaller than the physical RAM.

To create a 2 GiB swapfile at `/swapfile` (1048576 * 1024 * 2), run the following commands as `root`.

```sh
dd if=/dev/zero of=/swapfile bs=1048576 count=2048
mkswap /swapfile
chmod 600 /swapfile
```

To enable the swapfile immediately, run the following command. Disabling the swapfile only needs to change the `swapon` command to `swapoff`.

```sh
swapon /swapfile
```

If the swapfile at `/swapfile` needs to be loaded automatically across reboots, open `/etc/fstab` and append the following line.

```
/swapfile   none    swap    sw  0   0
```

#### `zswap`
Requires `swap` to be enabled. `zswap` creates a compressed cache in RAM for system to swap pages off to, before the system decides to offload to the on-disk swap instead. Enabling `zswap` on top of `swap` helps to lessen the burden dumped onto the disk, make memory usage more efficient, while increasing responsiveness, as some of the infrequently accessed pages now resides in the much-faster RAM instead.

To see the current configurations for `zswap`, run the following command.

```sh
grep -R . /sys/module/zswap/parameters
```

Stastistics for `zswap` is also available.

```sh
grep -R . /sys/kernel/debug/zswap
```

Enabling `zswap` is as easy as running the following command as `root`.

```sh
echo 1 > /sys/module/zswap/parameters/enabled
```

`zswap` will use at most 20% of your actual RAM to store the compressed cache. Let's say you want to adjust the allocation percentage to 25%.

```sh
echo 25 > /sys/module/zswap/parameters/max_pool_percent
```

To see the current compression factor of the system, run the commands below.

```sh
cd /sys/kernel/debug/zswap
perl -E "say $(cat stored_pages) * 4096 / $(cat pool_total_size)"
```

Distributions typically choose `lz4` or `lzo` as the compression algorithm for `zswap`, however `zstd` is also available for more powerful devices. `lzo` is slightly slower than `lz4` for a slightly higher compression factor. `lz4` is recommended for most use cases, which could be set with the command below.

```sh
echo lz4 > /sys/module/zswap/parameters/compressor
```

A list of typical compression factors is available below, as well as the source of the data.

| Algorithm | Factor |
| --------- | ------ |
| `lz4` | 2.1 |
| `lzo` | 2.15 |
| `zstd` | 3 |

![The deer is always horny.](https://i.imgur.com/EDLZNUZ.png)

### Alpine Linux
#### Additional repos
Gel needs the community repo to be enabled in order to function.

#### glibc compatibility
While not done by default, Alpine installations come bundled with a helper script configuring `glibc` compatibility. It may not work under every situation, but it should handle most use cases. `root` is required.

```sh
bash ~/gel/distro/sh/glibc.sh
```

### openSUSE Leap
`doas` is not available on the platform. The regular `sudo` is used instead.

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