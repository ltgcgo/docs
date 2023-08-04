# Filesystem
## `WingBlade.file.read()`
### Use
Read the whole file as `Uint8Array`.

### Syntax
```js
Promise<Uint8Array>: WingBlade.file.read(String: path, Object<ReadFileOptions>: opt);
```

Read [`Deno.ReadFileOptions`](https://deno.land/api?s=Deno.ReadFileOptions) for the `opt` params.

## `WingBlade.file.write()`
### Use
Write the whole `Uint8Array` as a file.

### Syntax
```js
Promise<undefined>: WingBlade.file.write(String: path, Uint8Array: data, Object<WriteFileOptions>: opt);
```

Read [`Deno.WriteFileOptions`](https://deno.land/api?s=Deno.WriteFileOptions) for the `opt` params.