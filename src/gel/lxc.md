## Container setup
### LXC
This section documents the processes of configuring LXC on distros supported by Gel.

#### Installation
- Alpine: `apk add lxc lxcfs lxc-download lxc-bridge`
- Debian: `apt install lxc`
- openSUSE: `zypper in lxc`
- Rocky Linux/AlmaLinux: `dnf install lxc lxcfs lxc-templates`
- Photon: N/A

#### Config files
- Container config files: `/var/lib/lxc/<name>/config`

#### Container creation from official templates
When creating containers from official templates, you'll be presented with a list of available distros, alongwith release names and CPU architectures. [Visit for the full list](https://images.linuxcontainers.org).

To select a source image directly without the selection prompt, use the following command.

```sh
lxc-create -t download -n "<name>" -- --dist <distro> --release <release> --arch <arch>
```

#### Assign static IPs
_From [Setup network bridge in lxc-net](https://stanislas.blog/2018/02/setup-network-bridge-lxc-net/)._

Create `/etc/lxc/dhcp.conf`. The definitions go in `dhcp-host=<containerName>,<ip>` format. Example below.

```ini
dhcp-host=deerHorny,10.0.3.114
dhcp-host=polakCute,10.0.3.115
```

If `/etc/default/lxc-net` exists, have the following line inside to tell `lxc-net` use the DHCP config before restarting the `lxc-net` service.

```sh
LXC_DHCP_CONFILE=/etc/lxc/dhcp.conf
```

#### Enable autostart
In the container config, have the following lines.

```ini
# Enable autostart
lxc.start.order = <startOrder> # Lower is earlier
lxc.start.auto = 1
lxc.start.delay = 4 # In seconds
```

#### Enable nested containerization
In the container config, have the following lines.

```ini
# Allow nested containerization
lxc.include = /usr/share/lxc/config/nesting.conf
```

#### Enable FUSE
In the container config, have the following lines.

```ini
# Enable FUSE
lxc.mount.entry = /dev/fuse dev/fuse none bind,create=file,rw 0 0
```

#### Enable TUN
In the container config, have the following lines.

```ini
# Enable TUN
lxc.mount.entry = /dev/net dev/net none bind,create=dir
lxc.cgroup2.devices.allow = c 10:200 rwm
```

#### Limit container network access
_From [How to restrict network access of LXC container](https://babarowski.com/blog/how-to-restrict-network-in-lxc/)._

#### Limit CPU and RAM usage
_From [Memory Controller ・cgroup2](https://facebookmicrosites.github.io/cgroup2/docs/cpu-controller.html)._

In the container config, follow the example provided below.

```ini
# Limit CPU and RAM
lxc.cgroup2.memory.min = 268435456
lxc.cgroup2.memory.max = 536870912
lxc.cgroup2.cpu.max = 500000 1000000
```

This sets the container to...

- Use at most 512 MiB of RAM (hard limit), with 256 MiB guaranteed (hard limit).
- Allows using half of a core's worth of computing power.

#### Raise limits on opened files
_From [Proxmox ulimit hell: how to really increase open files ?](https://forum.proxmox.com/threads/proxmox-ulimit-hell-how-to-really-increase-open-files.81073/)_

In `/etc/sysctl.conf`, make sure the following lines are present. Feel free to adjust the values to your needs.

```ini
fs.inotify.max_queued_events = 1048576
fs.inotify.max_user_instances = 1048576
fs.inotify.max_user_watches = 1048576
vm.max_map_count = 262144
```

In `/etc/security/limits.conf`, have the following lines. Feel free to adjust the values to your needs.

```ini
*     soft  nofile  1048576 unset
*     hard  nofile  1048576 unset
root  soft  nofile  1048576 unset
root  hard  nofile  1048576 unset
*     soft  memlock 1048576 unset
*     hard  memlock 1048576 unset
```

In the container config, have the following lines. Feel free to adjust the values to your needs.

```ini
# Raise limits on opened files
lxc.prlimit.nofile = 1048576
```

Inside the container, have the following lines in `/etc/security/limits.conf`. Feel free to adjust the values to your needs.

```ini
*     soft  nofile  1048576 unset
*     hard  nofile  1048576 unset
root  soft  nofile  1048576 unset
root  hard  nofile  1048576 unset
*     soft  memlock 1048576 unset
*     hard  memlock 1048576 unset
```

Reboot the host and the container(s) to apply the changes.

#### Manual unprivileged container setup
_Extended from [this blog post](https://blog.benoitblanchon.fr/lxc-unprivileged-container/)._

The containers configured these way are unprivileged, however they are owned by `root`, this is due to the problems surrounding unprivileged containers when owned by unprevileged users.

You can create the container before or after assigning subordinate IDs manually, but it must be done before modifying the container's configuration file. All commands in this section assume `root` privilege unless told explicitly otherwise.

##### Select and map subordinate IDs
Subordinate IDs permit mapping a range of IDs to a user, allowing the container to run unprivileged without the typical downsides. To avoid conflicts, it's advised to reserve a relatively large gap between different unprivileged containers in multiples of `65536`, the minimum required amount of subordinate IDs for running unprivileged containers of any kind.

You'll be editing `/etc/subuid` for user IDs, and `/etc/subgid` for group IDs. Both files follow the same scheme: `<username>:<startID>:<idCount>`. For example, `hornydeer:2097152:65536` maps IDs from `2097152` to `2162687` to user `hornydeer`, 65536 IDs in total. Comments are not allowed there.

As an example, we're setting the start UID and start GID to 1148576, and allocate 65536 IDs for use by the container. If you intend to have an LXC container act as a container host, you may need to scale up the count of IDs. Write the following line to both `/etc/subuid` and `/etc/subgid`.

```sh
root:1148576:65536
```

If you're going to run unprivileged containers inside the target unprivileged LXC, below is an example reserving enough subordinate IDs for use.

```sh
root:1148576:262144
```

##### Apply mapped IDs in configuration
To apply the mapped IDs, head to `/var/lib/lxc/<containerName>` and modify the `config` file. According to the containerized distro chosen, there may be seperate user namespace profiles, so switch to those if you encounter problems.

```ini
# Remapped user and group IDs
lxc.include = /usr/share/lxc/config/userns.conf
lxc.idmap = u 0 1148576 65536
lxc.idmap = g 0 1148576 65536
```

If you've chosen to use the larger ID space for unprivileged containers above, below is the corresponding example.

```ini
# Remapped user and group IDs
lxc.include = /usr/share/lxc/config/userns.conf
lxc.idmap = u 0 1148576 262144
lxc.idmap = g 0 1148576 262144
```

##### Change owner of the container root
Before the LXC container could be started, the owner of its root folder must be set as the beginning subordinate ID, `1148576` in the case of the example. Run the following command.

```sh
chown -R 1148576:1148576 /var/lib/lxc/<containerName>/rootfs
```

Also ensuring the container itself can access its own filesystem for good measure.

```sh
chmod 755 /var/lib/lxc # Most distros already has this as default
chmod 755 /var/lib/lxc/<containerName>
chmod 755 /var/lib/lxc/<containerName>/rootfs
chmod 640 /var/lib/lxc/<containerName>/config
```

### Podman
This section documents the processes of setting up Podman on distros supported by Gel. To get Podman functioning, `fuse` and `tun` support has to be present.

If you're running Podman inside an (unprivileged) LXC container, make sure the steps listed below have all been applied to the host LXC container, all of which could be found above.

- Assign a larger ID space
- Enable FUSE
- Enable nested containerization
- Enable TUN
- Raise limits on opened files

#### Installation
> **Warning**
> 
> - Certain distros (e.g. Debian) may not have a functioning version of `crun`. Install `crun` from [Nixpkgs](https://search.nixos.org) when such errors are encountered.
> - A few distros like Photon do not have `podman-compose` bundled.
> - If you encounter warnings regarding `/` not being shared, fix temporarily with `mount --make-rshared /`. Read [Alpine Wiki](https://wiki.alpinelinux.org/wiki/Podman#Shared_mount) for further info.

- Alpine: `apk add podman podman-compose`
- Debian: `apt install podman podman-compose`
- openSUSE: `zypper in podman podman-compose`
- Rocky Linux/AlmaLinux: `dnf install podman podman-compose`
- Photon: `tdnf install podman`

After installation, run a "Hello World" container to ensure everything works correctly.

```sh
podman run --rm hello-world
```

If problems occur, below is an example command for debugging.

```sh
podman run --security-opt="seccomp=unconfined" --log-level=debug --rm hello-world
```

#### Manual subordinate ID assign
> **Note**
> Distros may already have this section configured automatically. Only follow this section when you encounter problems.

Explanations about subordinate IDs are [available in previous sections](#select-and-map-subordinate-ids). If you encounter Podman complaining about IDs, below is an example inside unprivileged LXC containers to apply in both `/etc/subuid` and `/etc/subgid`.

```sh
<username>:65536:131072
```

Run `podman system migrate` whenever the assigned subordinate ID space changes.