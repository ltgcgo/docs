# state.mjs API
All constants and interfaces documented here are guaranteed to work, and very likely not subject to further changes.

## Constants
### MIDI modes
Octavia is compatible with a range of modes on MIDI synthesizers. A list of supported modes to their respective keys is available below.

* `?`: The default "nothing" mode. Octavia will try to detect the correct mode.
* `gm`: General MIDI mode.
* `gs`: Roland GS mode. GS is short for General Sound.
* `xg`: Yamaha XG mode. Compatible with TG-100 and TG-300. XG is short for eXtended General.
* `sc`: Roland GS mode, but with mode 1 or mode 2 set. Specific to Roland SoundCanvas SC-88 and up.
* `g2`: General MIDI Level 2 mode.
* `sd`: Roland SD mode. SD is used for Roland's Studio Canvas lineup.
* `ns5r`: KORG NS5R mode. Compatible with NX5R, and has limited compatibility with KORG N1R and N5.
* `x5d`: KORG X5D(R) mode. Compatible with AG-10.
* `05rw`: KORG 05R/W and KORG X5 mode. Compatible with AG-10.
* `k11`: Kawai GMega or K11 mode.
* `sg`: Akai SG mode.
* `krs`: KORG KROSS 2 mode.
* `s90es`: Yamaha S90 ES mode.
* `motif`: Yamaha Motif ES mode.
* `mt32`: Roland MT-32 mode.
* `doc`: Yamaha DOC mode. DOC is short for Disk Orchestra Collection.
* `qy10`: Yamaha QY10 native mode.
* `qy20`: Yamaha QY20 native mode.

### MIDI event types
* `8`: Note off
* `9`: Note on
* `10`: Note aftertouch, a.k.a. polyphonic aftertouch
* `11`: Channel controller change
* `12`: Channel program change
* `13`: Channel aftertouch
* `14`: Channel pitch bend
* `15`: System exclusive message

### `allocated`
### `ccToPos`

## Interfaces
### `OctaviaDevice`
