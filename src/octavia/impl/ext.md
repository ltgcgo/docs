# Extensions
## Port assign
Octavia supports the following ways of specifying port assignment: standard port assign, XGworks port assign.

### Standard port assign
This is a single-byte meta event of type `33` (`0x21`).

`pp`

- `pp`: `00`..`ff` → Port 1..256

### XGworks port assign
This is an implementation-specific meta event with schema provided below.

`43 00 01 pp`

- `pp`: `00`..`ff` → Port 1..256

## Lyrics
Octavia supports the following ways of specifying lyrics: standard lyrics, text event substitution, XF lyrics.

### Standard lyrics
This is a variable-length meta event of type `05` (`0x05`).

To make any SMF parser function normally, the character encoding used must be backwards-compatible with ASCII. While suitable for use in any way desired, for karaoke capabilities, data programmers must follow the standard authored by AMEI (United States) and TUNE1000 Corporation (Canada). Below is an extension compatible to both of the mentioned standards.

Despite the original version devised by the TUNE1000 Corporation requires the file to be in format 0 (single track), Octavia has no problem handling format 1 (multiple single-channel tracks) and format 2 (multiple mixed-channel tracks) files just fine without a constraining hardware.

#### Escape sequences
#### Controls
##### Word break
When the space character ` ` is received, a word will be broken. Karaoke implementations should not consider word breaks in their duration calculation.

##### End of line
When either `\v` (extension) or `\r` (AMEI) is received, a new line is signaled.

##### End of paragraph
When `\n` (AMEI) is received, a new paragraph/section is signaled.

#### Tags
##### Text encoding
##### Song information
##### Tag end
#### Rubies
#### Lyrics feed

### Text event substitution
Developed by TUNE1000 Corporation under the supposed name "Soft Karaoke".

As the name used by Octavia suggests, these events hijack the standard text meta events. When toggled on, the text event substitution parser will take over the text event emitter.

Despite the original version devised by the TUNE1000 Corporation requires the file to be in format 1 (multiple single-chanel tracks), Octavia has no problem handling format 0 (single track) and format 2 (multiple mixed-channel tracks) files just fine without a constraining hardware.

#### Toggle
Upon receiving the karaoke trigger among the text events, the text event substitution lyrics parser shall take over for the majority of the text events, leaving only tags intact. See "karaoke trigger" below for information.

#### Tags
Tag parsing shall be exempt from lyrics handling. Tags all precede with `@`, with the exact type specified for only a single byte. Each text event can only contain a single tag.

##### Karaoke trigger
Specified with `@K`. Contains either file type or copyright information.

More often than not, you will receive `@KMIDI KARAOKE FILE` than any other text event. If the event is received exactly as-is, no copyright information will be displayed from it.

##### Language
##### Title
##### Information

### XF lyrics
Developed by Yamaha Corporation.

XF lyrics events hijack the standard lyrics meta events. When toggled on, the XF lyrics parser will take over the standard lyrics parser.

#### Toggle
Upon receiving the following cue point meta event (type `7`, `0x07`), the XF lyrics parser shall begin to take over the standard lyrics parser. Said event also provides text encoding information of lyrics to the parser, while .

#### Control characters

#### Part cues

#### Scenes

#### Lyrics feed

## Chords
Octavia supports the following ways of specifying chord information: XF chord type, YMCS chord control.

### XF chord type
This is an implementation-specific meta event with schema provided below.

`43 7B 91 as cc as cc`

- `a`: `0`..`6` → ♭𝄫, 𝄫, ♭, ♮, ♯, 𝄪, 𝄪♯
- `s`: `1`..`7` → C, D, E, F, G, A, B
- `cc`: See the "XF ID" field in the chord list.

Notes:

- When `as` is set to `7f`, the note is considered disabled.

### YMCS chord control
This is a SysEx message with schema provided below.

`43 7E 02 as cc as cc`

The details are exactly the same as above.

### Chord list
<div class="table-wrapper">
<table><thead><tr>
	<th>Type</th>
	<th>ID</th>
	<th>XF ID</th>
	<th>Specifier</th>
	<th>Full name</th>
	<th>Voicing</th>
	<th>Semitones</th>
	<th>On QY?</th>
	<th>On PSR?</th>
</tr></thead><tbody><tr>
	<td>Other</td>
	<td><code>ff</code></td>
	<td><code>7f</code></td>
	<td><code>---</code></td>
	<td>No chords</td>
	<td>1</td>
	<td>0</td>
