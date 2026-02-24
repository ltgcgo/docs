<style>
rt {
	font-size: 1.2rem;
}
</style>

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

To make any SMF parser function normally, the character encoding used must be backwards-compatible with ASCII. While suitable for use in any way desired, for karaoke capabilities, data programmers must follow the standard authored by MMA (United States), AMEI (Japan) and TUNE1000 Corporation (Canada). Below is an extension compatible to both of the mentioned standards.

Despite the original version devised by the TUNE1000 Corporation requires the file to be in format 0 (single track), Octavia has no problem handling format 1 (multiple single-channel tracks) and format 2 (multiple mixed-channel tracks) files just fine without a constraining hardware.

#### Escape sequences
> This has not yet been supported by Octavia.

These escape sequences will affect how the lyrics events are parsed.

- `\v` (`\x0b`): Vertical tab.
- `\r` (`\x0d`): Carriage return.
- `\n` (`\x0a`): Line feed.
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
When either `\v` (extension) or `\r` (MMA/AMEI) is received, a new line is signaled.

##### End of paragraph
When `\n` (MMA/AMEI) is received, a new paragraph/section is signaled.

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
| `JP`      | Shift-JIS  | Shift-JIS (`sjis`) |

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
{@JP} # Shift-JIS
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

Used to annotate the pronunciation of each unit. The left square bracket (`[`) starts the ruby annotation for the text in the exact event before the markup, while the right square bracket (`]`) ends the active ruby annotation. It is recommended to separate each syllable inside the rubies in dedicated events.

Example below.

```
あ
の
地[ち]
平[へ
い]
線[せ
ん]
\r
輝[か
が
や]
く
の
は
\r
```

Which should be displayed as the example below.

<blockquote>
<p>あの<ruby>地<rt>ち</rt></ruby><ruby>平<rt>へい</rt></ruby><ruby>線<rt>せん</rt></ruby></p>
<p><ruby>輝<rt>かがや</rt></ruby>くのは</p>
</blockquote>

Some examples below. Green marks recommended practices, yellow marks practices supported but not recommended, and red marks unsupported mistakes. Practices marked in yellow will often result in errors in time parsing.

<div class="table-wrapper"><table><thead><tr>
	<td>Case</td>
	<td>Example</td>
	<td>Result</td>
</tr></thead><tbody><tr style="background: #0f03">
	<td>Ruby begins with preceding text</td>
	<td><pre><code class="hljs">馬[う
ま]
だ</code></pre></td>
	<td><ruby>馬<rt>うま</rt></ruby>だ</td>
</tr><tr style="background: #ff03">
	<td>Separate first syllable(s)</td>
	<td><pre><code class="hljs">馬[
う
ま]
だ</code></pre></td>
	<td><ruby>馬<rt>うま</rt></ruby>だ</td>
</tr><tr style="background: #ff03">
	<td>Separate syllables not split</td>
	<td><pre><code class="hljs">馬[うま]
だ</code></pre></td>
	<td><ruby>馬<rt>うま</rt></ruby>だ</td>
</tr><tr style="background: #ff03">
	<td>Separate ruby end markup</td>
	<td><pre><code class="hljs">馬[う
ま
]
だ</code></pre></td>
	<td><ruby>馬<rt>うま</rt></ruby>だ</td>
</tr><tr style="background: #ff03">
	<td>Separate ruby end markup<br/>with the next syllable</td>
	<td><pre><code class="hljs">馬[う
ま
]だ</code></pre></td>
	<td><ruby>馬<rt>うま</rt></ruby>だ</td>
</tr><tr style="background: #ff03">
	<td>Next syllable directly<br/>with a proper end ruby</td>
	<td><pre><code class="hljs">馬[う
ま]だ</code></pre></td>
	<td><ruby>馬<rt>うま</rt></ruby>だ</td>
</tr><tr style="background: #f003">
	<td>Ruby begins without preceding text</td>
	<td><pre><code class="hljs">馬
[う
ま]
だ</code></pre></td>
	<td>馬<ruby><rt>うま</rt></ruby>だ</td>
</tr><tr style="background: #f003">
	<td><code>[</code> in a ruby</td>
	<td><pre><code class="hljs">馬[う
[ま]
だ</code></pre></td>
	<td><ruby>馬<rt>う[ま</rt></ruby>だ</td>
</tr><tr style="background: #f003">
	<td><code>]</code> out of a ruby</td>
	<td><pre><code class="hljs">馬[う
ま]
だ]</code></pre></td>
	<td><ruby>馬<rt>うま</rt></ruby>だ]</td>
</tr><tr style="background: #f003">
	<td rowspan=5>Control characters in a ruby</td>
	<td><pre><code class="hljs">馬[う
\r
ま]
だ</code></pre></td>
	<td><ruby>馬<rt>う�ま</rt></ruby>だ</td>
