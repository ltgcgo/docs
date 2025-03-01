# Implementation Table
## MIDI Implementation Chart
<table>
	<thead>
		<tr>
			<th colspan=2>Function</th>
			<th>Recognized</th>
			<th>Remarks</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td rowspan=2>Basic Channel</td>
			<td>Default</td>
			<td>✓ 1-16</td>
			<td></td>
		</tr>
		<tr>
			<td>Changed</td>
			<td>✓ 1-16</td>
			<td>Supports up to 128 channels.</td>
		</tr>
		<tr>
			<td colspan=2>Note number</td>
			<td>0-127</td>
			<td></td>
		</tr>
		<tr>
			<td rowspan=2>Mode</td>
			<td>Default</td>
			<td>3</td>
			<td></td>
		</tr>
		<tr>
			<td>Messages</td>
			<td>✓ 3, 4</td>
			<td></td>
		</tr>
		<tr>
			<td rowspan=2>Velocity</td>
			<td>Note on</td>
			<td>✓ 9nV=1-127</td>
			<td></td>
		</tr>
		<tr>
			<td>Note off</td>
			<td>✓ 9nV=0 8n</td>
			<td></td>
		</tr>
		<tr>
			<td rowspan=2>Aftertouch</td>
			<td>Key</td>
			<td>✓</td>
			<td></td>
		</tr>
		<tr>
			<td>Channel</td>
			<td>✓</td>
			<td></td>
		</tr>
		<tr>
			<td colspan=2>Pitchbend</td>
			<td>✓</td>
			<td>0-24 semitone steps<br/>14-bit resolution</td>
		</tr>
		<tr>
			<td rowspan=69>Control Change</td>
			<td>0</td>
			<td>✓</td>
			<td>MSB Bank Select</td>
		</tr>
		<tr>
			<td>1</td>
			<td>✓</td>
			<td>Modulation</td>
		</tr>
		<tr>
			<td>2</td>
			<td>✓</td>
			<td>Breath</td>
		</tr>
		<tr>
			<td>4</td>
			<td>✓</td>
			<td>Foot</td>
		</tr>
		<tr>
			<td>5</td>
			<td>✓</td>
			<td>Portamento Time</td>
		</tr>
		<tr>
			<td>6</td>
			<td>✓</td>
			<td>MSB (N)RPN Data Commit</td>
		</tr>
		<tr>
			<td>7</td>
			<td>✓</td>
			<td>Volume</td>
		</tr>
		<tr>
			<td>8</td>
			<td>✓</td>
			<td>Balance</td>
		</tr>
		<tr>
			<td>10</td>
			<td>✓</td>
			<td>Pan</td>
		</tr>
		<tr>
			<td>11</td>
			<td>✓</td>
			<td>Expression</td>
		</tr>
		<tr>
			<td>12</td>
			<td>✓</td>
			<td>General-purpose effect<br/>PLG-AN ribbon X</td>
		</tr>
		<tr>
			<td>13</td>
			<td>✓</td>
			<td>General-purpose effect<br/>PLG-AN ribbon Z</td>
		</tr>
		<tr>
			<td>16</td>
			<td>✓</td>
			<td>General-purpose sound</td>
		</tr>
		<tr>
			<td>17</td>
			<td>✓</td>
			<td>General-purpose sound</td>
		</tr>
		<tr>
			<td>18</td>
			<td>✓</td>
			<td>General-purpose sound</td>
		</tr>
		<tr>
			<td>19</td>
			<td>✓</td>
			<td>General-purpose sound</td>
		</tr>
		<tr>
			<td>32</td>
			<td>✓</td>
			<td>LSB Bank Select</td>
		</tr>
		<tr>
			<td>38</td>
			<td>✓</td>
			<td>LSB (N)RPN Data Commit</td>
		</tr>
		<tr>
			<td>64</td>
			<td>✓</td>
			<td>Sustain (Hold)</td>
		</tr>
		<tr>
			<td>65</td>
			<td>✓</td>
			<td>Portamento</td>
		</tr>
		<tr>
			<td>66</td>
			<td>✓</td>
			<td>Sostenuto</td>
		</tr>
		<tr>
			<td>67</td>
			<td>✓</td>
			<td>Soft Pedal<br/><i>Store only</i></td>
		</tr>
		<tr>
			<td>68</td>
			<td>✓</td>
			<td>Legato<br/><i>Store only</i></td>
		</tr>
		<tr>
			<td>69</td>
			<td>✓</td>
			<td>Hold 2<br/><i>Store only</i></td>
		</tr>
		<tr>
			<td>70</td>
			<td>✓</td>
			<td>Timbre Variation<br/><i>Store only</i></td>
		</tr>
		<tr>
			<td>71</td>
			<td>✓</td>
			<td>Resonance</td>
		</tr>
		<tr>
			<td>72</td>
			<td>✓</td>
			<td>Release Time</td>
		</tr>
		<tr>
			<td>73</td>
			<td>✓</td>
			<td>Attack Time</td>
		</tr>
		<tr>
			<td>74</td>
			<td>✓</td>
			<td>Brightness</td>
		</tr>
		<tr>
			<td>75</td>
			<td>✓</td>
			<td>Decay Time</td>
		</tr>
		<tr>
			<td>76</td>
			<td>✓</td>
			<td>Vibrato Rate</td>
		</tr>
		<tr>
			<td>77</td>
			<td>✓</td>
			<td>Vibrato Depth</td>
		</tr>
		<tr>
			<td>78</td>
			<td>✓</td>
			<td>Vibrato Delay</td>
		</tr>
		<tr>
			<td>84</td>
			<td>✓</td>
			<td>Portamento Source Note</td>
		</tr>
		<tr>
			<td>88</td>
			<td>✓</td>
			<td>High Resolution Velocity<br/><i>Store only</i></td>
		</tr>
		<tr>
			<td>91</td>
			<td>✓</td>
			<td>Effect 1 Send (Reverb)</td>
		</tr>
		<tr>
			<td>92</td>
			<td>✓</td>
			<td>Effect 2 Send (Tremolo)</td>
		</tr>
		<tr>
			<td>93</td>
			<td>✓</td>
			<td>Effect 3 Send (Chorus)</td>
		</tr>
		<tr>
			<td>94</td>
			<td>✓</td>
			<td>Effect 4 Send (Variation/Delay)</td>
		</tr>
		<tr>
			<td>95</td>
			<td>✓</td>
			<td>Effect 5 Send (Phaser)</td>
		</tr>
		<tr>
			<td>96</td>
			<td>✓</td>
			<td>Data Increment</td>
		</tr>
		<tr>
			<td>97</td>
			<td>✓</td>
			<td>Data Decrement</td>
		</tr>
		<tr>
			<td>98</td>
			<td>✓</td>
			<td>LSB NRPN</td>
		</tr>
		<tr>
			<td>99</td>
			<td>✓</td>
			<td>MSB NRPN</td>
		</tr>
		<tr>
			<td>100</td>
			<td>✓</td>
			<td>LSB RPN</td>
		</tr>
		<tr>
			<td>101</td>
			<td>✓</td>
			<td>MSB RPN</td>
		</tr>
		<tr>
			<td>120</td>
			<td>✕</td>
			<td>All Sound Off</td>
		</tr>
		<tr>
			<td>121</td>
			<td>✓</td>
			<td>All Controllers Reset</td>
		</tr>
		<tr>
			<td>123</td>
			<td>✓</td>
			<td>All Notes Off</td>
		</tr>
		<tr>
			<td>124</td>
			<td>✕</td>
			<td>Omni Off<br/><i>Same as cc123</i></td>
		</tr>
		<tr>
			<td>125</td>
			<td>✕</td>
			<td>Omni On<br/><i>Same as cc123</i></td>
		</tr>
		<tr>
			<td>126</td>
			<td>✓</td>
			<td>Mono</td>
		</tr>
		<tr>
			<td>127</td>
			<td>✓</td>
			<td>Poly</td>
		</tr>
		<tr>
			<td>128</td>
			<td>✓</td>
			<td>Dry level (internal)</td>
		</tr>
		<tr>
			<td>129</td>
			<td>✓</td>
			<td>VL Breath Strength (internal)</td>
		</tr>
		<tr>
			<td>130</td>
			<td>✓</td>
			<td>VL Pressure (internal)</td>
		</tr>
		<tr>
			<td>131</td>
			<td>✓</td>
			<td>VL Embouchure (internal)</td>
		</tr>
		<tr>
			<td>132</td>
			<td>✓</td>
			<td>VL Tonguing (internal)</td>
		</tr>
		<tr>
			<td>133</td>
			<td>✓</td>
			<td>VL Scream (internal)</td>
		</tr>
		<tr>
			<td>134</td>
			<td>✓</td>
			<td>VL Breath Noise (internal)</td>
		</tr>
		<tr>
			<td>135</td>
			<td>✓</td>
			<td>VL Growl (internal)</td>
		</tr>
		<tr>
			<td>136</td>
			<td>✓</td>
			<td>VL Throat Formant (internal)</td>
		</tr>
		<tr>
			<td>137</td>
			<td>✓</td>
			<td>VL Harmonic Enhancer (internal)</td>
		</tr>
		<tr>
			<td>138</td>
			<td>✓</td>
			<td>VL Damping (internal)</td>
		</tr>
		<tr>
			<td>139</td>
			<td>✓</td>
			<td>VL Absorption (internal)</td>
		</tr>
		<tr>
			<td>140</td>
			<td>✓</td>
			<td>VL Filter (internal)</td>
		</tr>
		<tr>
			<td>141</td>
			<td>✓</td>
			<td>VL Amplitude (internal)</td>
		</tr>
		<tr>
			<td>142~149</td>
			<td>✓</td>
			<td>DX Carrier Level 1~8 (internal)</td>
		</tr>
		<tr>
			<td>150~157</td>
			<td>✓</td>
			<td>DX Modulator Level 1~8 (internal)</td>
		</tr>
		<tr>
			<td rowspan=13>Registered Parameters</td>
			<td><code>0x0000</code></td>
			<td>✓</td>
			<td>Pitch Bend Range/Sensitivity</td>
		</tr>
		<tr>
			<td><code>0x0001</code></td>
			<td>✓</td>
			<td>Fine Tuning</td>
		</tr>
		<tr>
			<td><code>0x0002</code></td>
			<td>✓</td>
			<td>Coarse Tuning</td>
		</tr>
		<tr>
			<td><code>0x0005</code></td>
			<td>✓</td>
			<td>Modulation Depth</td>
		</tr>
		<tr>
			<td><code>0x3d00</code></td>
			<td>✕</td>
			<td>3D Azimuth Angle</td>
		</tr>
		<tr>
			<td><code>0x3d01</code></td>
			<td>✕</td>
			<td>3D Elevation Angle</td>
		</tr>
		<tr>
			<td><code>0x3d02</code></td>
			<td>✕</td>
			<td>3D Gain</td>
		</tr>
		<tr>
			<td><code>0x3d03</code></td>
			<td>✕</td>
			<td>3D Distance Ratio</td>
		</tr>
		<tr>
			<td><code>0x3d04</code></td>
			<td>✕</td>
			<td>3D Max Distance</td>
		</tr>
		<tr>
			<td><code>0x3d05</code></td>
			<td>✕</td>
			<td>3D Gain at Bound</td>
		</tr>
		<tr>
			<td><code>0x3d06</code></td>
			<td>✕</td>
			<td>3D Reference Distance Ratio</td>
		</tr>
		<tr>
			<td><code>0x3d07</code></td>
			<td>✕</td>
			<td>3D Pan Spread Angle</td>
		</tr>
		<tr>
			<td><code>0x3d08</code></td>
			<td>✕</td>
			<td>3D Roll Angle</td>
		</tr>
		<tr>
			<td rowspan=29>Non-Registered Parameters</td>
			<td><code>0x0108</code></td>
			<td>✓</td>
			<td>Vibrato Rate<br/><i>Redirected to cc76</i></td>
		</tr>
		<tr>
			<td><code>0x0109</code></td>
			<td>✓</td>
			<td>Vibrato Depth<br/><i>Redirected to cc77</i></td>
		</tr>
		<tr>
			<td><code>0x010a</code></td>
			<td>✓</td>
			<td>Vibrato Delay<br/><i>Redirected to cc78</i></td>
		</tr>
		<tr>
			<td><code>0x0120</code></td>
			<td>✓</td>
			<td>Brightness (LPF Cutoff)<br/><i>Redirected to cc74</i></td>
		</tr>
		<tr>
			<td><code>0x0121</code></td>
			<td>✓</td>
			<td>Resonance<br/><i>Redirected to cc71</i></td>
		</tr>
		<tr>
			<td><code>0x0124</code></td>
			<td>✓</td>
			<td>HPF Cutoff</td>
		</tr>
		<tr>
			<td><code>0x0130</code></td>
			<td>✓</td>
			<td>EQ Bass Gain</td>
		</tr>
		<tr>
			<td><code>0x0131</code></td>
			<td>✓</td>
			<td>EQ Treble Gain</td>
		</tr>
		<tr>
			<td><code>0x0134</code></td>
			<td>✓</td>
			<td>EQ Bass Frequency</td>
		</tr>
		<tr>
			<td><code>0x0135</code></td>
			<td>✓</td>
			<td>EQ Treble Frequency</td>
		</tr>
		<tr>
			<td><code>0x0163</code></td>
			<td>✓</td>
			<td>Attack Time<br/><i>Redirected to cc73</i></td>
		</tr>
		<tr>
			<td><code>0x0164</code></td>
			<td>✓</td>
			<td>Decay Time<br/><i>Redirected to cc75</i></td>
		</tr>
		<tr>
			<td><code>0x0166</code></td>
			<td>✓</td>
			<td>Release Time<br/><i>Redirected to cc72</i></td>
		</tr>
		<tr>
			<td><code>0x14rr</code></td>
			<td>✓</td>
			<td>Drum Brightness (LPF Cutoff)</td>
		</tr>
		<tr>
			<td><code>0x15rr</code></td>
			<td>✓</td>
			<td>Drum Resonance</td>
		</tr>
		<tr>
			<td><code>0x16rr</code></td>
			<td>✓</td>
			<td>Drum Attack Time</td>
		</tr>
		<tr>
			<td><code>0x17rr</code></td>
			<td>✓</td>
			<td>Drum Decay Time</td>
		</tr>
		<tr>
			<td><code>0x18rr</code></td>
			<td>✓</td>
			<td>Drum Coarse Tuning</td>
		</tr>
		<tr>
			<td><code>0x19rr</code></td>
			<td>✓</td>
			<td>Drum Fine Tuning</td>
		</tr>
		<tr>
			<td><code>0x1arr</code></td>
			<td>✓</td>
			<td>Drum Level</td>
		</tr>
		<tr>
			<td><code>0x1crr</code></td>
			<td>✓</td>
			<td>Drum Pan</td>
		</tr>
		<tr>
			<td><code>0x1drr</code></td>
			<td>✓</td>
			<td>Drum Reverb Send</td>
		</tr>
		<tr>
			<td><code>0x1err</code></td>
			<td>✓</td>
			<td>Drum Chorus Send</td>
		</tr>
		<tr>
			<td><code>0x1frr</code></td>
			<td>✓</td>
			<td>Drum Variation/Delay Send</td>
		</tr>
		<tr>
			<td><code>0x24rr</code></td>
			<td>✓</td>
			<td>Drum HPF Cutoff</td>
		</tr>
		<tr>
			<td><code>0x30rr</code></td>
			<td>✓</td>
			<td>Drum EQ Bass Gain</td>
		</tr>
		<tr>
			<td><code>0x31rr</code></td>
			<td>✓</td>
			<td>Drum EQ Treble Gain</td>
		</tr>
		<tr>
			<td><code>0x34rr</code></td>
			<td>✓</td>
			<td>Drum EQ Bass Frequency</td>
		</tr>
		<tr>
			<td><code>0x35rr</code></td>
			<td>✓</td>
			<td>Drum EQ Treble Frequency</td>
		</tr>
		<tr>
			<td colspan=2>Program Change</td>
			<td>✓ 0-127</td>
			<td></td>
		</tr>
		<tr>
			<td rowspan=22>System Exclusive</td>
			<td>General MIDI</td>
			<td>✓</td>
			<td></td>
		</tr>
		<tr>
			<td>General MIDI rev. 2</td>
			<td>✓</td>
			<td></td>
		</tr>
		<tr>
			<td>YAMAHA XG</td>
			<td>✓</td>
			<td></td>
		</tr>
		<tr>
			<td>YAMAHA PLG-150AP</td>
			<td>✕</td>
			<td></td>
		</tr>
		<tr>
			<td>YAMAHA PLG-150AN</td>
			<td>✕</td>
			<td></td>
		</tr>
		<tr>
			<td>YAMAHA PLG-150DR/PC</td>
			<td>✕</td>
			<td></td>
		</tr>
		<tr>
			<td>YAMAHA PLG-150DX</td>
			<td>✓</td>
			<td></td>
		</tr>
		<tr>
			<td>YAMAHA PLG-150PF</td>
			<td>✕</td>
			<td></td>
		</tr>
		<tr>
			<td>YAMAHA PLG-100SG</td>
			<td>✓</td>
			<td></td>
		</tr>
		<tr>
			<td>YAMAHA PLG-150VL</td>
			<td>✓</td>
			<td></td>
		</tr>
		<tr>
			<td>YAMAHA TG300</td>
			<td>✓</td>
			<td></td>
		</tr>
		<tr>
			<td>Roland GS</td>
			<td>✓</td>
			<td></td>
		</tr>
		<tr>
			<td>Roland SD</td>
			<td>✓</td>
			<td></td>
		</tr>
		<tr>
			<td>Roland C/M</td>
			<td>✓</td>
			<td></td>
		</tr>
		<tr>
			<td>KORG NS5R</td>
			<td>✓</td>
			<td></td>
		</tr>
		<tr>
			<td>KORG N1R</td>
			<td>✓</td>
			<td>Redirected to NS5R</td>
		</tr>
		<tr>
			<td>KORG X5D(R)</td>
			<td>✓</td>
			<td></td>
		</tr>
		<tr>
			<td>KORG 05R/W</td>
			<td>✓</td>
			<td></td>
		</tr>
		<tr>
			<td>KAWAI GMega</td>
			<td>✓</td>
			<td>Also known as KAWAI K11</td>
		</tr>
		<tr>
			<td>AKAI SG01</td>
			<td>✓</td>
			<td></td>
		</tr>
		<tr>
			<td>CASIO GZ-50M</td>
			<td>✓</td>
			<td></td>
		</tr>
		<tr>
			<td>ALESIS NanoSynth</td>
			<td>✕</td>
			<td></td>
		</tr>
		<tr>
			<td rowspan=3>System Common</td>
			<td>Song position</td>
			<td>✕</td>
			<td></td>
		</tr>
		<tr>
			<td>Song select</td>
			<td>✕</td>
			<td></td>
		</tr>
		<tr>
			<td>Tune</td>
			<td>✕</td>
			<td></td>
		</tr>
		<tr>
			<td rowspan=4>System RealTime</td>
			<td>Clock</td>
			<td>✕</td>
			<td><i>No action defined</i></td>
		</tr>
		<tr>
			<td>Start</td>
			<td>✕</td>
			<td><i>No action defined</i></td>
		</tr>
		<tr>
			<td>Continue</td>
			<td>✕</td>
			<td><i>No action defined</i></td>
		</tr>
		<tr>
			<td>Stop</td>
			<td>✕</td>
			<td><i>No action defined</i></td>
		</tr>
		<tr>
			<td rowspan=2>Aux messages</td>
			<td>Local ON/OFF</td>
			<td>✕</td>
			<td></td>
		</tr>
		<tr>
			<td>Active Sense</td>
			<td>✕</td>
			<td><i>No action defined</i></td>
		</tr>
	</tbody>
</table>
