# Media requirements
*These requirements are heavily influenced by [our own content encoding guidelines](./encode.md) and [Technical Delivery Standards of BBC](https://www.bbc.co.uk/delivery/technical-requirements).*

> **Warning**
> 
> As the purpose of these guidelines are to ensure a mininum viable set of quality standards that does not interfere the enjoyment of the audience, as such they are intentionally made to be more lenient than what BBC requires. If you intend to publish media tuned to broadcasters' requirements, please refer to their related specifications.
> - [BBC](https://www.dropbox.com/s/sjsjlf4qtm68xc3/TechnicalDeliveryStandardsBBCFile.pdf?dl=0) (2020)
> - [ARD](https://www.ard.de/die-ard/TPRF-HDTV-2016-Technische-Richtlinien-zur-Herstellung-von-Fernsehproduktionen-in-HDTV-102.pdf) (2016)
> - [TF1 (incomplete)](https://tf1pro.com/sites/default/files/atoms/files/specifications_techniques_groupe_tf1_v7.2_amande_uhd-1-nov2021.pdf) (2020)

This document is not yet complete.

## Production
### Audio
#### Encode
*Under no circumstances shall MP3 (MPEG Audio Layer III) be used.*

<div><table><thead style="text-align: center"><tr>
	<td rowspan=2>Aspect</td>
	<td colspan=2>Delivery</td>
	<td colspan=2>Production</td>
</tr><tr>
	<td>Minimum</td>
	<td>Recommended</td>
	<td>Minimum</td>
	<td>Recommended</td>
</tr></thead><tbody><tr>
	<td>Sample rate</td>
	<td>44.1 kHz</td>
	<td>48 kHz</td>
	<td>44.1 kHz</td>
	<td>48 kHz</td>
</tr><tr>
	<td>Bit depth</td>
	<td>16</td>
	<td>20</td>
	<td>18</td>
	<td>24</td>
</tr><tr>
	<td>Lossy (Opus)</td>
	<td>160kbps</td>
	<td>192kbps</td>
	<td colspan=2 rowspan=4></td>
</tr><tr>
	<td>Lossy (Vorbis)</td>
	<td>176kbps</td>
	<td>208kbps</td>
</tr><tr>
	<td>Lossy (AAC-LC)</td>
	<td>192kbps</td>
	<td>224kbps</td>
</tr><tr>
	<td>Lossy (AC-3, 5.1ch)</td>
	<td>320kbps</td>
	<td>384kbps</td>
</tr></tbody></table></div>

For production purposes, lossless audio is always preferred, while lossy audio with at least the "generic" quality set can be used when unavailable.

For audio content encoded as integers and not already at 48 kHz, the maximum suggested true peak should stay at -3 dBFS due to possible clipping during sample rate conversion; such samples exceeding -3 dBFS shall be regarded as exceeding safe ranges.

For delivery, Opus, Vorbis and AAC-LC should be chosen in the decending order as situation requires. 5.1 surround sound content can be delivered via AC-3 with the suggested parameters.

#### Mixing

### Subtitles & lyrics
#### Encode
#### Styling

### Video
#### Encode
