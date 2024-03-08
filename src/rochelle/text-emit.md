# Text emitter
## API
### Static properties
* `SPLIT_UTF_8`: Split by UTF-8. Also used by encodings like Shift JIS.
* `SPLIT_UTF_16LE`: Split by UTF-16LE.
* `SPLIT_UTF_16BE`: Split by UTF-16BE.

### Constructor
```js
new TextEmitter(stream: ReadableStream, splitMode: Number, label: String);
```

* `stream`: The source stream of strings to read from.
* `splitMode`: How to determine valid line feed (`0x0a`) and carriage return (`0x0d`) characters. Valid values are listed as `SPLIT_*` static properties.
* `label`: One of the [valid labels](https://developer.mozilla.org/en-US/docs/Web/API/Encoding_API/Encodings). _Not implemented._

### Events
#### `chunk`
```js
MessageEvent<Uint8Array>
```
When a raw chunk is received from the stream.

#### `close`
```js
Event
```
When the stream or the emitter closes.

#### `error`
```js
ErrorEvent
```
When the emitter encounters a critical error.

#### `fail`
```js
MessageEvent<Uint8Array>
```
When a line of text becomes available, but decoding failed. Returns the raw bytes.

#### `raw`
```js
MessageEvent<Uint8Array>
```
When a line of text becomes available before decoding begins. Returns the raw bytes.

Raw line data will be flushed from buffer when the stream closes unexpectedly.

#### `text`
```js
MessageEvent<String>
```
When a line of text becomes available. Returns the decoded line of text.

### Properties
#### `closed`
_Not implemented._

```js
Boolean: TextEmitter.closed
```

If the text emitter is closed.

### Methods
#### close()
_Not implemented._

```js
undefined: TextEmitter.close()
```

Close the current stream.