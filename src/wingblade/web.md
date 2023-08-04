# Web services
## `WingBlade.web.serve`
### Use
Start a web server with a handler function.

### Syntax
```js
WebServer: WingBlade.web.serve(AsyncFunction<Response>: handler, ?ServeInit: opt = {});
```

Read [`ServeInit@std/http/server`](https://deno.land/std@0.195.0/http/server.ts?s=ServeInit) for more details.

#### `handler`
```js
let handler = async function (Request: request, ConnInfo: connInfo) {
	return new Response();
};
```

## `WingBlade.web.acceptWs`
### Use
Upgrade the incoming request to a WebSocket connection.

### Syntax
```js
UpgradedWebSocket: WingBlade.web.acceptWs(Request: req, UpgradeWebSocketOptions: opt);
```

#### `UpgradedWebSocket`
```js
{
	response: Response, // The upgrade response for the client
	socket: WebSocketServer // Server-side WebSocket
}
```

#### `UpgradeWebSocketOptions`
```js
{
	protocol: String,
	idleTimeout: Number
}
```

Read [Deno.UpgradeWebSocketOptions](https://deno.land/api?s=Deno.UpgradeWebSocketOptions) for details.

## `WingBlade.web.acceptSSE`
### Use
Upgrade the incoming request to a Server-sent Event (`EventSink`) connection.

### Syntax
```js
UpgradedSSE: WingBlade.web.acceptSSE(Request: req);
```

#### `UpgradedSSE`
```js
{
	response: Response, // The upgrade response to the client
	socket: EventSink // Server-side EventSource
}
```