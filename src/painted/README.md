# Painted Palette
Painted Palette is a headless bot implemented purely in JavaScript, which helps pixel placements on r/place. It is developed for the My Little Pony factions, but can work for any other faction with modification.

If the codebase isn't modified, in auto mode, Painted Palette runs on a defensive stance by default - as long as pixels covered by the template aren't badly damaged, it barely activates. If in manual mode, Painted Palette only places pixels when the user commands or schedules a pixel placement.

## Features
* Extremely fast to build, fast and easy to deploy for anyone. IT prowness is not a problem.
* No dependency compiling before running.
* Fully-unattended automated updates.
* Relatively low on resources.
* Native support for multi-account deployments. (less than 10 per IP address)

## Installation
> **Warning**
> 
> Node.js on Windows does not respect proxy settings. If proxies are needed, switch to Deno instead.

With an acceptable Internet connection, the whole installation process should not take more than 20 seconds. On POSIX systems, the figure is even lower.

If you're up for the task, feel free to contribute, and expand our horizon of OS support!

### Windows
1. Download the latest version of [`node_windows.zip`](https://github.com/ltgcgo/painted-palette/releases/latest/download/node_windows.zip).
2. Extract `node_windows.zip` to an appropriate folder of your liking.

### Linux, Android, macOS
1. Ensure `bash`, `curl` and `unzip` are available.
2. Assign `export VARIANT=node`.
3. Make sure you have either Node.js 18 or Node.js 19 installed.
4. Run `bash <(curl -Ls https://github.com/ltgcgo/painted-palette/raw/main/src/bash/install.sh)`.

## Running
> **Warning**
> 
> Despite our efforts on bot detection evasion, when not in manual mode, running the bot on your main is generally considered a bad idea. Please use disposable alts when in auto mode.

For more advanced usage, please refer to [command line](cli.md) docs.

### Windows (default GUI only)
* Double-click `webui.cmd`, and click on the link it provides. Should point to <a target="_blank" href="http://127.0.0.1:14514/">127.0.0.1:14514</a> by default.
  * If the browser displays an error page, run `winFix.cmd` first, then restart `gui.cmd` to see if the problem goes away.

### Linux, Android, macOS

* Run `./palette-bot batch`, and click on the link it provides.
* Do you have Tor installed on your system? If yes and you're using Deno, run `./palette-tor batch` to use it without the tedious configuration process!
* Are you running Painted Palette with Deno on Linux? If yes, run `./palette-proxy batch` to connect to public proxy pools with ease!

### Windows (CLI)
* Open a terminal session where `webui.cmd` is located.
* Run with `.\node.exe node.js <arguments>`.

### Podman/Docker
* Clone the repo via `git clone https://github.com/ltgcgo/painted-palette.git palette`.
* Switch into `oci` via `cd ./palette/oci`.
* Run `docker-compose up -d` if on Docker, or `podman-compose up -d` if on Podman.

## Open Source
Painted Palette is a piece of open-source software, licensed under GNU GPL 3.0.

Source code: [GitHub](https://github.com/ltgcgo/painted-palette)