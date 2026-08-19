# Visualiser
> **Warning**
> 
> This section covers how to use the visualisers bundled as public demos, as such it does not reflect the behaviour of the respective components themselves.

## Things to notice
### Rendering
- Visualisers have strict render resolution constraints. For the best results, it is advised to **only render while conforming to those resolution constraints**.
- Visualisers are all designed to render at 50 FPS (Never Twice the Same Color vs Perfect At Last). Some visualisers may offer custom framerates, however it is advised to **only render at a framerate less than or equal to the capture framerate**. visualisers offered by Octavia, especially ones displaying individual notes, feature an algorithm guaranteeing notes to be displayed each frame. As such, if the rendering framerate is set too high, it will cause the resulting video capture of the visualiser to no longer display some immediate notes, as immediate notes would likely be shown after a captured frame and before another frame is captured.

## Usage
### Input selectors
To begin using visualisers, you must select how you want to accept events. There are several options available.

#### Load MIDI files
You can load standard MIDI files (`.mid` or `.kar`), load SysEx blobs (`.syx`), load voice remapping tables (`.mdat`) or custom voice bank files with this action. An audio track must be loaded with the MIDI file.

Click on the "MIDI" button to load respective files. For multi-port MIDI files, port declarations via standard meta events and XGworks port assign events are all supported. Refer to [multi-port extensions](../impl/ext.md#port-assign) for details.

#### Load synced audio tracks
You can load an audio file synced to the accompanying MIDI file with this action. A MIDI file must be loaded with the audio file.

Click on the "audio" button to load synced audio tracks.

#### Receive from the shared line-in bus
When active, the visualiser will receive events from the shared line-in bus. Events received are directly emitted from the middleware without any modifications. Read [MIDI I/O routing](./mw.md) to acknowledge how to configure how MIDI events are received.

Click on the "line in" button to begin receiving from the bus. The button may appear as just "line" in some visualisers.

#### Receive from the shared line-out bus
Same as "line-in", but the events received will be processed by the Octavia core present on the middleware panel page. As such, events could've been modified if polyfilling or real-time translation has been enabled. Read [MIDI I/O routing](./mw.md) to acknowledge how to configure how MIDI events are received.

Click on the "line out" button to begin receiving from the bus. The button may not be present in certain visualisers.

### Mode selectors
Octavia supports a range of modes ensuring correct state handling. Upon mode switches, the corresponding mode selector will be highlighted. Clicking on the mode selectors will change the global fallback mode of the core respectively.

### Visualiser-specific options
Some visualisers come with additional options for configuring behaviour and look. These options are usually quite self-explanatory, but explanations for certain options considered obscure are also available below.

### Demo selector
Octavia have two demo selection systems used by various public demo visualisers: letter ID and double selection.

#### Letter ID
This is the simplest selection system used. Demos are indexed by a unique letter from different writing systems. Simply hitting on one of the letters loads the respective demo, while depending on the visualiser, hovering over the letters may either expose the file name or some detailed info.

#### Double selection
Demos are grouped by collections. To select a specific demo, first select the desired collection, then select the desired file. Pressing the "load" button will load the demo, while long presses or alt clicks will load *and* play the demo.

### Explore
#### Reading voice selection numbers
> This subsection documents behavior held true across the Octavia ecosystem.

The "**cc0 → PC → cc32**" order (or **Bank MSB → Program Change → Bank LSB**) is used by Octavia to both display and internally select voices. While designed to support reception of voice selection in the industry-standard "cc0 → cc32 → PC" order and the unconventional "cc32 → cc0 → PC" order, this order nonetheless is subjectively considered the most natural except for Roland GS, as it reflects the common "category → voice → variation" designation better, especially for Yamaha XG, General MIDI 2, Roland SD and Yamaha/Korg synthesizer-native voices. Roland GS uses cc0 to select variations, and cc32 to select family (SC-55, SC-88...).

Visualisers designed to recreate hardware displays tend to show the raw values as-is, while visualisers without such confinement tend to show the slightly-remapped values.

#### Choosing the best visualiser
> This subsection documents behavior held true across the Octavia ecosystem.

While Cambiare is the go-to fullscreen visualiser for any form of MIDI stream Octavia supports, choosing a matching recreated hardware visualiser is a different story. You generally don't want to use a visualiser that contradicts what the stream actually represents. Here's a list of recommendations.

- **Cambiare**: Anything
- **Octavia MU**: **Yamaha XG** (classic; MU50-MU2000EX, PLG1X0-XX), _GM (Yamaha)_, _GM2 (Yamaha)_, _Yamaha XG (modern)_, _Roland GS [aka TG100 mode B] (SC-55, SC-88)_
- **Octavia SC**: **Roland GS** (SC-55, SC-88, SC-88 Pro), Microsoft, _GM (Roland)_
- **Octavia NS5R**: Korg AG-10, Korg 05R/W, Korg X5DR, **Korg N5SR**, _GM (Korg)_, _Yamaha XG (classic; MU50-MU90)_, _Roland GS (SC-55, SC-88)_
- **Octavia QY**: **Yamaha XG** (QY70, QY100, PLG100-XG), Yamaha QY10, _Yamaha XG (classic; MU50-MU90)_, _GM (Yamaha)_
- **Octavia PSR**: **Yamaha XG** (modern; S-YXG2006LE, PSR, DGX, NP)
- **Octavia SC-8850**: **Roland GS** (SC-8850),  Roland GS (SC-55, SC-88, SC-88 Pro), _Yamaha XG (classic; MU50-MU2000EX, PLG1X0-XX)_, _GM (Roland)_, _GM2 (Roland)_
- **Octavia MU15**: **Yamaha XG** (classic; MU15), GM (Yamaha; MU5), _Roland GS [aka TG100 mode B] (SC-55, SC-88)_
- **Octavia SD**: **Roland SD** (SD-20, SD-80, SD-90), GM2 (Roland), _GM (Roland)_
- **Octavia KROSS**: Korg PA (PA50SD, PA80, PA1x), **Korg KROSS 2**, GM2 (neutral), _GM (neutral)_

##### Trivia
- TG100 GM mode A is the predecessor of the classic XG, while TG100 GM mode B is the Roland GS-compatible set. "TG100B" was thus used by Yamaha to refer to their GS compatibility before they got authorised by Roland.
- Cambiare is designed to be functional and reasonably aesthetic, so while it can be used as a component in video productions, it's also useful for forensic MIDI analysis before raw binary inspection, which could be done via readable MICC disassembly.
- Most Yamaha XG-compatible products only had MU50-level (the most basic level above XGlite) support, including MU15.
- While SD-20/80/90 had quite some voices inherited from Roland GS, they are not the same due to sample and envelope differences, and the de-facto SD standard itself is incompatible with GS.

#### Toggle authentic mode ("true mode")
To allow visualisers function normally after possible legal strikes, most visualisers render under the "libre" mode. In libre mode, assets used are replaced with libre counter parts as much as possible, with famous examples like the libre 5 by 7 font from SynPix.

However, it is also possible for certain visualisers to try resemble the real screens as much as possible under a specific rendering mode. This mode is dubbed "true mode" or "authentic mode", and can be accessed by appending `#trueMode` to the URLs of visualisers, or by pressing `T`.

#### Changing channels/parts
Single-focus visualisers can only display information from one channel at a time. Focused channel can be changed by clicking on the vertical edges (left and right edges) of such visualisers, or scrolling on such visualisers.

For production purposes however, it's recommended to embed channel switch SysEx messages among the events instead. Most, if not all Octavia visualisers, support the Yamaha MU channel switch SysEx message.

#### Changing display modes
Certain visualisers offer various rendering modes. You can switch between modes by clicking on the top or the bottom edges of these visualisers.

|     | Top | Bottom |
| --- | --- | ------ |
| QY  | song info (chord + style), song info (voice),<br/>part info (basic), part info (effects) | (same) |
| PSR | song title, voice name, rhythm | measure, tempo |