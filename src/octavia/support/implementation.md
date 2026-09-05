# Implementation Table
## MIDI Implementation Chart
<div class="table-wrapper">
<table>
	<thead>
		<tr>
			<th colspan=2>Function</th>
			<th colspan=2 title="Recognized">Rx</th>
			<th colspan=2 title="Transmitted">Tx</th>
			<th rowspan=2>Remarks</th>
		</tr>
		<tr>
			<th>Group</th>
			<th>Entry</th>
			<th title="MIDI 1.0">1</th>
			<th title="MIDI 2.0">2</th>
			<th title="MIDI 1.0">1</th>
			<th title="MIDI 2.0">2</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td rowspan=2>Channel</td>
			<td>Default</td>
			<td>✓<br/>1-16</td>
			<td>✕</td>
			<td>✕<br/>1-16</td>
			<td>✕</td>
			<td></td>
		</tr>
		<tr>
			<td>Changed</td>
			<td>✓<br/>1-16</td>
			<td>✕</td>
			<td>✕<br/>1-16</td>
			<td>✕</td>
			<td>Supports up to 256 channels.</td>
		</tr>
		<tr>
			<td colspan=2>Note number</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>0-127</td>
		</tr>
		<tr>
			<td rowspan=2>Mode</td>
			<td>Default</td>
			<td>-<br/>3</td>
			<td>-<br/>3</td>
			<td>-</td>
			<td>-</td>
			<td>Omni off, polyphonic</td>
		</tr>
		<tr>
			<td>Messages</td>
			<td>✓<br/>3, 4</td>
			<td>✕</td>
			<td>✕<br/>3, 4</td>
			<td>✕</td>
			<td></td>
		</tr>
		<tr>
			<td rowspan=4>Velocity</td>
			<td rowspan=2>Note on</td>
			<td>✓</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td><code>9n vv</code></br><code>vv</code>=<code>01 00</code>-<code>7f 7f</code> (<code>0080</code>-<code>3fff</code>)</td>
		</tr>
		<tr>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>✕</td>
			<td><code>9n vv vv</code><br/><code>vvvv</code>=<code>0000</code>-<code>ffff</code></td>
		</tr>
		<tr>
			<td rowspan=2>Note off</td>
			<td>✓</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td><code>8n vv</code><br/><code>vv</code>=<code>00 00</code>-<code>7f 7f</code> (<code>0000</code>-<code>3fff</code>)<br/><br/><code>9n vv</code><br/><code>vv</code>=<code>00 00</code>-<code>00 7f</code> (<code>0000</code>-<code>007f</code>)<br/><i>Velocity ignored.</i></td>
		</tr>
		<tr>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>✕</td>
			<td><code>8n vv vv</code><br/><code>vvvv</code>=<code>0000</code>-<code>ffff</code><br/><i>Velocity ignored.</i></td>
		</tr>
		<tr>
			<td rowspan=4>Aftertouch</td>
			<td rowspan=2>Note</td>
			<td>✓</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>Same as <i>Note On</i>.</td>
		</tr>
		<tr>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>✕</td>
			<td><code>An nn 00<br/>dd dd dd dd</code><br/>32-bit resolution<br/>Truncated to 16-bit.</td>
		</tr>
		<tr>
			<td rowspan=2>Channel</td>
			<td>✓</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>Same as <i>Note On</i>.</td>
		</tr>
		<tr>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>✕</td>
			<td><code>Dn 00 00<br/>dd dd dd dd</code><br/>32-bit resolution<br/>Truncated to 16-bit.</td>
		</tr>
		<tr>
			<td rowspan=3>Pitchbend</td>
			<td rowspan=2>Channel</td>
			<td>✓</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>0-24 semitone steps<br/>14-bit resolution</td>
		</tr>
		<tr>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>✕</td>
			<td>0-24 semitone steps<br/>32-bit resolution</td>
		</tr>
		<tr>
			<td>Note</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>✕</td>
			<td>0-24 semitone steps<br/>32-bit resolution</td>
		</tr>
		<tr>
			<td rowspan=2>Program Change</td>
			<td>MIDI 1.0<br/>Split</td>
			<td>✓<br/>0-127</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td><code>Cn pp</code><br/><code>pp</code>= 0-127</td>
		</tr>
		<tr>
			<td>MIDI 2.0<br/>Packed</td>
			<td></td>
			<td>✕<br/>0-127</td>
			<td></td>
			<td>✕</td>
			<td><code>Cn 00 oo<br/>pp 00 mm ll</code><br/><code>pp</code>= 0-127<br/><code>mm</code>= 0-127<br/><code>ll</code>= 0-127</td>
		</tr>
		<tr>
			<td rowspan=11>Messages</td>
			<td rowspan=2>Control Change</td>
			<td>✓</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td><code>Bn cc dd</code><br/><code>cc</code>= 0-127<br/><code>dd</code>= 0-127</td>
		</tr>
		<tr>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>✕</td>
			<td><code>Bn cc 00<br/>dd dd dd dd</code><br/><code>cc</code>= 0-127<br/><code>dddddddd</code>=<code>0000</code>-<code>ffff</code><br/>Truncated to 31-bits.</td>
		</tr>
		<tr>
			<td rowspan=2>Registered Parameter</td>
			<td>✓</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td><code>Bn 65 mm</code><br/><code>Bn 64 ll</code><br/><code>Bn 06 dd</code><br/><code>mm</code>= 0-127<br/><code>ll</code>= 0-127<br/><code>dd</code>= 0-127</td>
		</tr>
		<tr>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>✕</td>
			<td><code>2n mm ll<br/>dd dd dd dd</code><br/><code>mm</code>= 0-127<br/><code>ll</code>= 0-127<br/><code>dddddddd</code>=<code>0000</code>-<code>ffff</code></td>
		</tr>
		<tr>
			<td rowspan=2>Registered Parameter Shift</td>
			<td>✓</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td><code>Bn 65 mm</code><br/><code>Bn 64 ll</code><br/><code>Bn 60 ??</code><br/><code>mm</code>= 0-127<br/><code>ll</code>= 0-127<br/><br/><code>Bn 60 ??</code><br/><br/><code>Bn 61 ??</code></td>
		</tr>
		<tr>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>✕</td>
			<td><code>4n mm ll<br/>dd dd dd dd</code><br/><code>mm</code>= 0-127<br/><code>ll</code>= 0-127<br/><code>dddddddd</code>=<code>0000</code>-<code>ffff</code></td>
		</tr>
		<tr>
			<td rowspan=2>Non-Registered Parameter</td>
			<td>✓</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td><code>Bn 63 mm</code><br/><code>Bn 62 ll</code><br/><code>Bn 06 dd</code><br/><code>mm</code>= 0-127<br/><code>ll</code>= 0-127<br/><code>dd</code>= 0-127</td>
		</tr>
		<tr>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>✕</td>
			<td><code>3n mm ll<br/>dd dd dd dd</code><br/><code>mm</code>= 0-127<br/><code>ll</code>= 0-127<br/><code>dddddddd</code>=<code>0000</code>-<code>ffff</code></td>
		</tr>
		<tr>
			<td>Non-Registered Parameter Shift</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>✕</td>
			<td><code>5n mm ll<br/>dd dd dd dd</code><br/><code>mm</code>= 0-127<br/><code>ll</code>= 0-127<br/><code>dddddddd</code>=<code>0000</code>-<code>ffff</code></td>
		</tr>
		<tr>
			<td rowspan=2>System Exclusive</td>
			<td>✓</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td><code>F0 dd ... F7</code></td>
		</tr>
		<tr>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>✕</td>
			<td>UMP SysEx</td>
		</tr>
		<tr>
			<td rowspan=70>Control Change Slots</td>
			<td>0</td>
			<td>✓</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>MSB Bank Select</td>
		</tr>
		<tr>
			<td>1</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Modulation</td>
		</tr>
		<tr>
			<td>2</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Breath</td>
		</tr>
		<tr>
			<td>4</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Foot</td>
		</tr>
		<tr>
			<td>5</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Portamento Time</td>
		</tr>
		<tr>
			<td>6</td>
			<td>✓</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>MSB (N)RPN Data Commit</td>
		</tr>
		<tr>
			<td>7</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Volume</td>
		</tr>
		<tr>
			<td>8</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Balance</td>
		</tr>
		<tr>
			<td>10</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Pan</td>
		</tr>
		<tr>
			<td>11</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Expression</td>
		</tr>
		<tr>
			<td>12</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>General-purpose effect<br/>PLG-AN ribbon X</td>
		</tr>
		<tr>
			<td>13</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>General-purpose effect<br/>PLG-AN ribbon Z</td>
		</tr>
		<tr>
			<td>16</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>General-purpose sound</td>
		</tr>
		<tr>
			<td>17</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>General-purpose sound</td>
		</tr>
		<tr>
			<td>18</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>General-purpose sound</td>
		</tr>
		<tr>
			<td>19</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>General-purpose sound</td>
		</tr>
		<tr>
			<td>32</td>
			<td>✓</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>LSB Bank Select</td>
		</tr>
		<tr>
			<td>38</td>
			<td>✓</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>LSB (N)RPN Data Commit</td>
		</tr>
		<tr>
			<td>64</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Sustain (Hold)</td>
		</tr>
		<tr>
			<td>65</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Portamento</td>
		</tr>
		<tr>
			<td>66</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Sostenuto</td>
		</tr>
		<tr>
			<td>67</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Soft Pedal<br/><i>Store only</i></td>
		</tr>
		<tr>
			<td>68</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Legato<br/><i>Store only</i></td>
		</tr>
		<tr>
			<td>69</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Hold 2<br/><i>Store only</i></td>
		</tr>
		<tr>
			<td>70</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Timbre Variation<br/><i>Store only</i></td>
		</tr>
		<tr>
			<td>71</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Resonance</td>
		</tr>
		<tr>
			<td>72</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Release Time</td>
		</tr>
		<tr>
			<td>73</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Attack Time</td>
		</tr>
		<tr>
			<td>74</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Brightness</td>
		</tr>
		<tr>
			<td>75</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Decay Time</td>
		</tr>
		<tr>
			<td>76</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Vibrato Rate</td>
		</tr>
		<tr>
			<td>77</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Vibrato Depth</td>
		</tr>
		<tr>
			<td>78</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Vibrato Delay</td>
		</tr>
		<tr>
			<td>84</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Portamento Source Note</td>
		</tr>
		<tr>
			<td>88</td>
			<td>✓</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>High Resolution Velocity<br/><i>Affects MIDI 1.0 note on and note off</i></td>
		</tr>
		<tr>
			<td>91</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Effect 1 Send (Reverb)</td>
		</tr>
		<tr>
			<td>92</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Effect 2 Send (Tremolo)</td>
		</tr>
		<tr>
			<td>93</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Effect 3 Send (Chorus)</td>
		</tr>
		<tr>
			<td>94</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Effect 4 Send (Variation/Delay)</td>
		</tr>
		<tr>
			<td>95</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Effect 5 Send (Phaser)</td>
		</tr>
		<tr>
			<td>96</td>
			<td>✓</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>RPN Data Increment</td>
		</tr>
		<tr>
			<td>97</td>
			<td>✓</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>RPN Data Decrement</td>
		</tr>
		<tr>
			<td>98</td>
			<td>✓</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>LSB NRPN</td>
		</tr>
		<tr>
			<td>99</td>
			<td>✓</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>MSB NRPN</td>
		</tr>
		<tr>
			<td>100</td>
			<td>✓</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>LSB RPN</td>
		</tr>
		<tr>
			<td>101</td>
			<td>✓</td>
			<td></td>
			<td>✕</td>
			<td></td>
			<td>MSB RPN</td>
		</tr>
		<tr>
			<td>120</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>All Sound Off</td>
		</tr>
		<tr>
			<td>121</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>All Controllers Reset</td>
		</tr>
		<tr>
			<td>122</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Local ON/OFF</td>
		</tr>
		<tr>
			<td>123</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>All Notes Off</td>
		</tr>
		<tr>
			<td>124</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Omni Off<br/><i>Same as cc123</i></td>
		</tr>
		<tr>
			<td>125</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Omni On<br/><i>Same as cc123</i></td>
		</tr>
		<tr>
			<td>126</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Mono</td>
		</tr>
		<tr>
			<td>127</td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Poly</td>
		</tr>
		<tr>
			<td>128</td>
			<td>✓</td>
			<td rowspan="16">✕</td>
			<td>✕</td>
			<td rowspan="16">✕</td>
			<td>Dry level (internal)</td>
		</tr>
		<tr>
			<td>129</td>
			<td>✓</td>
			<td rowspan="15">✕</td>
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
			<td rowspan=15>Registered Parameter Slots</td>
			<td><code>0x0000</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Pitch Bend Range/Sensitivity</td>
		</tr>
		<tr>
			<td><code>0x0001</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Fine Tune</td>
		</tr>
		<tr>
			<td><code>0x0002</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Coarse Tune</td>
		</tr>
		<tr>
			<td><code>0x0003</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Tuning Program Select</td>
		</tr>
		<tr>
			<td><code>0x0004</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Tuning Bank Select</td>
		</tr>
		<tr>
			<td><code>0x0005</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Modulation Depth</td>
		</tr>
		<tr>
			<td><code>0x3d00</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>3D Azimuth Angle</td>
		</tr>
		<tr>
			<td><code>0x3d01</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>3D Elevation Angle</td>
		</tr>
		<tr>
			<td><code>0x3d02</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>3D Gain</td>
		</tr>
		<tr>
			<td><code>0x3d03</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>3D Distance Ratio</td>
		</tr>
		<tr>
			<td><code>0x3d04</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>3D Max Distance</td>
		</tr>
		<tr>
			<td><code>0x3d05</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>3D Gain at Bound</td>
		</tr>
		<tr>
			<td><code>0x3d06</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>3D Reference Distance Ratio</td>
		</tr>
		<tr>
			<td><code>0x3d07</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>3D Pan Spread Angle</td>
		</tr>
		<tr>
			<td><code>0x3d08</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>3D Roll Angle</td>
		</tr>
		<tr>
			<td rowspan=60>Non-Registered Parameter Slots</td>
			<td><code>0x0108</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Vibrato Rate<br/><i>Redirected to cc76</i></td>
		</tr>
		<tr>
			<td><code>0x0109</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Vibrato Depth<br/><i>Redirected to cc77</i></td>
		</tr>
		<tr>
			<td><code>0x010a</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Vibrato Delay<br/><i>Redirected to cc78</i></td>
		</tr>
		<tr>
			<td><code>0x0120</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Brightness (LPF Cutoff)<br/><i>Redirected to cc74</i></td>
		</tr>
		<tr>
			<td><code>0x0121</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Resonance<br/><i>Redirected to cc71</i></td>
		</tr>
		<tr>
			<td><code>0x0124</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HPF Cutoff</td>
		</tr>
		<tr>
			<td><code>0x0130</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>EQ Bass Gain</td>
		</tr>
		<tr>
			<td><code>0x0131</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>EQ Treble Gain</td>
		</tr>
		<tr>
			<td><code>0x0134</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>EQ Bass Frequency</td>
		</tr>
		<tr>
			<td><code>0x0135</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>EQ Treble Frequency</td>
		</tr>
		<tr>
			<td><code>0x0163</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Attack Time<br/><i>Redirected to cc73</i></td>
		</tr>
		<tr>
			<td><code>0x0164</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Decay Time<br/><i>Redirected to cc75</i></td>
		</tr>
		<tr>
			<td><code>0x0166</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Release Time<br/><i>Redirected to cc72</i></td>
		</tr>
		<tr>
			<td><code>0x14rr</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Drum Brightness (LPF Cutoff)</td>
		</tr>
		<tr>
			<td><code>0x15rr</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Drum Resonance</td>
		</tr>
		<tr>
			<td><code>0x16rr</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Drum Attack Time</td>
		</tr>
		<tr>
			<td><code>0x17rr</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Drum Decay Time</td>
		</tr>
		<tr>
			<td><code>0x18rr</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Drum Coarse Tune</td>
		</tr>
		<tr>
			<td><code>0x19rr</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Drum Fine Tune</td>
		</tr>
		<tr>
			<td><code>0x1arr</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Drum Level</td>
		</tr>
		<tr>
			<td><code>0x1crr</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Drum Pan</td>
		</tr>
		<tr>
			<td><code>0x1drr</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Drum Reverb Send</td>
		</tr>
		<tr>
			<td><code>0x1err</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Drum Chorus Send</td>
		</tr>
		<tr>
			<td><code>0x1frr</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Drum Variation/Delay Send</td>
		</tr>
		<tr>
			<td><code>0x24rr</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Drum HPF Cutoff</td>
		</tr>
		<tr>
			<td><code>0x30rr</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Drum EQ Bass Gain</td>
		</tr>
		<tr>
			<td><code>0x31rr</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Drum EQ Treble Gain</td>
		</tr>
		<tr>
			<td><code>0x34rr</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Drum EQ Bass Frequency</td>
		</tr>
		<tr>
			<td><code>0x35rr</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>Drum EQ Treble Frequency</td>
		</tr>
		<tr>
			<td><code>0x4100</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>SD-20 Set Selection</td>
		</tr>
		<tr>
			<td><code>0x5801</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Charactor<br/><i>Store only</i></td>
		</tr>
		<tr>
			<td><code>0x5820</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Tone Switch</td>
		</tr>
		<tr>
			<td><code>0x5822</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Tone Bass Gain</td>
		</tr>
		<tr>
			<td><code>0x5824</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Tone Treble Gain</td>
		</tr>
		<tr>
			<td><code>0x5827</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Tone Mid Gain</td>
		</tr>
		<tr>
			<td><code>0x5830</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Scale Tune C</td>
		</tr>
		<tr>
			<td><code>0x5831</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Scale Tune C#</td>
		</tr>
		<tr>
			<td><code>0x5832</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Scale Tune D</td>
		</tr>
		<tr>
			<td><code>0x5833</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Scale Tune Eb</td>
		</tr>
		<tr>
			<td><code>0x5834</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Scale Tune E</td>
		</tr>
		<tr>
			<td><code>0x5835</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Scale Tune F</td>
		</tr>
		<tr>
			<td><code>0x5836</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Scale Tune F#</td>
		</tr>
		<tr>
			<td><code>0x5837</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Scale Tune G</td>
		</tr>
		<tr>
			<td><code>0x5838</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Scale Tune Ab</td>
		</tr>
		<tr>
			<td><code>0x5839</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Scale Tune A</td>
		</tr>
		<tr>
			<td><code>0x583a</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Scale Tune Bb</td>
		</tr>
		<tr>
			<td><code>0x583b</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Scale Tune B</td>
		</tr>
		<tr>
			<td><code>0x5840</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Reverb Global Switch</td>
		</tr>
		<tr>
			<td><code>0x5841</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Reverb Type</td>
		</tr>
		<tr>
			<td><code>0x5842</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Reverb Time</td>
		</tr>
		<tr>
			<td><code>0x5850</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Chorus Global Switch</td>
		</tr>
		<tr>
			<td><code>0x5851</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Chorus Type</td>
		</tr>
		<tr>
			<td><code>0x5852</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Chorus Rate</td>
		</tr>
		<tr>
			<td><code>0x5853</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Chorus Depth</td>
		</tr>
		<tr>
			<td><code>0x5854</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Chorus Feedback</td>
		</tr>
		<tr>
			<td><code>0x5855</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Chorus to Reverb Send</td>
		</tr>
		<tr>
			<td><code>0x5870</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Master Volume</td>
		</tr>
		<tr>
			<td><code>0x5871</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Master Fine Tune</td>
		</tr>
		<tr>
			<td><code>0x5872</code></td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas Master Coarse Tune</td>
		</tr>
		<tr>
			<td><code>0x587f</code></td>
			<td>✓</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>HyperCanvas System Reset</td>
		</tr>
		<tr>
			<td rowspan=29>System Exclusive<br/>Standard Support</td>
			<td>General MIDI</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>General MIDI 2</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>YAMAHA XG</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>YAMAHA PLG-150AP/DR/PC/PF</td>
			<td>✕</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td>AWM2 plugin cards</td>
		</tr>
		<tr>
			<td>YAMAHA PLG-150AN</td>
			<td>✕</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>YAMAHA PLG-150DX</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>YAMAHA PLG-100SG</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>YAMAHA PLG-150VL</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>YAMAHA CS2x</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>YAMAHA S90 ES</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>YAMAHA Motif ES</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>YAMAHA TG300</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>YAMAHA DOC</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td>Yamaha Clavinova included.</td>
		</tr>
		<tr>
			<td>YAMAHA QY10</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>YAMAHA QY20</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>Roland GS</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>Roland SD</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>Roland C/M</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td>Roland MT-32 included.</td>
		</tr>
		<tr>
			<td>KORG NS5R</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>KORG N1R</td>
			<td>✕</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td>Redirected to NS5R</td>
		</tr>
		<tr>
			<td>KORG X5D(R)</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>KORG 05R/W</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>KORG PA</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>KORG KROSS 2</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>KAWAI GMega</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td>Also known as KAWAI K11</td>
		</tr>
		<tr>
			<td>AKAI SG01</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>CASIO GZ-50M</td>
			<td>✓</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>ALESIS NanoSynth</td>
			<td>✕</td>
			<td>←</td>
			<td>✕</td>
			<td>←</td>
			<td></td>
		</tr>
		<tr>
			<td>Gravis UltraSound</td>
			<td colspan=4>-</td>
			<td>GUS does not have additional SysEx support.</td>
		</tr>
		<tr>
			<td rowspan=3>System Common</td>
			<td>Song position</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td></td>
		</tr>
		<tr>
			<td>Song select</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td></td>
		</tr>
		<tr>
			<td>Tune</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td></td>
		</tr>
		<tr>
			<td rowspan=5>System Realtime</td>
			<td>Time Code</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td><i>No action defined</i></td>
		</tr>
		<tr>
			<td>Clock</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td><i>No action defined</i></td>
		</tr>
		<tr>
			<td>Start</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td><i>No action defined</i></td>
		</tr>
		<tr>
			<td>Continue</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td><i>No action defined</i></td>
		</tr>
		<tr>
			<td>Stop</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td><i>No action defined</i></td>
		</tr>
		<tr>
			<td rowspan=3>Aux Messages</td>
			<td>Local ON/OFF</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td></td>
		</tr>
		<tr>
			<td>Active Sense</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td><i>No action defined</i></td>
		</tr>
		<tr>
			<td>Reset</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td>✕</td>
			<td><i>No action defined</i></td>
		</tr>
	</tbody>
</table>
</div>

### Notes
- Some cells are blank because they are in an invalid combination. For example it doesn't make sense to indicate MIDI 2.0 status in a MIDI 1.0 column.
- The state engine itself may truncate the resolution of some MIDI 2.0 messages, which effects transmission but not passthrough. Other components, including MICC, are not affected by truncation.

### Explanations
- `??`: Ignored bytes.
- **Omni**: When active, a single part will receive from all channels (N:1). Octavia does *not* support this mode in any form, its scope only maps channels to parts in a 1:N relationship.
