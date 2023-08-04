# System
## System info
### `WingBlade.rt.exit`
#### Use
Exit the current runtime with given status code. `0` by default.

#### Syntax
```js
undefined: WingBlade.rt.exit(Number: code = 0);
```

### `WingBlade.rt.memUsed`
#### Use
Report memory usage of the current runtime. Refer to [`Deno.MemoryUsage`](https://deno.land/api?s=Deno.MemoryUsage) for details.

#### Syntax
```js
MemoryUsage: WingBlade.rt.memUsed
```

### `WingBlade.rt.networkDefer`
#### Use
Indicate whether or not the current runtime is only allowed network access during triggering.

Useful for serverless functions.

#### Syntax
```js
Boolean: WingBlade.rt.networkDefer
```

### `WingBlade.rt.os`
#### Use
Report the current operating system. Examples include `windows`, `darwin` and `linux`.

#### Syntax
```js
String: WingBlade.rt.os
```

### `WingBlade.rt.persist`
#### Use
Indicate whether or not the current runtime executes persistent sessions. If reports `false`, the runtime will only be activated upon triggering, and will be destroyed when the triggered tasks finish.

Useful for serverless functions.

#### Syntax
```js
Boolean: WingBlade.rt.persist
```

### `WingBlade.rt.variant`
#### Use
Report the name of the current runtime WingBlade runs on. Examples include `Node`, `Deno` and `Bun`.

#### Syntax
```js
String: WingBlade.rt.variant
```

### `WingBlade.rt.version`
#### Use
Report the version of the current runtime WingBlade runs on.

#### Syntax
```js
String: WingBladde.rt.version
```

## Environment variables
###