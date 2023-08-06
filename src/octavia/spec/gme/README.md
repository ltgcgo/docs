# General MIDI Extended
GME, short for General MIDI Extended, is a standard based off General MIDI level 1, which emphasizes on slightly extending the ability of General MIDI while not being too demanding. General MIDI Extended can be considered as a summarization of the common functionality among all GM-compatible synthesizers, and should be the baseline of all contemporary General MIDI-compatible synthesizers.

## Requirements
Any GME-compliant synthesizer must adhere all requirements listed below.

* Has at least 24 oscillators available simultaneously (polyphony), which must either be...
  * At least 24 fully dynamically allocated oscillators for both melodic and percussion sounds.
  * At least 16 dynamically allocated oscillators for melodic sounds, 8 for percussion sounds.
* Supports all 16 MIDI channels, which...
  * Can play arbitrary number of voices within the polyphony limit.
  * Can change to a different instrument.
  * Channel 10 is set to percussion by default.
* Correctly responds to listed required [events, CC and RPN](ch.md).
* Has all voices listed in the required [voice list](voice.md).
* Has drum kits following the required [drum note mapping](drum.md).
* Correctly responds to required [System Exclusive](sysex.md) messages.
