## Container setup
### LXC
This section documents the processes of configuring LXC on distros supported by Gel.

#### Installation
- Alpine: `apk add lxc lxcfs lxc-download lxc-bridge`
- Debian: `apt install lxc lxcfs lxc-templates uidmap libpam-cgfs bridge-utils --no-install-recommends`
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

#### Assign static IPv4 addresses
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
_From [Proxmox ulimit hell: how to really increase open files ?](https://forum.proxmox.com/threads/81073/)_

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
#### `nftables`
The default config for `nftables` looks like this.

```sh
#!/usr/sbin/nft -f

flush ruleset

table inet filter {
	chain input {
		type filter hook input priority filter;
	}
	chain forward {
		type filter hook forward priority filter;
	}
	chain output {
		type filter hook output priority filter;
	}
}
```

- It's possible to match multiple ports at the same time. Instead of specifying a single port number (e.g. `443`), use curly braces: `{443, 8443}`. Ranges can also be specified: `1024-2047`.
- If a certain rule only applies to traffic originating from certain interfaces, prefix the rule with `iif <interface>`. Can be a single interface (e.g. `iif "eth0"`) or multiple (e.g. `iif {"eth0", "ens15"}`).

##### Transparent service exposure
_From [nftables: forwarding without masquerading](https://serverfault.com/questions/1034595/), [Quick reference: nftables in 10 minutes](https://wiki.nftables.org/wiki-nftables/index.php/Quick_reference-nftables_in_10_minutes)_.

Because the LXC host is the network gateway of all LXC containers, service exposure without masquerading is entirely possible, allowing services inside LXC slices to obtain the actual IP addresses. Add the block below to begin specifying rules for service exposure.

If you want to expose services on both IPv4 and IPv6, rules will need to be duplicated. It's also important to note that containers must have the respective IP version available, for it to be exposed transparently. LXC 6.0.0 and newer has IPv6 addresses assigned automatically, while 4.0.0 and newer can have IPv6 manually configured. Only LXC 5.0.0 and newer supports IPv6 connectivity behind NAT.

```sh
table ip nat {
	chain prerouting {
		type nat hook prerouting priority filter;
		# Insert new rules for IPv4 here
	}
}
table ip6 nat {
	chain prerouting {
		type nat hook prerouting priority filter;
		# Insert new rules for IPv6 here
	}
}
```

Let's say we want to expose `10.0.3.2:443` for anyone on the Internet to access on port 443.

```sh
tcp dport 443 dnat to 10.0.3.2
```

If the port numbers are not the same, the port will need to be overriden.

```sh
tcp dport 443 dnat to 10.0.3.2:8443
```

Or multiple ports are to be exposed without overriding the port.

```sh
tcp dport {443, 8443} dnat to 10.0.3.2
tcp dport 512-1023 dnat to 10.0.3.2
```

Or only expose access to (a) certain interface(s).

```sh
iif "eth0" tcp dport 443 dnat to 10.0.3.2
iif {"eth0", "vlan0"} tcp dport 443 dnat to 10.0.3.2
```

An example of a rule with similar use under IPv6.

```sh
iif "he-ipv6" tcp dport {80, 443} dnat to [fc11:4514:1919:810::ff:fe00:2]
```

Flush your rulesets with the command below, so LXC slices will still have connectivity via NAT after flushing.

```sh
nft -f /etc/nftables.conf; systemctl restart lxc-net
```

##### Network access restriction - IP-based
_Inspired by [How to restrict network access of LXC container](https://babarowski.com/blog/how-to-restrict-network-in-lxc/)._

> **Notice**
> 
> `nftable`-based network access control is still under investigation. Problems are expected to rise.
> 
> If fine-grained access control like destination-matching (e.g. domain) is desired, use EEP with transparent proxy on the host instead.
> 
> Since the current `nftables` approach requires [static IPs](#assign-static-ipv4-addresses) to be assigned first, but there is no way found to have IPv6 addresses assigned statically, IPv6 access might need to be disabled for the container.

The `inet filter forward` section is where network access of individual containers is filtered.

If whitelisted network access is desired, add a rule in the scheme shown below to the end of the section for that specific container.

```sh
iif "lxcbr0" ip saddr 10.0.3.2 drop;
```

Then add allowed access ranges before the final drop to grant access to specific addresses. If problems occur with transparent service exposure, they will need to be made exempt.

```sh
iif "lxcbr0" ip saddr 10.0.3.2 ip daddr 10.0.3.0-10.0.3.255 accept;
```

Or if network access isn't whitelisted, and access to certain ranges are to be blocked, add a rule in the scheme shown below.

```sh
iif "lxcbr0" ip saddr 10.0.3.2 ip daddr 10.0.3.2-10.0.3.255 drop;
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