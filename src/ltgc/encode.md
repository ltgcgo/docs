# Content encoding
None of the encodings listed are involved with patent concerns.

<div><table>
	<thead><tr>
		<th>Usage</th>
		<th>Encoding</th>
		<th>Extension</th>
	</tr></thead>
	<tbody><tr>
		<td rowspan=4><b>Rasterized image</b></td>
		<td>JPEG XL</td>
		<td><code>.jxl</code></td>
	</tr><tr>
		<td>JPEG</td>
		<td><code>.jpg</code></td>
	</tr><tr>
		<td>WebP</td>
		<td><code>.webp</code></td>
	</tr><tr>
		<td>AVIF</td>
		<td><code>.avif</code></td>
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
		<td rowspan=3><b>Web compression</b></td>
		<td>Zstd</td>
		<td><code>.zst</code></td>
	</tr><tr>
		<td>Brotli</td>
		<td><code>.br</code></td>
	</tr><tr>
		<td>gzip</td>
		<td><code>.gz</code></td>
	</tr><tr>
		<td rowspan=3><b>Bundle compression</b></td>
		<td>lzip</td>
		<td><code>.lz</code> <code>.tlz</code></td>
	</tr><tr>
		<td>bzip2</td>
		<td><code>.bz2</code> <code>.tbz2</code></td>
	</tr><tr>
		<td>xz</td>
		<td><code>.xz</code> <code>.txz</code></td>
	</tr><tr>
		<td><b>Font</b></td>
		<td>WOFF2</td>
		<td><code>.woff2</code></td>
	</tr></tbody>
</table></div>

Read below for further details.

## Rasterized image encoding
### Lossy still
As WebP is properly supported in every browser built for systems newer than Windows XP, and it offers better quality-to-size ratio than all JPEG encoders, it is considered the best fallback format. However, as JPEG XL exists as an all-around better universal image format, lossy images should also be encoded with JPEG XL whenever possible.

Compared to all other image formats, JPEG XL offers jawdropping image fidelity, unmatched quality-to-size ratio, proper progressive loading and better responsiveness. The cherry on top of JPEG XL would be its ability to losslessly transcode from existing JPEG files, offering about 20% size reduction with cheap JPEG lossless bitstream reconstruction, which paves its way to be a backwards-compatible drop-in replacement for image storage and distribution.

Things to take notice of:

* mozJPEG-fronted JPEG, while offering a good choice for backwards-compatibility, shouldn't be used unless necessary when size is a consideration. mozJPEG is generally superseded by `jpegli`.
* AVIF offers an advantage on size, when progressive support, boundary artifacts and codec performance (slower than all others multiple times) aren't in consideration.
* AVIF is observed to have fewer observable artifacts for images with a simpler shading.
* The reference AVIF settings provide a balancing point between JXL `-d 1` and JXL `-d 2`.
* `jpegli` for JPEG from the JPEG XL team are being looked upon. If possible, it will provide a reasonable front for backwards-compatible JPEG XL encoding.

Explanations of image encoding uses:
* **Delivery**: Size-first with generally-acceptable quality.
* **Archival**: Balance between size and quality.
* **Near-lossless**: Shaving as much size as possible, while still being mostly indistinguishable, even when zoomed in at 200%.

| Uses | SSIMULACRA2 | Butteraugli | DSSIM |
| ---- | ----------- | ----------- | ----- |
| Delivery | 80 | 2.0 | |
| Archival | 85 | 1.0 | |
| Near-lossless | 90+ | 0.4- | |

Based on experiments, the size ratio values approach expectation on a large scale. Lossless inputs induce lower expectations, while lossy inputs induce higher expectations. Individual images may have varied results.

