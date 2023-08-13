# Web Stream
## Quick `ReadableStream` convertion
> **Warning**
> 
> If the stream exploits the same `ArrayBuffer` to emit chunks, at least on Deno, all of the readings will error out.
> 
> The Deno implementation may take twice as much RAM usage as on other runtimes.

### `ReadableStream.prototype.array()`
### `ReadableStream.prototype.arrayBuffer()`
### `ReadableStream.prototype.blob()`
### `ReadableStream.prototype.json()`
### `ReadableStream.prototype.text()`

## Stream behaviour modification
### `ChokerStream`
#### Use
Apply chunk-size normalization to the attached stream.

The chunk first gets written to the normalized buffer, and if the buffer exceeds the target chunk size, a normalized chunk will get emitted. If the attached stream closes, all remaining data in the buffer will also be emitted.

#### Syntax
```js
let object = new ChokerStream(Number: maxChunkSize = 1024, Boolean: alwaysCopy = false);
```
```js
ChokerStream {
	alwaysCopy: Boolean, // Read-only. Indicates whether chunks should be copied.
	chunk: Number, // A positive integer defining the normalized chunk size.
	source: ReadableStream, // Get the choked readable stream.
	sink: ReadableStream, // Read-only. The attached readable stream source.
	attach: function () {} // Attach to a readable stream source.
}
```