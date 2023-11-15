# shx
📜 Bash/PDKSH shell action executor. A replacement for `npx`, `deno task` and etc.

All actions for `shx` should be written for Bash.

## Supported shells
* AT&T `ksh93`
  * Directory traversal does not work on ksh93 due to incorrect `IFS` behaviour.
  * Cannot be used as a runner.
* Bash
* Zsh

## Usage
```sh
shx [<action> [<arguments>]]
```

Scripts will be run with Bash when present. If not, they'll be run with any supported shell.

## Standard actions
`shx` comes with a collection of QoL standard actions.

* `amend`: Update and amend the current commit, then push to remote.
* `build`: A placeholder action for projects using `shx` to build themselves.
* `commit`: Create a new commit, then push to remote.
* `echob`: Printing bold text in the terminal.
* `push`: A combination of `shx build` and `shx commit`.
* `release`: Bundle build results into an archive. Configurable _(upcoming)_.
* `sh`: Spawn a [Nix](https://nixos.org)-powered shell with all development dependencies met.
* `tag`: Tag the current commit, then push the tag to remote.
* `which`: Fallback for environments not offering a `which` command.