</tr><tr>
	<td rowspan=20>Major</td>
	<td><code>00</code></td>
	<td><code>00</code></td>
	<td><code>   </code><br/><code>M</code></td>
	<td>Major</td>
	<td>1+3+5</td>
	<td>0, 4, 7</td>
</tr><tr>
	<td><code></code></td>
	<td>✕</td>
	<td><code>b5</code></td>
	<td>Flatted fifth</td>
	<td>1+3+♭5</td>
	<td>0, 4, 6</td>
</tr><tr>
	<td><code></code></td>
	<td><code>07</code></td>
	<td><code>aug</code></td>
	<td>Augmented</td>
	<td>1+3+♯5</td>
	<td>0, 4, 8</td>
</tr><tr>
	<td><code></code></td>
	<td><code>20</code></td>
	<td><code>sus4</code></td>
	<td>Suspended fourth</td>
	<td>1+4+5</td>
	<td>0, 5, 7</td>
</tr><tr>
	<td rowspan=2><code></code></td>
	<td rowspan=2><code>01</code></td>
	<td rowspan=2><code>6</code></td>
	<td rowspan=2>Sixth</td>
	<td>1+5+6</td>
	<td>0, 7, 9</td>
</tr><tr>
	<td>1+3+5+6</td>
	<td>0, 4, 7, 9</td>
</tr><tr>
	<td><code></code></td>
	<td><code>04</code></td>
	<td><code>(9)</code><br/><code>add9</code></td>
	<td>Add ninth</td>
	<td>1+2+3+5</td>
	<td>0, 2, 4, 7</td>
</tr><tr>
	<td rowspan=3><code></code></td>
	<td rowspan=3><code>06</code></td>
	<td rowspan=3><code>6(9)</code><br/><code>6add9</code></td>
	<td rowspan=3>Sixth ninth</td>
	<td>1+2+3+6</td>
	<td>0, 2, 4, 9</td>
</tr><tr>
	<td>1+2+3+5+6</td>
	<td>0, 2, 4, 7, 9</td>
</tr><tr>
	<td>3+6+2</td>
	<td>4, 9, 14</td>
</tr><tr>
	<td rowspan=2><code></code></td>
	<td rowspan=2><code>02</code></td>
	<td rowspan=2><code>M7</code></td>
	<td rowspan=2>Major seventh</td>
	<td>1+3+7</td>
	<td>0, 4, 11</td>
</tr><tr>
	<td>1+3+5+7</td>
	<td>0, 4, 7, 11</td>
</tr><tr>
	<td><code></code></td>
	<td>✕</td>
	<td><code>M7(b5)</code></td>
	<td>Major seventh flatted fifth</td>
	<td>1+3+♭5+7</td>
	<td>0, 4, 6, 11</td>
</tr><tr>
	<td rowspan=2><code></code></td>
	<td rowspan=2><code>1c</code></td>
	<td rowspan=2><code>M7aug</code></td>
	<td rowspan=2>Major seventh augmented</td>
	<td>1+♯5+7</td>
	<td>0, 8, 11</td>
</tr><tr>
	<td>1+3+♯5+7</td>
	<td>0, 4, 8, 11</td>
</tr><tr>
	<td rowspan=2><code></code></td>
	<td rowspan=2><code>05</code></td>
	<td rowspan=2><code>M7(9)</code><br/><code>M7add9</code></td>
	<td rowspan=2>Major seventh add ninth</td>
	<td>1+2+3+7</td>
	<td>0, 2, 4, 11</td>
</tr><tr>
	<td>1+2+3+5+7</td>
	<td>0, 2, 4, 7, 11</td>