<div class="table-wrapper"><table>
	<thead><tr>
		<th>Codec</th>
		<th>Use</th>
		<th>Params</th>
		<th>Ratio</th>
	</tr></thead>
	<tbody><tr>
		<td rowspan=4>JPEG XL</td>
		<td>Delivery (quality)</td>
		<td><code>cjxl -j 0 -d 2 -e 7 -p --progressive_dc 1</code></td>
		<td>8.46%</td>
	</tr><tr>
		<td>Delivery (speed)</td>
		<td><code>cjxl -j 0 -d 2 -e 4 -p --progressive_dc 1</code></td>
		<td>-</td>
	</tr><tr>
		<td>Archival</td>
		<td><code>cjxl -j 0 -d 1 -e 7 -p --progressive_dc 1</code></td>
		<td>13.8%</td>
	</tr><tr>
		<td>Near-lossless</td>
		<td><code>cjxl -j 0 -m 1 -d 0.25 -e 7</code></td>
		<td>27.1%</td>
	</tr><tr>
		<td rowspan=4>WebP</td>
		<td>Delivery (quality)</td>
		<td><code>cwebp -m 5 -psnr 56 -qrange 90 99</code></td>
		<td>20.5%</td>
	</tr><tr>
		<td>Delivery (speed)</td>
		<td><code>cwebp -m 5 -q 95</code></td>
		<td>18.4%</td>
	</tr><tr>
		<td>Archival</td>
		<td><code>cwebp -m 5 -q 99</code></td>
		<td>-</td>
	</tr><tr>
		<td>Near-lossless</td>
		<td><code>cwebp -near_lossless 60</code></td>
		<td>62.7%</td>
	</tr><tr>
		<td>AVIF</td>
		<td>Delivery</td>
		<td><code>[effort=4,lossless=false,Q=90]</code></td>
		<td>15%</td>
	</tr></tbody>
</table></div>

The full feature set comparison chart is [available on Cloudinary](https://res.cloudinary.com/cloudinary-marketing/image/upload/w_700,c_fill,f_auto,q_auto,dpr_2.0/Web_Assets/blog/Battle-of-the-Codecs_fnl.png).

![Battle of the image codecs!](https://res.cloudinary.com/cloudinary-marketing/image/upload/w_700,c_fill,f_auto,q_auto,dpr_2.0/Web_Assets/blog/Battle-of-the-Codecs_fnl.png)

### Lossless still
JPEG XL lossless and WebP lossless are mostly on par, either could be the better solution at times. For compatibility reasons, WebP lossless should always be offered, while JPEG XL lossless could be offered only when the resulting file is smaller than that of WebP lossless. AVIF lossless is currently consistently worse than either JPEG XL or WebP, as such it's not recommended at all.

Do *not* enable progressive encoding for JPEG XL lossless, or the resulting file will be several times bigger than PNG files.

| Codec | Parameters | Ratio |
| ----- | ---------- | ----- |
| JPEG XL | `cjxl -j 0 -d 0 -e 7` | 70.2% |
| WebP | `cwebp -m 6 -lossless` | 78.1% |

### Lossy animated
Lossy animated WebP is the current baseline for animated image sequences, while lossy animated AVIF offers the best quality against others by a wide margin. Lossy animated JPEG XL doesn't offer a significant advantage against WebP, and is currently beaten by AVIF.

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

Keep in mind that the scenario under "basic" indicates that, all audio content encoded with provided parameters should be virtually indistinguishable from LAME-encoded MP3 files at 192kbps.

### Lossless
Streaming lossless audio is generally considered a bad idea due to high bandwidth usage. It's generally more useful for archival purposes.

You should choose FLAC when...
- Browser support is needed.
- The target is severely underpowered.
- The target only supports FLAC for lossless audio compression.

You should choose WavPack when...
- You need a smaller file.
- Higher bit depth is needed (more than 24).

| Codec | Parameters |
| ----- | ---------- |
| WavPack | `wavpack -hhvx -x 3` |
| FLAC | `flac -V8 -e --no-padding -f` |

## Compression
### Web
Brotli should be preferred over `gzip` at all times. Static low-entropy content (e.g. plain text files) should always be pre-compressed, with or without the original uncompressed file available. For dynamic content compression, `zstd` at level 8 consumes less than half of the resources used for Brotli, all the while outperforming Brotli on the output size.

For static precompression, the original file can be omitted when the space is constrained, serving only precompressed blobs. When compatibility with other infrastructure isn't in consideration, precompressed `gzip` files can also be omitted, although it's not recommended in most cases. Zstd isn't suitable for static precompression, as even at compression level 22 it falls behind Brotli at its highest compression level. However, a recommendation is still available for reasonable reference.

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
		<td rowspan=2>Zstd</td>
		<td>Real-time</td>
		<td><code>zstd -8</code></td>
	</tr><tr>
		<td>Precompression</td>
		<td><code>zstd -16</code></td>
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
`lzip` is the de-facto standard of bundle compression, featuring good compression ratio with data recovery abilities. Quality should always set to `9`, unless a lower quality value is proven to yield a better result for smaller files, or time constraints are set.

`bzip2` or `xz` should only be considered for compatibility purposes.

## Font
As practically all modern browsers support the WOFF2 font format, all required TrueType and OpenType fonts must be served as WOFF2 files instead. If for unspecified reasons that original files must be served, always consider precompression and avoid storing uncompressed files.