</tr><tr style="background: #f003">
	<td><pre><code class="hljs">馬[う
\n
ま]
だ</code></pre></td>
	<td><ruby>馬<rt>う�ま</rt></ruby>だ</td>
</tr><tr style="background: #f003">
	<td><pre><code class="hljs">馬[う
{
ま]
だ</code></pre></td>
	<td><ruby>馬<rt>う�ま</rt></ruby>だ</td>
</tr><tr style="background: #f003">
	<td><pre><code class="hljs">馬[う
}
ま]
だ</code></pre></td>
	<td><ruby>馬<rt>う�ま</rt></ruby>だ</td>
</tr><tr style="background: #f003">
	<td><pre><code class="hljs">馬[う
{#}
ま]
だ</code></pre></td>
	<td><ruby>馬<rt>う���ま</rt></ruby>だ</td>
</tr></tbody></table></div>

#### Chords
It is possible to include chord info. See the [TUNE chords](#tune-chords) section for further information.

#### Lyrics feed
While it is possible to provide lyrics via unorthodox means, it is generally recommended to conform to the following to ensure maximum compatibility.

- Every syllable should have its dedicated lyrics event, with space appended to the last syllable or the punctuation mark of the last syllable of a word.
- New lines (`\v`, `\r`) and new sections (`\n`) should have dedicated lyrics events.

There are some additional tips as well.

- If there are no lyrics immediately at the beginning, placing a blank lyrics event or specifying tags in the first measure is recommended to turn on lyrics for certain devices.
- Due to display area limitations, it's recommended that lines should be within 40 characters. Parsers, however, should not stop unintentionally if that limit is exceeded.
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

#### Trigger
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

#### Controls
Control character can *only* appear as the *first* character of each text event.

##### New line
When `/` is received, a new line is signalled.

##### New section
When `\\` is received, a new section is signalled.

#### Lyrics feed
Similar to the standard lyrics, while it is possible to provide lyrics via unorthodox means, to ensure maximum compatibility, it is generally recommended to dedicate every syllable to their own events, with spaces either at the beginning or the end of a word.

### XF lyrics
Developed by Yamaha Corporation.

XF lyrics events replace the standard lyrics meta events. When toggled on, the XF lyrics parser will take over the standard lyrics parser.

#### Trigger
> Documentation is not finished for this section.

Upon receiving the following cue point meta event (type `7`, `0x07`), the XF lyrics parser shall begin to take over the standard lyrics parser. Said event also provides text encoding information of lyrics to the parser, while .

#### Part cues
Upon receiving a 2-byte cue point meta event that begins with an ampersand (`&`), the XF cue parser shall attempt interpreting XF part cues. Valid values are listed below.

- `&m`: Male
- `&f`: Female
- `&c`: Chorus
- `&s`: Solo
- `&p`: Plural or mixed
- `&w`: Words or spoken line
- `&x`: Non-vocal

If non-vocal part cues are active, lyrics shall not be interpreted as karaoke, thus no duration calculations shall be performed. They are used to show functional information other than lyrics, such as `INTRO` (`イントロ` in Japanese), `INTERLUDE` (`間奏` in Japanese) and `ENDING` (`エンディング` in Japanese) markings.

#### Scenes
Upon receiving a cue point meta event that begins with a hash (`#`), the XF cue parser shall attempt interpreting XF scene numbers.

Usually specified as a three-digit number, like `#001`. Only one-indexed integers are considered valid scene numbers.

#### Controls
##### Escape
Prefix any of the following control characters with a backslash (`\`) to display themselves as-is. Use double backslashes (`\\`) to show the backslash itself.

##### Space
Instead of a normal ASCII space (` `), XF uses carets (`^`) for spaces.

Usually appears at the end of each XF lyrics event. Octavia handles all occurances, but will only exclude ones at either end of a string from duration calculation.

##### New line
Instead of a normal ASCII carriage return (`\r`), XF uses slashes (`/`) to signal new lines. Percent signs (`%`) are also used to signal new lines, however even if Octavia handles them as if they are slashes, the original specification intended them to be semantic breaks with or without actual line breaks, and to be applicable on constrained displays.

Usually appears at the end of each XF lyrics event. If the preceding syllable takes a little bit too long, it's recommended to have a dedicated new line event.

##### New section
Instead of a normal ASCII line feed (`\n`), XF uses left angle brackets (`<`) to signal new sections.

Usually appears at the beginning of each XF lyrics event. Dedicating events to signal new sections is *not* recommended.

##### Tab
Instead of a normal ASCII horizontal tab (`\t`), XF uses right angle brackets (`>`) to provide horizontal tabs.

Usually appears at the beginning of each XF lyrics event. Tabs should generally only be used at the beginning of a line.

#### Rubies
> This has not yet been supported by Octavia.

Used to annotate the pronunciation of each unit.

There are two types of rubies in XF, primary and secondary. Primary rubies are annotated via square brackets (`[]`), while secondary rubies are annotated via round brackets (`()`). If display permits, primary rubies shall always be displayed. Secondary rubies are used to assist in utility functions like searching, thus should be hidden from view.

Rubies specified with curly braces (`{}`) called "auxillery text" are considered invalid, thus ignored entirely in Octavia, however XF do recommend showing them as lyrics as-is.

#### Lyrics feed
See the [XF controls](#controls-2) section to acknowledge recommendations on producing XF lyrics.

### Solton
> This has not yet been supported by Octavia.

Developed by Keytron Laboratories.

Solton lyrics events augment the standard lyrics meta events.

#### Trigger
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

The details are exactly the same as above. _YMCS chord control_ serves a different purpose than _XF chord type_.

### Chord list
> Native chord IDs are subject to change at any given time. Serialize to one of the above supported chord representations for interchanging.

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
	<td><code>22</code> (has root)<br/><code>7f</code>(no root)</td>
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
	<td><code>01</code></td>
	<td>✕</td>
	<td><code>b5</code></td>
	<td>Flatted fifth</td>
	<td>1+3+♭5</td>
	<td>0, 4, 6</td>
</tr><tr>
	<td><code>02</code></td>
	<td><code>07</code></td>
	<td><code>aug</code></td>
	<td>Augmented</td>
	<td>1+3+♯5</td>
	<td>0, 4, 8</td>
</tr><tr>
	<td><code>03</code></td>
	<td><code>20</code></td>
	<td><code>sus4</code></td>
	<td>Suspended fourth</td>
	<td>1+4+5</td>
	<td>0, 5, 7</td>
</tr><tr>
	<td rowspan=2><code>04</code></td>
	<td rowspan=2><code>01</code></td>
	<td rowspan=2><code>6</code></td>
	<td rowspan=2>Sixth</td>
	<td>1+5+6</td>
	<td>0, 7, 9</td>
</tr><tr>
	<td>1+3+5+6</td>
	<td>0, 4, 7, 9</td>
</tr><tr>
	<td><code>05</code></td>
	<td><code>04</code></td>
	<td><code>(9)</code><br/><code>add9</code></td>
	<td>Add ninth</td>
	<td>1+2+3+5</td>
	<td>0, 2, 4, 7</td>
</tr><tr>
	<td rowspan=3><code>06</code></td>
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
	<td rowspan=2><code>07</code></td>
	<td rowspan=2><code>02</code></td>
	<td rowspan=2><code>M7</code></td>
	<td rowspan=2>Major seventh</td>
	<td>1+3+7</td>
	<td>0, 4, 11</td>
</tr><tr>
	<td>1+3+5+7</td>
	<td>0, 4, 7, 11</td>
</tr><tr>
	<td><code>08</code></td>
	<td>✕</td>
	<td><code>M7(b5)</code></td>
	<td>Major seventh flatted fifth</td>
	<td>1+3+♭5+7</td>
	<td>0, 4, 6, 11</td>
</tr><tr>
	<td rowspan=2><code>09</code></td>
	<td rowspan=2><code>1c</code></td>
	<td rowspan=2><code>M7aug</code></td>
	<td rowspan=2>Major seventh augmented</td>
	<td>1+♯5+7</td>
	<td>0, 8, 11</td>
</tr><tr>
	<td>1+3+♯5+7</td>
	<td>0, 4, 8, 11</td>
</tr><tr>
	<td rowspan=2><code>0a</code></td>
	<td rowspan=2><code>05</code></td>
	<td rowspan=2><code>M7(9)</code><br/><code>M7add9</code></td>
	<td rowspan=2>Major seventh add ninth</td>
	<td>1+2+3+7</td>
	<td>0, 2, 4, 11</td>
</tr><tr>
	<td>1+2+3+5+7</td>
	<td>0, 2, 4, 7, 11</td>
</tr><tr>
	<td rowspan=3><code>0b</code></td>
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
	<td><code>0c</code></td>
	<td><code>08</code></td>
	<td><code>m</code></td>
	<td>Minor</td>
	<td>1+♭3+5</td>
	<td>0, 3, 7</td>
</tr><tr>
	<td><code>0d</code></td>
	<td><code>21</code></td>
	<td><code>sus2</code><br/><code>1+2+5</code></td>
	<td>Suspended second</td>
	<td>1+2+5</td>
	<td>0, 2, 7</td>
</tr><tr>
	<td><code>0e</code></td>
	<td><code>09</code></td>
	<td><code>m6</code></td>
	<td>Minor sixth</td>
	<td>1+♭3+5+6</td>
	<td>0, 3, 7, 9</td>
</tr><tr>
	<td><code>0f</code></td>
	<td><code>0c</code></td>
	<td><code>m(9)</code><br/><code>madd9</code></td>
	<td>Minor add ninth</td>
	<td>1+2+♭3+5</td>
	<td>0, 2, 3, 7</td>
</tr><tr>
	<td rowspan=3><code>10</code></td>
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
	<td rowspan=2><code>11</code></td>
	<td rowspan=2><code>0a</code></td>
	<td rowspan=2><code>m7</code></td>
	<td rowspan=2>Minor seventh</td>
	<td>1+♭3+♭7</td>
	<td>0, 3, 10</td>
</tr><tr>
	<td>1+♭3+5+♭7</td>
	<td>0, 3, 7, 10</td>
</tr><tr>
	<td><code>12</code></td>
	<td><code>0b</code></td>
	<td><code>m7b5</code></td>
	<td>Minor seventh flatted fifth<br/>Half-diminished chord</td>
	<td>1+♭3+♭5+♭7</td>
	<td>0, 3, 6, 10</td>
</tr><tr>
	<td><code>13</code></td>
	<td>✕</td>
	<td><code>m7aug</code></td>
	<td>Minor seventh augmented</td>
	<td>1+♭3+♯5+♭7</td>
	<td>0, 3, 8, 10</td>
</tr><tr>
	<td rowspan=3><code>14</code></td>
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
	<td rowspan=4><code>15</code></td>
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
	<td rowspan=2><code>16</code></td>
	<td rowspan=2><code>0f</code></td>
	<td rowspan=2><code>mM7</code></td>
	<td rowspan=2>Minor major seventh</td>
	<td>1+♭3+7</td>
	<td>0, 3, 11</td>
</tr><tr>
	<td>1+♭3+5+7</td>
	<td>0, 3, 7, 11</td>
</tr><tr>
	<td><code>17</code></td>
	<td>✕</td>
	<td><code>mM7b5</code></td>
	<td>Minor major seventh flatted fifth</td>
	<td>1+♭3+♭5+7</td>
	<td>0, 3, 6, 11</td>
</tr><tr>
	<td rowspan=2><code>18</code></td>
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
	<td rowspan=3><code>19</code></td>
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
	<td><code>1a</code></td>
	<td><code>14</code></td>
	<td><code>7sus4</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code>1b</code></td>
	<td><code>15</code></td>
	<td><code>7b5</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code>1c</code></td>
	<td><code>1d</code></td>
	<td><code>7aug</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code>1d</code></td>
	<td><code>19</code></td>
	<td><code>7(b9)</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code>1e</code></td>
	<td><code>16</code></td>
	<td><code>7(9)</code><br/><code>7add9</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code>1f</code></td>
	<td><code>1b</code></td>
	<td><code>7(#9)</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code>20</code></td>
	<td><code>17</code></td>
	<td><code>7(#11)</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code>21</code></td>
	<td><code>1a</code></td>
	<td><code>7(b13)</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code>22</code></td>
	<td><code>18</code></td>
	<td><code>7(13)</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td rowspan=2>Dimini­shed</td>
	<td><code>23</code></td>
	<td><code>11</code></td>
	<td><code>dim</code></td>
	<td>Diminished</td>
	<td>1+♭3+♭5</td>
	<td>0, 3, 6</td>
</tr><tr>
	<td><code>24</code></td>
	<td><code>12</code></td>
	<td><code>dim7</code></td>
	<td>Diminished seventh</td>
	<td>1+♭3+♭5+6</td>
	<td>0, 3, 6, 9</td>
</tr><tr>
	<td rowspan=4>Other</td>
	<td><code>25</code></td>
	<td><code>1e</code></td>
	<td><code>1+8</code></td>
	<td>Perfect octave</td>
	<td>1+8</td>
	<td>0, 12</td>
</tr><tr>
	<td><code>26</code></td>
	<td><code>1f</code></td>
	<td><code>5</code><br/><code>1+5</code></td>
	<td>Power</td>
	<td>1+5</td>
	<td>0, 7</td>
</tr><tr>
	<td><code>27</code></td>
	<td>✕</td>
	<td><code>sus2sus4</code></td>
	<td>Suspended second, suspended fourth</td>
	<td>1+2+4+5</td>
	<td>0, 2, 5, 7</td>
</tr><tr>
	<td><code>fe</code></td>
	<td>✕</td>
	<td><code>cc</code></td>
	<td>Cancel</td>
	<td>1+♭2+2</td>
	<td>0, 1, 2</td>
</tr></tbody></table>
</div>

### Old draft chord mapping
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