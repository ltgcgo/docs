# MIDI modes
Octavia Lyre is compatible with a range of modes on MIDI synthesizers. A list of supported modes to their respective keys are available below.

Do note that different modes will affect how events are interpreted. Further details on divergent behaviour can be read [here]().

## Provider list
When receiving GM and GM2 System On, Octavia Lyre can choose different target modes providing the desired set. Different modes also have different available voices and capabilities.

| Flavour | GM 1 | GM 2 |
| ------- | ---- | ---- |
| Neutral | `gm` | `g2` |
| (Cheap) | `css` | `css` |
| Gravis  | `gus` | |
| Korg    | `ns5r` | `pa` |
| Roland  | `gs` | `sd` |
| Yamaha  | `xg` | `xg` |

## Mode list
### Internal
- `?`: The default "nothing" mode, generally matching vendor-neutral General MIDI 2. Octavia Lyre will try to detect the correct mode in this mode, and its behaviour will not follow established hardware.
- `css`: (WIP) A generic provider (Cheap Software Synth). An alias to `?`, however Lyre will not attempt mode detection. Modelled after FluidSynth, compatible with Nokia MobileBAE.

### Non-GM
- `doc`: Yamaha DOC. DOC is short for Disk Orchestra Collection.
- `mt32`: Roland MT-32 and C/M. Modelled after Roland MT-32.
- `qy10`: Yamaha QY10 native.
- `qy20`: Yamaha QY20 native.

### GM 1
- `gm`: Vendor-neutral General MIDI. Modelled after TiMidity++.
- `05rw`: Korg 05R/W and Korg X5. Compatible with AG-10.
- `cs2x`: Yamaha CS2x. Compatible with CS1x.
- `cs6x`: Yamaha CS6x.
- `gs`: Roland GS. GS is short for General Sound. Modelled after Roland SC-8850.
- `gus`: Gravis UltraSound.
- `k11`: Kawai GMega or K11.
- `motif`: Yamaha Motif ES.
- `ns5r`: Korg NS5R. Compatible with NX5R, and has limited compatibility with Korg N1R and N5. Modelled after Korg NS5R.
- `s90es`: Yamaha S90 ES.
- `sc`: Roland GS mode, but with mode 1 or mode 2 set. Specific to Roland SoundCanvas SC-88 and SC-88 Pro. Modelled after SC-88 Pro.
- `sg`: Akai SG. Modelled after Akai SG-01k.
- `x5d`: Korg X5D(R). Compatible with AG-10.
- `xg`: Yamaha XG, both classic and modern. Compatible with TG-100 and TG-300. XG is short for eXtended General. Modelled after Yamaha MU2000EX.

### GM 2
- `g2`: Vendor-neutral General MIDI level 2.
- `krs`: Korg KROSS 2.
- `pa`: Korg PA. Targets PA50SD, PA80, PA1x, MicroArranger and equivalents. Modelled after Korg PA1x.
- `rhc`: Roland HyperCanvas.
- `sd`: Roland SD. Targets SD-20, SD-80 and SD-90. SD is used for Roland's Studio Canvas lineup. Modelled after Roland SD-90.
