## Container setup
### LXC
#### Installation
- Alpine: `apk add lxc lxcfs lxc-download lxc-bridge`
- Debian: `apt install lxc`
- openSUSE: `zypper in lxc`
- Rocky Linux/AlmaLinux: `dnf install lxc lxcfs lxc-templates`
- Photon: N/A

#### Config files
- Container config files: `/var/lib/lxc/<name>/config`

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

##### Apply mapped IDs in configuration
To apply the mapped IDs, head to `/var/lib/lxc/<containerName>` and modify the `config` file. According to the containerized distro chosen, there may be seperate user namespace profiles, so switch to those if you encounter problems.

```ini
# Remapped user and group IDs
lxc.include = /usr/share/lxc/config/userns.conf
lxc.idmap = u 0 1148576 65536
lxc.idmap = g 0 1148576 65536
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