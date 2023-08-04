# Environment variables
> **Note**
> 
> `WingBlade.env` can also be used as a normal JavaScript `Object`.

## `WingBlade.env.get`
### Use
Return an environment variable, and supply a fallback value if given.

### Syntax
```js
?String: WingBlade.env.get(String: key, ?String: fallbackValue);
```

## `WingBlade.env.set`
### Use
Set an environment variable with given value.

### Syntax
```js
undefined: WingBlade.env.set(String: key, String: value);
```

## `WingBlade.env.delete`
### Use
Remove an environment variable.

### Syntax
```js
undefined: WingBlade.env.delete(String: key);
```

## `WingBlade.env.has`
### Use
Indicate whether or not an environment variable exists.

### Syntax
```js
Boolean: WingBlade.env.has(String: key);
```

## `WingBlade.env.toObject`
### Use
Return a snapshot of all current environment variables as an `Object`.

### Syntax
```js
Object: WingBlade.env.toObject();
```