# MIDI modes
Octavia Lyre is compatible with a range of modes on MIDI synthesizers. A list of supported modes to their respective keys are available below.

Do note that different modes will affect how events are interpreted. Further details on divergent behaviour can be read [here]().

## Providers
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
<div class="table-wrapper"><table><thead><tr>
	<th>Category</th>
	<th>ID</th>
	<th>Full name</th>
</tr></thead><tbody><tr style="background:#90f3;">
	<td rowspan=2>Internal</td>
	<td><code>?</code></td>
	<td>Unknown</td>
</tr><tr>
	<td><code>css</code></td>
	<td>Cheap Software Synth</td>
</tr><tr style="background:#f803;">
	<td rowspan=4>Pre-GM</td>
	<td><code>doc</code></td>
	<td>Yamaha Disk Orchestra Collection</td>
</tr><tr>
	<td><code>mt32</code></td>
	<td>Roland MT-32 (C/M, Computer Music)</td>
</tr><tr>
	<td><code>qy10</code></td>
	<td>Yamaha QY10</td>
</tr><tr>
	<td><code>qy20</code></td>
	<td>Yamaha QY20</td>
</tr><tr style="background:#05f3">
	<td rowspan=14>GM 1</td>
	<td><code>gm</code></td>
	<td>General MIDI level 1</td>
</tr><tr>
	<td><code>05rw</code></td>
	<td>Korg 05R/W, Korg X5</td>
</tr><tr>
	<td><code>cs2x</code></td>
	<td>Yamaha CS2x (Control Synth)</td>
</tr><tr>
	<td><code>cs6x</code></td>
	<td>Yamaha CS6x (Control Synth)</td>
</tr><tr>
	<td><code>gs</code></td>
	<td>Roland General Sound</td>
</tr><tr>
	<td><code>gus</code></td>
	<td>Gravis UltraSound</td>
</tr><tr>
	<td><code>k11</code></td>
	<td>Kawai GMega/K11</td>
</tr><tr>
	<td><code>motifes</code></td>
	<td>Yamaha Motif ES (Expanded System)</td>
</tr><tr>
	<td><code>ns5r</code></td>
	<td>Korg NS5R</td>
</tr><tr>
	<td><code>s90es</code></td>
	<td>Yamaha S90 ES (Expanded System)</td>
</tr><tr>
	<td><code>sc</code></td>
	<td>Roland SoundCanvas (GS mode set)</td>
</tr><tr>
	<td><code>sg</code></td>
	<td>Akai SG</td>
</tr><tr>
	<td><code>x5d</code></td>
	<td>Korg X5D(R)</td>
</tr><tr>
	<td><code>xg</code></td>
	<td>Yamaha Extended General</td>
</tr><tr style="background:#0f03">
	<td rowspan=5>GM 2</td>
	<td><code>g2</code></td>
	<td>General MIDI level 2</td>
</tr><tr>
	<td><code>krs</code></td>
	<td>Korg KROSS 2</td>
</tr><tr>
	<td><code>pa</code></td>
	<td>Korg Professional Arranger</td>
</tr><tr>
	<td><code>rhc</code></td>
	<td>Roland HyperCanvas</td>
</tr><tr>
	<td><code>sd</code></td>
	<td>Roland StudioCanvas SD</td>
</tr></tbody></table></div>

### Internal
- `?`: The default "nothing" mode, generally matching vendor-neutral General MIDI 2. Octavia Lyre will try to detect the correct mode in this mode, and its behaviour will not follow established hardware.
- `css`: (WIP) A generic provider (Cheap Software Synth). An alias to `?`, however Lyre will not attempt mode detection. Modelled after FluidSynth, compatible with MobileBAE.

### Pre-GM
- `doc`: Yamaha DOC. DOC is short for Disk Orchestra Collection.
- `mt32`: Roland MT-32 and C/M. Modelled after Roland MT-32.
- `qy10`: Yamaha QY10 native.
- `qy20`: Yamaha QY20 native.

### Non-GM
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
- `sg`: Akai SG. Modelled after Akai SG01k.
- `x5d`: Korg X5D(R). Compatible with AG-10.
- `xg`: Yamaha XG, both classic and modern. Compatible with TG-100 and TG-300. XG is short for eXtended General. Modelled after Yamaha MU2000EX.

### GM 2
- `g2`: Vendor-neutral General MIDI level 2.
- `krs`: Korg KROSS 2.
- `pa`: Korg PA. Targets PA50SD, PA80, PA1x, MicroArranger and equivalents. Modelled after Korg PA1x.
- `rhc`: Roland HyperCanvas.
- `sd`: Roland SD. Targets SD-20, SD-80 and SD-90. SD is used for Roland's Studio Canvas lineup. Modelled after Roland SD-90.
