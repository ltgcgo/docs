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
> This has not yet been supported by Octavia.

These escape sequences will affect how the lyrics events are parsed.

- `\v`: Vertical tab. 
- `\r`: Carriage return.
- `\n`: Line feed.
- `\\`: Backslash itself.

These escape sequences won't affect the lyrics event parsing.

- `\%`: The percent sign itself. Unescaped percent signs are used to notate chords.
- `\[`, `\]`: The square brackets themselves. Unescaped square brackets are used to notate rubies.
- `\{`, `\}`: The curly braces themselves. Unescaped curly braces are used to specify tags.

#### Controls
##### Word break
When the space character ` ` is received as the last character in the event payload, the continuous word stream will be broken. In Octavia's case, it will try to exclude the space characters at the beginning *and* at the end of the event payload from duration calculation. This, however, also means that space characters sandwiched between other characters will not break the word stream.

Karaoke implementations should not consider word breaks in their duration calculation.

##### End of line
When either `\v` (extension) or `\r` (AMEI) is received, a new line is signaled.

##### End of paragraph
When `\n` (AMEI) is received, a new paragraph/section is signaled.

#### Tags
> This has not yet been supported by Octavia.

Can be used to provide additional data. Tag specifiers can be in all caps, captilized at initials, or all in small caps.

For compatibility reasons, tags must be specified at the beginning of each lyrics event, and there should only be a single tag in each.

##### Text encoding
Specifies the indicated text encoding of the lyrics, valid until the next override with events of the same type. Schema below.

`{@${Encoding}}`

A list of known possible encodings with their specifiers available below.

| Specifier | Encoding   | Octavia |
| --------- | ---------- | ------- |
| `Unicode` | UTF-8      | UTF-8 (`utf-8`) |
| `Latin`   | ISO 8859-1 | ISO 8859-15 (`l9`) |

There are exceptions for handling text encoding. If the raw binary payload begins with the following values, the text encoding will be overridden to the ones listed below.

| Bytes      | Encoding |
| ---------- | -------- |
| `EF BB BF` | UTF-8    |
| `FF FE`    | UTF-16LE |
| `FE FF`    | UTF-16BE |

Examples below.

```ini
{@Latin} # ISO 8859-15
{@Unicode} # UTF-8
```

##### Song metadata
Provides metadata. While overwriting elsewhere mostly, Octavia allows stacking of certain metadata tags.

`{#${key}=${value}}`

Recommended keys below.

| Key | Use | Stackable | Standard |
| --- | --- | --------- | -------- |
| Artist | Artist<br/>Performer | ✓ | ✓ |
| Composer | Composer | ✓ | ✓ |
| Lyrics | Lyricist | ✓ | ✓ |
| Title | Song title | ✕ | ✓ |
| Album | Album | ✓ | ✕ |
| By | SMF programmer | ✕ | ✕ |
| Date | Release date | ✕ | ✕ |
| Genre | Genre | ✕ | ✕ |
| Track | Track number/total | ✕ | ✕ |

Examples below.

```
{#Artist=James Lord Pierpont}
{#Title=Jingle Bells}
```

##### Tag end
`{#}`

Explicitly indicates completion of tags.

#### Rubies
> This has not yet been supported by Octavia.

