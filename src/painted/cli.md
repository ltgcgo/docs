# Command line
The Windows build does not ship with a helper like `./palette-bot `. As such, please replace `./palette-bot ` with `deno run --allow-read --allow-write --allow-net `.

If you need to specify custom proxies, define the `https_proxy` environment variable (e.g. `https_proxy=http://127.0.0.1:4444/`). On Linux with Deno or Bun, there are direct proxy integrations available, which can be used by replacing `./palette-bot ` with either `./palette-proxy ` for public proxy pools, or `./palette-tor ` for Tor.

## Environment variables
* `HTTP_PROXY`: Used by Deno and Bun to connect to upstream proxies.
* `HTTPS_PROXY`: Same as above. Must be the same as `HTTP_PROXY`.
* `NO_UPDATE`: Set to `1` to disable the automatic updater.
* `PORT`: Set the listening port.
* `SLEEP`: Set to `1` to behave as if `./palette-bot ctl sleep` is run.

## `./palette-bot help`
Prints help messages.

## `./palette-bot paint`
Deprecated and not recommended. Paint on Reddit with given credentials.

Format: `./palette-bot paint <username> <password> <otp>`

Examples:

* Direct login: `./palette-bot paint myCoolName myGoodPassword`
* Direct login with 2FA codes: `./palette-bot paint myCoolName myGoodPassword 114514`

## `./palette-bot pixel`
Removed. Paint on VKontakte with given credentials.

Same format as `./palette-bot paint`.

## `./palette-bot test`
Deprecated and not recommended. Paint on the test server with given credentials.

Same format as `./palette-bot paint`.

## `./palette-bot batch`
Start a batch mode server for account management, complete with Web UI and REST API.

Since version 0.0.16, manual mode became the default - pixel placements require user interaction, and only a single account is allowed.

Format: `./palette-bot batch <port>`

## `./palette-bot ctl`
Send commands to a running batch server. Define the target port which the batch server listens on with the environment variable `PORT`.

Format: `./palette-bot ctl <subcommand> <...args>`

### Subcommands
#### 