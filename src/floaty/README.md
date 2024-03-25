# Floaty
Floaty is a Caddy plugin implementing customizable rolling random IDs on a per-host basis, providing easy access via placeholders in Caddy.

Uses include:

* Loopback prevention
* Multi-hop debugging
* Forced time-based rolling sticky hash wherever needed

All with little to no traceability, if the rolling duration is set correctly.

## Usage
### Caddyfile
In the global section, set Floaty to run before request header processing.

```sh
{
	order floaty before header
}
```

In any of the server blocks, use the `floaty` directive to prepare the respective rolling random IDs. The syntax is as follows.

```sh
floaty [length [rollDuration]] [{
	[fieldId [length [rollDuration]]]
}]
```

Whenever Floaty is initialized, the placeholder `http.floaty` would become available within that server block, where placeholders from HTTP handlers are accessible.

When not defined, pool names are generated randomly upon server block provisioning. Floaty pools with the same pool name share the same set of pools. If two Floaty pools with the same name differ on field settings, when trying to modify settings of an existing field, Caddy will error out.

Generated ID lengths can be any value between `4` and `96`, and out-of-bound values will be clamped into this range. By default, length is set to `8`. Longer IDs may cause unwanted CPU consumption.

Roll duration can be set to any value above 10 seconds with millisecond precision, if supported by the [Go duration syntax](https://pkg.go.dev/time#ParseDuration). It's set to 15 minutes by default. A lower rolling duration may cause unwanted CPU consumption.

#### Examples
Adding a response header with a default Floaty ID:

```sh
http://:8080 {
	...
	floaty
	header X-Floaty {http.floaty}
	...
}
```

Adding a request header with a Floaty ID to reverse proxies, while blocking requests with a matching Floaty ID:

```sh
http://:8080 {
	...
	floaty {
		instance_id 12 10m
		source_id 12 5m
	}
	...
	@directLoopback {
		header X-Previous-Hop {http.floaty.instance_id}
	}
	@indirectLoopback {
		header X-Source-Hop {http.floaty.source_id}
	}
	respond @directLoopback "Loopback denied" 403
	respond @indirectLoopback "Loopback denied" 403
	...
	reverse_proxy {
		...
		header_up X-Previous-Hop {http.floaty.instance_id}
		header_up ?X-Source-Hop {http.floaty_source_id}
	}
	...
}
```