#### Chords
It is possible to include chord info. See the [TUNE chords](#tune-chords) section for further information.

#### Lyrics feed
While it is possible to provide lyrics via unorthodox means, it is generally recommended to conform to the following to ensure maximum compatibility.

- Every syllable should have its dedicated lyrics event, with space appended to the last syllable or the punctuation mark of the last syllable of a word.
- New lines (`\v`, `\r`) and new sections (`\n`) should have dedicated lyrics events.

There are some additional tips as well.

- The dedicated new line/section events should be emitted after the last syllable of the line has ended, not immediately.

A recommended example below.

```js
00 FF 05 01 "A"
08 FF 05 02 "ma"
08 FF 05 05 "zing "
08 FF 05 05 "grace"
04 FF 05 01 "\r" // New line
04 FF 05 04 "How "
08 FF 05 06 "sweet "
08 FF 05 04 "the "
08 FF 05 05 "sound"
04 FF 05 01 "\r" // New line
04 FF 05 05 "That "
08 FF 05 06 "saved "
08 FF 05 02 "a "
08 FF 05 07 "wretch "
08 FF 05 05 "like "
08 FF 05 02 "me"
04 FF 05 01 "\n" // New section
04 FF 05 02 "I "
08 FF 05 05 "once "
08 FF 05 04 "was "
08 FF 05 04 "lost"
04 FF 05 01 "\r" // New line
04 FF 05 04 "But "
08 FF 05 04 "now "
08 FF 05 02 "I "
08 FF 05 05 "found"
04 FF 05 01 "\r" // New line
04 FF 05 04 "Was "
08 FF 05 06 "blind "
08 FF 05 04 "but "
08 FF 05 04 "now "
08 FF 05 02 "I "
08 FF 05 03 "see"
04 FF 05 01 "\n" // New section
```

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
Specified with `@L`. Contains a four-letter code of the language of the lyrics, which might be used to indicate the used text encoding. The only known codes are listed below, as such please contribute if possible!

| Code   | Language | Encoding |
| ------ | -------- | -------- |
| `ENGL` | English  | ISO 8859-15 (`l9`) |

##### Title
Specified with `@T`. The fields listed below could be contained, which most doesn't have any way to distinguish.

- Song title (must be the first `@T` event)
- Song artist (must be the second `@T` event)
- Sequencer

##### Information
Specified with `@I`. Contains "other information", which has no surviving documentation anywhere.

### XF lyrics
Developed by Yamaha Corporation.

XF lyrics events replace the standard lyrics meta events. When toggled on, the XF lyrics parser will take over the standard lyrics parser.

#### Toggle
Upon receiving the following cue point meta event (type `7`, `0x07`), the XF lyrics parser shall begin to take over the standard lyrics parser. Said event also provides text encoding information of lyrics to the parser, while .

#### Controls

#### Part cues

#### Scenes

#### Rubies
> This has not yet been supported by Octavia.

#### Lyrics feed

### Solton
> This has not yet been supported by Octavia.

Developed by Keytron Laboratories.

Solton lyrics events augment the standard lyrics meta events.

#### Toggle
Solton lyrics do not have a toggle. However, because the first characters specified by Solton will always be either `<` or `%`, these two characters can serve as suggestions that the specific lyric event could be in the Solton format.

#### Chords
It is possible to include chord info. See the [Solton chords](#solton-chords) section for further information.

#### Lyrics feed
When a line of lyrics get emitted with the `<` prefix, none of the characters will be immediately highlighted. The position of the highlighted character is instead controlled by cc31 on channel 1, with the value `0` highlighting nothing. This implies that cc31 will be initialized to `0`, and implicitly restricts each line of lyrics to 127 characters, prefix not included.

```ini
00 FF 05 ll <Nom Olenian # Hightlights nothing
08 B0 1F 03 # Nom
08 B0 1F 05 # Nom O
08 B0 1F 07 # Nom Ole
08 B0 1F 0B # Nom Olenian
08 B0 1F 00 # Highlights nothing again
00 FF 05 ll <Very tasty # Still highlights nothing
08 B0 1F 02 # Ve
08 B0 1F 04 # Very
08 B0 1F 07 # Very ta
08 B0 1F 0A # Very tasty
```

As demonstrated by the example, the lyrics events must be delivered before the highlighting cc31 events. Before a new line of lyrics is delivered, it's recommended to have cc31 reset to `0` for compatibility reasons, even though Octavia will automatically reset it to `0` on reception.

## Chords
Octavia supports the following ways of specifying chord information: XF chord type, YMCS chord control.

### TUNE chords
> This has not yet been supported by Octavia.

This is a text meta event with schema provided below. Each specific chord must be separated with a forward slash (`/`).

`${root}${accidental}${chordType}`

- `root`: Any of `C`, `D`, `E`, `F`, `G`, `A` and `B`. Must be a single character.
- `accidental`: Any of `b` (flat), ` ` (natural) or `#` (sharp). Must be a single character, thus cannot be omitted.
- `chordType`: The standard chord notation. See the "specifier" field in the chord list.

Examples include "`E `" (space is preserved!), `E m7(11)`, `G#sus4` and `AbM7/Bb`.

### Solton chords
> This has not yet been supported by Octavia.

This is a lyrics meta event with schema provided below.

`${root}${accidental}${chordType}`

- `root`: Any of `C`, `D`, `E`, `F`, `G`, `A` and `B`. Must be a single character.
- `accidental`: Any of `bbb`, `bb`, `b` (flat), omitted (natural), `#` (sharp), `##` or `###`.
- `chordType`: The standard chord notation. See the "specifier" field in the chord list.

The whole chord event must be prefixed with a percent sign (`%`). While the original specification may only allow a single chord to be specified, Octavia supports specifying multiple delimited with either a forward slash (`/`) or a space (` `).

### XF chord type
This is an implementation-specific meta event with schema provided below.

`43 7B 91 as cc as cc`

- `a`: `0`..`6` → ♭𝄫, 𝄫, ♭, ♮, ♯, 𝄪, 𝄪♯
- `s`: `1`..`7` → C, D, E, F, G, A, B
- `cc`: See the "XF ID" field in the chord list.

Notes:

- When `as` is set to `7F`, the note is considered disabled. Any `as` byte set to `7F` will immediately halt chord parsing on the event.

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
	<td><code>02</code></td>
	<td>✕</td>
	<td><code>b5</code></td>
	<td>Flatted fifth</td>
	<td>1+3+♭5</td>
	<td>0, 4, 6</td>
</tr><tr>
	<td><code>03</code></td>
	<td><code>07</code></td>
	<td><code>aug</code></td>
	<td>Augmented</td>
	<td>1+3+♯5</td>
	<td>0, 4, 8</td>
</tr><tr>
	<td><code>01</code></td>
	<td><code>20</code></td>
	<td><code>sus4</code></td>
	<td>Suspended fourth</td>
	<td>1+4+5</td>
	<td>0, 5, 7</td>
</tr><tr>
	<td rowspan=2><code>05</code></td>
	<td rowspan=2><code>01</code></td>
	<td rowspan=2><code>6</code></td>
	<td rowspan=2>Sixth</td>
	<td>1+5+6</td>
	<td>0, 7, 9</td>
</tr><tr>
	<td>1+3+5+6</td>
	<td>0, 4, 7, 9</td>
</tr><tr>
	<td><code>06</code></td>
	<td><code>04</code></td>
	<td><code>(9)</code><br/><code>add9</code></td>
	<td>Add ninth</td>
	<td>1+2+3+5</td>
	<td>0, 2, 4, 7</td>
</tr><tr>
	<td rowspan=3><code>07</code></td>
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
	<td rowspan=2><code>20</code></td>
	<td rowspan=2><code>02</code></td>
	<td rowspan=2><code>M7</code></td>
	<td rowspan=2>Major seventh</td>
	<td>1+3+7</td>
	<td>0, 4, 11</td>
</tr><tr>
	<td>1+3+5+7</td>
	<td>0, 4, 7, 11</td>
</tr><tr>
	<td><code>22</code></td>
	<td>✕</td>
	<td><code>M7(b5)</code></td>
	<td>Major seventh flatted fifth</td>
	<td>1+3+♭5+7</td>
	<td>0, 4, 6, 11</td>
</tr><tr>
	<td rowspan=2><code>23</code></td>
	<td rowspan=2><code>1c</code></td>
	<td rowspan=2><code>M7aug</code></td>
	<td rowspan=2>Major seventh augmented</td>
	<td>1+♯5+7</td>
	<td>0, 8, 11</td>
</tr><tr>
	<td>1+3+♯5+7</td>
	<td>0, 4, 8, 11</td>
</tr><tr>
	<td rowspan=2><code>26</code></td>
	<td rowspan=2><code>05</code></td>
	<td rowspan=2><code>M7(9)</code><br/><code>M7add9</code></td>
	<td rowspan=2>Major seventh add ninth</td>
	<td>1+2+3+7</td>
	<td>0, 2, 4, 11</td>
</tr><tr>
	<td>1+2+3+5+7</td>
	<td>0, 2, 4, 7, 11</td>
</tr><tr>
	<td rowspan=3><code>24</code></td>
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
	<td><code>10</code></td>
	<td><code>08</code></td>
	<td><code>m</code></td>
	<td>Minor</td>
	<td>1+♭3+5</td>
	<td>0, 3, 7</td>
</tr><tr>
	<td><code>70</code></td>
	<td><code>21</code></td>
	<td><code>sus2</code><br/><code>1+2+5</code></td>
	<td>Suspended second</td>
	<td>1+2+5</td>
	<td>0, 2, 7</td>
</tr><tr>
	<td><code>15</code></td>
	<td><code>09</code></td>
	<td><code>m6</code></td>
	<td>Minor sixth</td>
	<td>1+♭3+5+6</td>
	<td>0, 3, 7, 9</td>
</tr><tr>
	<td><code>16</code></td>
	<td><code>0c</code></td>
	<td><code>m(9)</code><br/><code>madd9</code></td>
	<td>Minor add ninth</td>
	<td>1+2+♭3+5</td>
	<td>0, 2, 3, 7</td>
</tr><tr>
	<td rowspan=3><code>17</code></td>
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
	<td rowspan=2><code>50</code></td>
	<td rowspan=2><code>0a</code></td>
	<td rowspan=2><code>m7</code></td>
	<td rowspan=2>Minor seventh</td>
	<td>1+♭3+♭7</td>
	<td>0, 3, 10</td>
</tr><tr>
	<td>1+♭3+5+♭7</td>
	<td>0, 3, 7, 10</td>
</tr><tr>
	<td><code>52</code></td>
	<td><code>0b</code></td>
	<td><code>m7b5</code></td>
	<td>Minor seventh flatted fifth<br/>Half-diminished chord</td>
	<td>1+♭3+♭5+♭7</td>
	<td>0, 3, 6, 10</td>
</tr><tr>
	<td><code>53</code></td>
	<td>✕</td>
	<td><code>m7aug</code></td>
	<td>Minor seventh augmented</td>
	<td>1+♭3+♯5+♭7</td>
	<td>0, 3, 8, 10</td>
</tr><tr>
	<td rowspan=3><code>56</code></td>
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
	<td rowspan=2><code>30</code></td>
	<td rowspan=2><code>0f</code></td>
	<td rowspan=2><code>mM7</code></td>
	<td rowspan=2>Minor major seventh</td>
	<td>1+♭3+7</td>
	<td>0, 3, 11</td>
</tr><tr>
	<td>1+♭3+5+7</td>
	<td>0, 3, 7, 11</td>
</tr><tr>
	<td><code>32</code></td>
	<td>✕</td>
	<td><code>mM7b5</code></td>
	<td>Minor major seventh flatted fifth</td>
	<td>1+♭3+♭5+7</td>
	<td>0, 3, 6, 11</td>
</tr><tr>
	<td rowspan=2><code>36</code></td>
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
	<td rowspan=3><code>40</code></td>
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
	<td><code>41</code></td>
	<td><code>14</code></td>
	<td><code>7sus4</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code>42</code></td>
	<td><code>15</code></td>
	<td><code>7b5</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code>43</code></td>
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
	<td><code>46</code></td>
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
	<td><code>44</code></td>
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
	<td><code>75</code></td>
	<td><code>11</code></td>
	<td><code>dim</code></td>
	<td>Diminished</td>
	<td>1+♭3+♭5</td>
	<td>0, 3, 6</td>
</tr><tr>
	<td><code>76</code></td>
	<td><code>12</code></td>
	<td><code>dim7</code></td>
	<td>Diminished seventh</td>
	<td>1+♭3+♭5+6</td>
	<td>0, 3, 6, 9</td>
</tr><tr>
	<td rowspan=4>Other</td>
	<td><code>73</code></td>
	<td><code>1e</code></td>
	<td><code>1+8</code></td>
	<td>Perfect octave</td>
	<td>1+8</td>
	<td>0, 12</td>
</tr><tr>
	<td><code>72</code></td>
	<td><code>1f</code></td>
	<td><code>5</code><br/><code>1+5</code></td>
	<td>Power</td>
	<td>1+5</td>
	<td>0, 7</td>
</tr><tr>
	<td><code>71</code></td>
	<td>✕</td>
	<td><code>sus2sus4</code></td>
	<td>Suspended second, suspended fourth</td>
	<td>1+2+4+5</td>
	<td>0, 2, 5, 7</td>
</tr><tr>
	<td><code>74</code></td>
	<td><code>22</code></td>
	<td><code>cc</code></td>
	<td>Cancel</td>
	<td>1+♭2+2</td>
	<td>0, 1, 2</td>
</tr></tbody></table>
</div>

### Native chord mapping
<div class="table-wrapper"><table>
<thead><tr>
<th>Type</th><th>Sub-category</th><th><code>M</code><br/>(<code>000</code>)</th><th><code>M7</code><br/>(<code>010</code>)</th><th><code>m</code><br/>(<code>001</code>)</th><th><code>mM7</code><br/>(<code>011</code>)</th><th><code>7</code><br/>(<code>100</code>)</th><th><code>m7</code><br/>(<code>101</code>)</th><th>Misc.<br/>(<code>111</code>)</th>
</tr></thead>
<tbody><tr>
<td rowspan=8>Normal</td><td>-<br/>(<code>0000</code>)</td><td><code>M</code></td><td><code>M7</code></td><td><code>m</code></td><td><code>mM7</code></td><td><code>7</code></td><td><code>m7</code></td><td><code>sus2</code></td>
</tr><tr>
<td><code>sus4</code><br/>(<code>0001</code>)</td><td><code>sus4</code></td><td></td><td></td><td></td><td><code>7sus4</code></td><td></td><td><code>sus2sus4</code></td>
</tr><tr>
<td><code>b5</code><br/>(<code>0010</code>)</td><td><code>b5</code></td><td><code>M7(b5)</code></td><td></td><td><code>mM7b5</code></td><td><code>7b5</code></td><td><code>m7b5</code></td><td><code>5</code></td>
</tr><tr>
<td><code>aug</code><br/>(<code>0011</code>)</td><td><code>aug</code></td><td><code>M7aug</code></td><td></td><td></td><td><code>7aug</code></td><td><code>m7aug</code></td><td><code>1+8</code></td>
</tr><tr>
<td><code>#11</code><br/>(<code>0100</code>)</td><td></td><td><code>M7(#11)</code></td><td></td><td></td><td><code>7(#11)</code></td><td></td><td><code>cc</code></td>
</tr><tr>
<td><code>6</code><br/>(<code>0101</code>)</td><td><code>6</code></td><td></td><td><code>m6</code></td><td></td><td></td><td></td><td><code>dim</code></td>
</tr><tr>
<td><code>add9</code><br/>(<code>0110</code>)</td><td><code>add9</code></td><td><code>M7(9)</code></td><td><code>madd9</code></td><td><code>mM7(9)</code></td><td><code>7(9)</code></td><td><code>m7(9)</code></td><td><code>dim7</code></td>
</tr><tr>
<td><code>6(9)</code><br/>(<code>0111</code>)</td><td><code>6(9)</code></td><td></td><td><code>m6add9</code></td><td></td><td></td><td></td><td></td>
</tr><tr>
<td rowspan=3>Alt. 1</td><td><code>9</code></td><td style="background:#5af3"><code>9</code></td><td style="background:#5af3"><code>M9</code></td><td style="background:#5af3"><code>m9</code></td><td style="background:#5af3"><code>mM9</code></td><td style="background:#ff53"><code>7(b13)</code></td><td></td><td></td>
</tr><tr>
<td><code>11</code></td><td style="background:#5af3"><code>11</code></td><td style="background:#5af3"><code>M11</code></td><td style="background:#5af3"><code>m11</code></td><td><code>M9(#11)</code></td><td></td><td style="background:#5f53"><code>m7(11)</code></td><td></td>
</tr><tr>
<td><code>13</code></td><td style="background:#5af3"><code>13</code></td><td style="background:#5af3"><code>M13</code></td><td style="background:#5af3"><code>m13</code></td><td><code>M13(#11)</code></td><td style="background:#5f53"><code>7(13)</code></td><td></td><td></td>
</tr><tr>
<td rowspan=2>Alt. 2</td><td><code>b9</code></td><td style="background:#a5f3"><code>7b5(b9)</code></td><td style="background:#a5f3"><code>7aug(b9)</code></td><td style="background:#a5f3"><code>11b9</code></td><td style="background:#a5f3"><code>13b9</code></td><td style="background:#5f53"><code>7(b9)</code></td><td><code>9b5</code></td><td></td>
</tr><tr>
<td><code>#9</code></td><td style="background:#a5f3"><code>7b5(#9)</code></td><td style="background:#a5f3"><code>7aug(#9)</code></td><td></td><td></td><td style="background:#5f53"><code>7(#9)</code></td><td><code>9aug</code></td><td></td>
</tr></tbody>
</table></div>