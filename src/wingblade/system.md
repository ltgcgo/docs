# System
## `WingBlade.rt.cores`
### Use
Report the amount of CPU cores.

### Syntax
```js
Number: WingBlade.rt.cores
```

## `WingBlade.rt.exit`
### Use
Exit the current runtime with given status code. `0` by default.

### Syntax
```js
undefined: WingBlade.rt.exit(Number: code = 0);
```

## `WingBlade.rt.memory`
### Use
Report memory usage of the current runtime. All values are in bytes.

### Syntax
```js
MemoryUsage: WingBlade.rt.memory
```

```js
{
	external: Number, // Memory associated with JS objects outside of the JS isolate.
	free: Number, // The size of available RAM.
	heapTotal: Number, // The total size of the heap of the JS engine.
	heapUsed: Number, // The size of the heap used by the JS engine.
	rss: Number, // Resident Set Size, aka memory occupied in RAM.
	total: Number // The total size of the RAM.
}
```

## `WingBlade.rt.networkDefer`
### Use
Indicate whether or not the current runtime is only allowed network access during triggering.

Useful for serverless functions.

### Syntax
```js
Boolean: WingBlade.rt.networkDefer
```

## `WingBlade.rt.os`
### Use
Report the current operating system. Examples include `windows`, `darwin` and `linux`.

### Syntax
```js
String: WingBlade.rt.os
```

## `WingBlade.rt.persist`
### Use
Indicate whether or not the current runtime executes persistent sessions. If reports `false`, the runtime will only be activated upon triggering, and will be destroyed when the triggered tasks finish.

Useful for serverless functions.

### Syntax
```js
Boolean: WingBlade.rt.persist
```

## `WingBlade.rt.variant`
### Use
Report the name of the current runtime WingBlade runs on. Examples include `Node`, `Deno` and `Bun`.

### Syntax
```js
String: WingBlade.rt.variant
```

## `WingBlade.rt.version`
### Use
Report the version of the current runtime WingBlade runs on.

### Syntax
```js
String: WingBlade.rt.version
```