# raven

💨 Lightning-fast intuitive typing.

## Target scripts
* [Arabic script](./arabic.md)
* [Cyrillic script](./cyrillic.md)
* [English phonetic alphabets](./en-alt.md)
* [Mongolian](./mn.md)

## Usage
### `m17n`
[`m17n`](https://www.nongnu.org/m17n/) is an IME library for mapped stream conversion of characters. To develop schemas for `m17n`, read the [database tutorial](https://www.nongnu.org/m17n/manual-en/m17nDBTutorial.html#im-struct).

`m17n` is included in both [IBus](https://github.com/ibus/ibus) (Intelligent Input Bus) and [`fcitx5`](https://fcitx-im.org).

#### Linux
* Get the required `.mim` files.
* Check if the IME framework of your system supports `m17n`. Most Linux desktop distros with IBus has `m17n` support included by default.
* Check if directory `~/.m17n.d/` exists for the current user. If not, create it via `mkdir ~/.m17n.d/`.
* Copy the `.mim` files you want to use to `~/.m17n.d`.
* Restart your IME framework.
  * If on IBus, run `ibus restart`.

#### Android
> **Warning**
> 
> No input methods on Android support `m17n` currently. For its possible support on Android, please check out the [issue](https://github.com/fcitx5-android/fcitx5-android/issues/414) in the [`fcitx5-android`](https://github.com/fcitx5-android/fcitx5-android) project.

### Rime
[Rime](https://rime.im) is an IME framework for implementing custom input schemas for different languages. To develop schemas for Rime, [read here](https://github.com/rime/home/wiki/RimeWithSchemata) (machine translation required).

Rime is supported on [Linux via IBus](https://github.com/rime/ibus-rime), [Windows](https://github.com/rime/weasel) and [macOS](https://github.com/rime/squirrel). Platform support is extended with forks, e.g. for fcitx5 ([`fcitx-rime`](https://github.com/fcitx/fcitx-rime)), Android ([Trime](https://github.com/osfans/trime)) and iOS ([Hamster](https://github.com/imfuxiao/Hamster), [iRime](https://github.com/jimmy54/iRime)).

The official Rime documentation is only available in Orthodox Chinese.

#### Linux
* Get the required `.yaml` files. Check for files ending in `.schema.yaml`, `.dict.yaml` and `.custom.yaml`.
* Copy the `.yaml` files to `~/.config/ibus/rime/`.
* (Optional) Customize the new schema as you see fit.
* Enable the new schema in `~/.config/ibus/rime/default.custom.yaml`.
* Redeploy Rime via `touch ~/.config/ibus/rime/; ibus restart`.

#### Windows
* Get the required `.yaml` files. Check for files ending in `.schema.yaml`, `.dict.yaml` and `.custom.yaml`.
* Copy the `.yaml` files to `%APPDATA%\\Rime`.
* (Optional) Customize the new schema as you see fit.
* Enable the new schema in `%APPDATA%\\Rime\\default.custom.yaml`.
* Redeploy Rime via start menu or right-click menu of the taskbar icon.

#### Android
##### fcitx5-android
TBD.

##### Trime
TBD.