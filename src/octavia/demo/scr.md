# Visualizer
> **Warning**
> 
> This section covers how to use the visualizers bundled as public demos, as such it does not reflect the behaviour of the respective modules themselves.

## Things to notice
### Rendering
* Visualizers have strict render resolution constraints. For the best results, it is advised to **only render while conforming to those resolution constraints**.
* Visualizers are all designed to render at 50 FPS. Some visualizers may offer custom framerates, however it is advised to **only render at a framerate less than or equal to the capture framerate**. Visualizers offered by Octavia, especially ones displaying individual notes, feature an algorithm guaranteeing notes to be displayed each frame. As such, a framerate too high will cause visualizers fail to show display immediate notes.

## Usage
### Input selectors
To begin using visualizers, you must select how you want to accept events. There are several options available.

#### Load MIDI files
You can load standard MIDI files (`.mid` or `.kar`), load SysEx blobs (`.syx`), load voice remapping tables (`.mdat`) or custom voice bank files with this action. An audio track must be loaded with the MIDI file.

Click on the "MIDI" button to load respective files. For multi-port MIDI files, port declarations via standard meta events and XGworks port assign events are all supported. Refer to [multi-port extensions](../impl/ext.md#port-assign) for details.

#### Load synced audio tracks
You can load an audio file synced to the accompanying MIDI file with this action. A MIDI file must be loaded with the audio file.

Click on the "audio" button to load synced audio tracks.

#### Receive from the shared line-in bus
When active, the visualizer will receive events from the shared line-in bus. Events received are directly emitted from the middleware without any modifications. Read [MIDI I/O routing](./mw.md) to acknowledge how to configure how MIDI events are received.

Click on the "line in" button to begin receiving from the bus. The button may appear as just "line" in some visualizers.

#### Receive from the shared line-out bus
Same as "line-in", but the events received will be processed by the Octavia core present on the middleware panel page. As such, events could've been modified if polyfilling or real-time translation has been enabled. Read [MIDI I/O routing](./mw.md) to acknowledge how to configure how MIDI events are received.

Click on the "line out" button to begin receiving from the bus. The button may not be present in certain visualizers.

### Mode selectors
Octavia supports a range of modes ensuring correct state handling. Upon mode switches, the corresponding mode selector will be highlighted. Clicking on the mode selectors will change the global fallback mode of the core respectively.

### Visualizer-specific options
Some visualizers come with additional options for configuring behaviour and look. These options are usually quite self-explanatory, but explanations for certain options considered obscure are also available below.

### Demo selector
Octavia have two demo selection systems used by various public demo visualizers: letter ID and double selection.

#### Letter ID
This is the simplest selection system used. Demos are indexed by a unique letter from different writing systems. Simply hitting on one of the letters loads the respective demo, while depending on the visualizer, hovering over the letters may either expose the file name or some detailed info.

#### Double selection
Demos are grouped by collections. To select a specific demo, first select the desired collection, then select the desired file. Pressing the "load" button will load the demo, while long presses or alt clicks will load *and* play the demo.

### Explore
#### Toggle authentic mode ("true mode")
To allow visualizers function normally after possible legal strikes, most visualizers render under the "libre" mode. In libre mode, assets used are replaced with libre counter parts as much as possible, with famous examples like the libre 5 by 7 font from SynPix.

However, it is also possible for certain visualizers to try resemble the real screens as much as possible under a specific rendering mode. This mode is dubbed "true mode" or "authentic mode", and can be accessed by appending `#trueMode` to the URLs of visualizers, or by pressing `T`.

#### Changing channels/parts
Single-focus visualizers can only display information from one channel at a time. Focused channel can be changed by clicking on the vertical edges (left and right edges) of such visualizers, or scrolling on such visualizers.

For production purposes however, it's recommended to embed channel switch SysEx messages among the events instead. Most, if not all Octavia visualizers, support the Yamaha MU channel switch SysEx message.

#### Changing display modes
Certain visualizers offer various rendering modes. You can switch between modes by clicking on the top or the bottom edges of these visualizers.

|     | Top | Bottom |
| --- | --- | ------ |
| QY  | song info, part info | N/A |
| PSR | song title, voice name, rhythm | measure, tempo |