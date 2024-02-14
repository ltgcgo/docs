# Content encoding
None of the encodings listed are involved with patent concerns.

<div><table>
	<thead><tr>
		<th>Usage</th>
		<th>Encoding</th>
		<th>Extension</th>
	</tr></thead>
	<tbody><tr>
		<td rowspan=2><b>Rasterized image</b></td>
		<td>JPEG XL</td>
		<td><code>.jxl</code></td>
	</tr><tr>
		<td>WebP</td>
		<td><code>.webp</code></td>
	</tr><tr>
		<td><b>Vector image</b></td>
		<td>SVG</td>
		<td><code>.svg</code></td>
	</tr><tr>
		<td rowspan=3><b>Lossy audio</b></td>
		<td>Opus</td>
		<td><code>.opus</code></td>
	</tr><tr>
		<td>Vorbis</td>
		<td><code>.ogg</code></td>
	</tr><tr>
		<td>AAC-LC</td>
		<td><code>.m4a</code> <code>.aac</code></td>
	</tr><tr>
		<td rowspan=2><b>Lossless audio</b></td>
		<td>WavPack</td>
		<td><code>.wv</code></td>
	</tr><tr>
		<td>FLAC</td>
		<td><code>.flac</code></td>
	</tr><tr>
		<td rowspan=2><b>Web compression</b></td>
		<td>Brotli</td>
		<td><code>.br</code></td>
	</tr><tr>
		<td>gzip</td>
		<td><code>.gz</code></td>
	</tr><tr>
		<td rowspan=3><b>Bundle compression</b></td>
		<td>bzip2</td>
		<td><code>.bz2</code> <code>.tbz2</code></td>
	</tr><tr>
		<td>lzip</td>
		<td><code>.lz</code> <code>.tlz</code></td>
	</tr><tr>
		<td>xz</td>
		<td><code>.xz</code> <code>.txz</code></td>
	</tr></tbody>
</table></div>

Read below for further details.

## Rasterized image encoding
### Lossy
As WebP is properly supported in every browser built for systems newer than Windows XP, and it offers better quality-to-size ratio than all JPEG encoders, it is considered the best fallback format. However, as JPEG XL exists as an all-around better universal image format, lossy images should also be encoded with JPEG XL whenever possible.

Compared to all other image formats, JPEG XL offers jawdropping image fidelity, unmatched quality-to-size ratio, proper progressive loading and better responsiveness. The cherry on top of JPEG XL would be its ability to losslessly transcode from existing JPEG files, offering about 20% size reduction with cheap JPEG lossless bitstream reconstruction, which paves its way to be a backwards-compatible drop-in replacement for image storage and distribution.

MozJPEG-fronted JPEG XL encoding hasn't been tested yet.

<div><table>
	<thead><tr>
		<th>Codec</th>
		<th>Use</th>
		<th>Params</th>
	</tr></thead>
	<tbody><tr>
		<td rowspan=2>JPEG XL</td>
		<td>Delivery</td>
		<td><code>cjxl -d 2.2 -e 4 -p</code></td>
	</tr><tr>
		<td>Archival</td>
		<td><code>cjxl -d 1.1 -e 4 -p</code></td>
	</tr><tr>
		<td rowspan=2>WebP</td>
		<td>Delivery</td>
		<td><code>cwebp -m 5 -psnr 56</code></td>
	</tr><tr>
		<td>Archival</td>
		<td><code>cwebp -m 5 -q 99</code></td>
	</tr></tbody>
</table></div>

The full feature set comparison chart is [available on Cloudinary](https://res.cloudinary.com/cloudinary-marketing/image/upload/w_700,c_fill,f_auto,q_auto,dpr_2.0/Web_Assets/blog/Battle-of-the-Codecs_fnl.png).

![Battle of the image codecs!](https://res.cloudinary.com/cloudinary-marketing/image/upload/w_700,c_fill,f_auto,q_auto,dpr_2.0/Web_Assets/blog/Battle-of-the-Codecs_fnl.png)

### Lossless
WebP Lossless should always be offered when lossless image codecs are required. JPEG XL Lossless should only be offered alongside when it proves to be smaller than WebP in a case-by-case scenario.

## Audio encoding
### Lossy
When high sampling rates are required, choose Vorbis. When support for the Apple ecosystem is required, choose AAC-LC. Otherwise use Opus under all possible scenarios, but beware that Opus only supports sampling at 48kHz.

Below are the suggested bitrates under different scenarios, when encoding stereo audio content under either 44.1kHz or 48kHz. Audio content should be encoded with constrained variable bitrate (CVBR).

The AAC-LC encoder in question is `libfdk_aac`, being the best FOSS AAC-LC encoder out there. The only AAC-LC encoder better than `libfdk_aac` is Apple's Audio Toolbox, which is proprietary and not in consideration.

| Codec  | Basic   | Stream  | Balanced | Generic | Quality |
| ------ | ------- | ------- | -------- | ------- | ------- |
| Opus   | 96kbps  | 144kbps | 160kbps  | 192kbps | 256kbps |
| Vorbis | 128kbps | 160kbps | 192kbps  | 224kbps | 320kbps |
| AAC-LC | 128kbps | 160kbps | 192kbps  | 224kbps | 320kbps |

Keep in mind that the scenario under "basic" indicates that, all audio content encoded with provided parameters should be virtually undistinguishable from LAME-encoded MP3 files at 192kbps.

### Lossless
Streaming lossless audio is generally considered a bad idea.

When web support isn't planned, or the target platforms aren't severely underpowered, WavPack is the recommended codec for storing lossless audio. Recommended encoding parameters for the official CLI util: `wavpack -hhvx -x 3`

## Compression
### Web
Brotli should be preferred over `gzip` at all times. Static low-entropy content (e.g. plain text files) should always be pre-compressed, with or without the original uncompressed file available.

<div><table>
	<thead><tr>
		<th>Algorithm</th>
		<th>Use</th>
		<th>Params</th>
	</tr></thead>
	<tbody><tr>
		<td rowspan=2>Brotli</td>
		<td>Real-time</td>
		<td><code>brotli -4</code></td>
	</tr><tr>
		<td>Precompression</td>
		<td><code>brotli -q 11</code></td>
	</tr><tr>
		<td rowspan=2>gzip</td>
		<td>Real-time</td>
		<td><code>gzip -4</code></td>
	</tr><tr>
		<td>Precompression</td>
		<td><code>zopfli --i25</code></td>
	</tr></tbody>
</table></div>

### Bundle
`bzip2` should be the default bundle compression algorithm, unless either `lzip` or `xz` is proven to be better in a case-by-case scenario. Quality should always set to `9`, unless a lower quality value is proven to yield a better result for smaller files.

Due to platform differences, `xz` should be avoided for automation scripts that may install compression algorithms on the fly.