</tr><tr>
	<td rowspan=3><code></code></td>
	<td rowspan=3><code>03</code></td>
	<td rowspan=3><code>M7(#11)</code></td>
	<td rowspan=3>Major seventh sharp eleventh</td>
	<td>1+2+3+♯4+7</td>
	<td>0, 2, 4, 6, 11</td>
</tr><tr>
	<td>1+3+♯4+5+7</td>
	<td>0, 4, 6, 7, 11</td>
</tr><tr>
	<td>1+2+3+♯4+5+7</td>
	<td>0, 2, 4, 6, 7, 11</td>
</tr><tr>
	<td rowspan=23>Minor</td>
	<td><code></code></td>
	<td><code>08</code></td>
	<td><code>m</code></td>
	<td>Minor</td>
	<td>1+♭3+5</td>
	<td>0, 3, 7</td>
</tr><tr>
	<td><code></code></td>
	<td><code>21</code></td>
	<td><code>sus2</code><br/><code>1+2+5</code></td>
	<td>Suspended second</td>
	<td>1+2+5</td>
	<td>0, 2, 7</td>
</tr><tr>
	<td><code></code></td>
	<td><code>09</code></td>
	<td><code>m6</code></td>
	<td>Minor sixth</td>
	<td>1+♭3+5+6</td>
	<td>0, 3, 7, 9</td>
</tr><tr>
	<td><code></code></td>
	<td><code>0c</code></td>
	<td><code>m(9)</code><br/><code>madd9</code></td>
	<td>Minor add ninth</td>
	<td>1+2+♭3+5</td>
	<td>0, 2, 3, 7</td>
</tr><tr>
	<td rowspan=3><code></code></td>
	<td rowspan=3>✕</td>
	<td rowspan=3><code>m6(9)</code><br/><code>m6add9</code></td>
	<td rowspan=3>Minor sixth add ninth</td>
	<td>1+♭3+6+2</td>
	<td>0, 4, 9, 14</td>
</tr><tr>
	<td>1+♭3+5+6+2</td>
	<td>0, 3, 7, 9, 14</td>
</tr><tr>
	<td>♭3+6+2</td>
	<td>3, 9, 14</td>
</tr><tr>
	<td rowspan=2><code></code></td>
	<td rowspan=2><code>0a</code></td>
	<td rowspan=2><code>m7</code></td>
	<td rowspan=2>Minor seventh</td>
	<td>1+♭3+♭7</td>
	<td>0, 3, 10</td>
</tr><tr>
	<td>1+♭3+5+♭7</td>
	<td>0, 3, 7, 10</td>
</tr><tr>
	<td><code></code></td>
	<td><code>0b</code></td>
	<td><code>m7b5</code></td>
	<td>Minor seventh flatted fifth</td>
	<td>1+♭3+♭5+♭7</td>
	<td>0, 3, 6, 10</td>
</tr><tr>
	<td><code></code></td>
	<td>✕</td>
	<td><code>m7aug</code></td>
	<td>Minor seventh augmented</td>
	<td>1+♭3+♯5+♭7</td>
	<td>0, 3, 8, 10</td>
</tr><tr>
	<td rowspan=3><code></code></td>
	<td rowspan=3><code>0d</code></td>
	<td rowspan=3><code>m7(9)</code><br/><code>m7add9</code></td>
	<td rowspan=3>Minor seventh add ninth</td>
	<td>1+2+♭3+♭7</td>
	<td>0, 2, 3, 7</td>
</tr><tr>
	<td>1+2+♭3+5+♭7</td>
	<td>0, 2, 3, 7, 10</td>
</tr><tr>
	<td>♭3+♭7+2</td>
	<td>3, 10, 14</td>
</tr><tr>
	<td rowspan=4><code></code></td>
	<td rowspan=4><code>0e</code></td>
	<td rowspan=4><code>m7(11)</code></td>
	<td rowspan=4>Minor seventh eleventh</td>
	<td>1+♭3+4+5</td>
	<td>0, 3, 5, 7</td>
</tr><tr>
	<td>1+2+♭3+4+5</td>
	<td>0, 2, 3, 5, 7</td>
</tr><tr>
	<td>1+♭3+4+5+♭7</td>
	<td>0, 3, 5, 7, 10</td>
</tr><tr>
	<td>1+2+♭3+4+5+♭7</td>
	<td>0, 2, 3, 5, 7, 10</td>
</tr><tr>
	<td rowspan=2><code></code></td>
	<td rowspan=2><code>0f</code></td>
	<td rowspan=2><code>mM7</code></td>
	<td rowspan=2>Minor major seventh</td>
	<td>1+♭3+7</td>
	<td>0, 3, 11</td>
</tr><tr>
	<td>1+♭3+5+7</td>
	<td>0, 3, 7, 11</td>
</tr><tr>
	<td><code></code></td>
	<td>✕</td>
	<td><code>mM7b5</code></td>
	<td>Minor major seventh flatted fifth</td>
	<td>1+♭3+♭5+7</td>
	<td>0, 3, 6, 11</td>
</tr><tr>
	<td rowspan=2><code></code></td>
	<td rowspan=2><code>10</code></td>
	<td rowspan=2><code>mM7(9)</code><br/><code>mM7add9</code></td>
	<td rowspan=2>Minor major seventh add ninth</td>
	<td>1+2+♭3+7</td>
	<td>0, 2, 3, 7, 11</td>
</tr><tr>
	<td>1+2+♭3+5+7</td>
	<td>0, 2, 3, 7, 11</td>
</tr><tr>
	<td rowspan=12>Dominant</td>
	<td rowspan=3><code></code></td>
	<td rowspan=3><code>13</code></td>
	<td rowspan=3><code>7</code></td>
	<td rowspan=3>Seventh</td>
	<td>1+3+♭7</td>
	<td>0, 4, 10</td>
</tr><tr>
	<td>1+5+♭7</td>
	<td>0, 7, 10</td>
</tr><tr>
	<td>1+3+5+♭7</td>
	<td>0, 4, 7, 10</td>
</tr><tr>
	<td><code></code></td>
	<td><code>14</code></td>
	<td><code>7sus4</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td><code>15</code></td>
	<td><code>7b5</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td><code>1d</code></td>
	<td><code>7aug</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td><code>19</code></td>
	<td><code>7(b9)</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td><code>16</code></td>
	<td><code>7(9)</code><br/><code>7add9</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td><code>1b</code></td>
	<td><code>7(#9)</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td><code>17</code></td>
	<td><code>7(#11)</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td><code>1a</code></td>
	<td><code>7(b13)</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td><code>18</code></td>
	<td><code>7(13)</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td rowspan=2>Dimini­shed</td>
	<td><code></code></td>
	<td><code>11</code></td>
	<td><code>dim</code></td>
	<td>Diminished</td>
	<td>1+♭3+♭5</td>
	<td>0, 3, 6</td>
</tr><tr>
	<td><code></code></td>
	<td><code>12</code></td>
	<td><code>dim7</code></td>
	<td>Diminished seventh</td>
	<td>1+♭3+♭5+6</td>
	<td>0, 3, 6, 9</td>
</tr><tr>
	<td rowspan=4>Other</td>
	<td><code></code></td>
	<td><code>1e</code></td>
	<td><code>1+8</code></td>
	<td>Perfect octave</td>
	<td>1+8</td>
	<td>0, 12</td>
</tr><tr>
	<td><code></code></td>
	<td><code>1f</code></td>
	<td><code>5</code><br/><code>1+5</code></td>
	<td>Power</td>
	<td>1+5</td>
	<td>0, 7</td>
</tr><tr>
	<td><code></code></td>
	<td>✕</td>
	<td><code>sus2sus4</code></td>
	<td>Suspended second, suspended fourth</td>
	<td>1+2+4+5</td>
	<td>0, 2, 5, 7</td>
</tr><tr>
	<td><code></code></td>
	<td><code>22</code></td>
	<td><code>cc</code></td>
	<td>Cancel</td>
	<td>1+♭2+2</td>
	<td>0, 1, 2</td>
</tr></tbody></table>
</div>

### Chord mapping
|        | `M`  | `M7` | `m`  | `mM7` | `7`  | `m7`  | Misc. |
| ------ | ---- | ---- | ---- | ----- | ---- | ---- | ---- |
| -      | `M`  | `M7` | `m` | `mM7` | `7` | `m7` | `sus2` |
| `sus4` | `sus4` |  |  |  | `7sus4` |  | `sus2sus4` |
| `b5`   | `b5` | `M7(b5)` |  | `mM7b5` | `7b5` | `m7b5` | `5` |
| `aug`  | `aug` | `M7aug` |  |  | `7aug` | `m7aug` | `1+8` |
| `9`    |  |  |  |  |  |  |  |
| `6`    | `6` |  | `m6` |  |  |  | `cc` |
| `add9` | `add9` | `M7(9)` | `madd9` | `mM7(9)` | `7(9)` | `m7(9)` | `dim` |
| `6(9)` | `6(9)` |  | `m6add9` |  |  |  | `dim7` |
| `b9`   |  |  |  |  | `7(b9)` |  |
| `#9`   |  |  |  |  | `7(#9)` |  |
| `11`   |  |  |  |  |  | `m7(11)` |
| `#11`  |  | `M7(#11)` |  |  | `7(#11)` |  |
| `b13`  |  |  |  |  | `7(b13)` | `7(13)` |