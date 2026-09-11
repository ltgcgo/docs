# Octavia Scroll
> _See also: [Mane](./mane.md)_

**Octavia Scroll**, also known as _MIDI Database_ or `midi-db`, is a data sheet collection supplying comprehensive voice bank, variable name mappings and EFX ID mappings to the Octavia project.

## Built artefacts
Octavia Scroll also builds compatible definition files from its own data sheets with ridiculously large coverage.

### Cakewalk Instrument Definition
These files are intended to be used with [Falcosoft SoundFont MIDI Player](https://falcosoft.hu/softwares.html#midiplayer).

- [`OctaviaRecommend.ins`](https://gh.ltgc.cc/midi-db/dist/OctaviaRecommend.ins) (mixed)
- [`OctaviaAlternative.ins`](https://gh.ltgc.cc/midi-db/dist/OctaviaAlternative.ins) (mixed)

| Target | R | A |
| ------ | - | - |
| MU2000EX | ✓ | ✓ |
| PSR-2000 | ✓ | ✓ |
| SC-8850 | ✓ | ✓ |
| PA1x | ✓ | ✓ |
| SD-90 | ✕ | ✓ |
| NS5R | ✕ | ✓ |
| PLG150-DR | ✓ | ✓ |
| PLG150-PC | ✓ | ✓ |
| PLG150-PF | ✓ | ✕ |
| PLG150-AP | ✓ | ✕ |
| PLG150-VL | ✓ | ✕ |
| PLG100-SG | ✓ | ✕ |
| PLG150-DX | ✓ | ✕ |
| PLG150-AN | ✓ | ✓ |

- The drum kits in `OctaviaAlternative.ins` default to SC-88 Pro instead of SC-88 with unset MSB.

### MusE Instrument Definition File
These files are intended to be used with [MusE](https://muse-sequencer.github.io/).

TBD

## Bank allocation plane
### Allocation table
The table below shows how Octavia maps voices internally from raw bank values. It may reflect how the real hardware allocates the bank planes, however it does *not* reflect the actual raw bank values.

Columns indicate bank LSB, rows indicate bank MSB.

<div class="table-wrapper">
<style>table td {
	text-align: center;
}
table > tbody > tr > td:nth-child(1) {
	font-weight: bold;
	background: #7f7f7f33;
}
td > span.glue {
	display: inline-block;
	width: max-content;
}
td.roll-0 {background: #0f05}
td.roll-1 {background: #0fa5}
td.roll-2 {background: #0af5}
td.roll-3 {background: #05f5}
td.roll-4 {background: #80f5}
td.roll-5 {background: #f5a5}
td.roll-6 {background: #f505}
td.roll-7 {background: #af05}</style>
<table>
<thead><tr>
	<th></th>
	<th>000</th>
	<th>001</th>
	<th>002</th>
	<th>003</th>
	<th>004</th>
	<th>005</th>
	<th>006</th>
	<th>007</th>
	<th>008</th>
	<th>009</th>
	<th>010</th>
	<th>011</th>
	<th>012</th>
	<th>013</th>
	<th>014</th>
	<th>015</th>
	<th>016</th>
	<th>017</th>
	<th>018</th>
	<th>019</th>
	<th>020</th>
	<th>021</th>
	<th>022</th>
	<th>023</th>
	<th>024</th>
	<th>025</th>
	<th>026</th>
	<th>027</th>
	<th>028</th>
	<th>029</th>
	<th>030</th>
	<th>031</th>
	<th>032</th>
	<th>033</th>
	<th>034</th>
	<th>035</th>
	<th>036</th>
	<th>037</th>
	<th>038</th>
	<th>039</th>
	<th>040</th>
	<th>041</th>
	<th>042</th>
	<th>043</th>
	<th>044</th>
	<th>045</th>
	<th>046</th>
	<th>047</th>
	<th>048</th>
	<th>049</th>
	<th>050</th>
	<th>051</th>
	<th>052</th>
	<th>053</th>
	<th>054</th>
	<th>055</th>
	<th>056</th>
	<th>057</th>
	<th>058</th>
	<th>059</th>
	<th>060</th>
	<th>061</th>
	<th>062</th>
	<th>063</th>
	<th>064</th>
	<th>065</th>
	<th>066</th>
	<th>067</th>
	<th>068</th>
	<th>069</th>
	<th>070</th>
	<th>071</th>
	<th>072</th>
	<th>073</th>
	<th>074</th>
	<th>075</th>
	<th>076</th>
	<th>077</th>
	<th>078</th>
	<th>079</th>
	<th>080</th>
	<th>081</th>
	<th>082</th>
	<th>083</th>
	<th>084</th>
	<th>085</th>
	<th>086</th>
	<th>087</th>
	<th>088</th>
	<th>089</th>
	<th>090</th>
	<th>091</th>
	<th>092</th>
	<th>093</th>
	<th>094</th>
	<th>095</th>
	<th>096</th>
	<th>097</th>
	<th>098</th>
	<th>099</th>
	<th>100</th>
	<th>101</th>
	<th>102</th>
	<th>103</th>
	<th>104</th>
	<th>105</th>
	<th>106</th>
	<th>107</th>
	<th>108</th>
	<th>109</th>
	<th>110</th>
	<th>111</th>
	<th>112</th>
	<th>113</th>
	<th>114</th>
	<th>115</th>
	<th>116</th>
	<th>117</th>
	<th>118</th>
	<th>119</th>
	<th>120</th>
	<th>121</th>
	<th>122</th>
	<th>123</th>
	<th>124</th>
	<th>125</th>
	<th>126</th>
	<th>127</th>
	<th>128</th>
	<th>129</th>
	<th>130</th>
	<th>131</th>
	<th>132</th>
	<th>133</th>
	<th>134</th>
	<th>135</th>
	<th>136</th>
	<th>137</th>
	<th>138</th>
	<th>139</th>
	<th>140</th>
	<th>141</th>
	<th>142</th>
	<th>143</th>
	<th>144</th>
	<th>145</th>
	<th>146</th>
	<th>147</th>
	<th>148</th>
	<th>149</th>
	<th>150</th>
	<th>151</th>
	<th>152</th>
	<th>153</th>
	<th>154</th>
	<th>155</th>
	<th>156</th>
	<th>157</th>
	<th>158</th>
	<th>159</th>
</tr></thead>
<tbody><tr>
	<td>000</td>
	<td class="roll-0">GM 1<br/>Capital</td>
	<td class="roll-1">XG<br/>KSP</td>
	<td class=""></td>
	<td class="roll-2">XG<br/>Stereo</td>
	<td class="roll-6">GMega<br/>MT-32</td>
	<td class=""></td>
	<td class="roll-3">XG<br/>Single</td>
	<td class=""></td>
	<td class="roll-4">XG<br/>Slow</td>
	<td class="" colspan=3></td>
	<td class="roll-5">XG<br/>Fast Decay</td>
	<td class=""></td>
	<td class="roll-6">XG<br/>Double Attack</td>
	<td class=""></td>
	<td class="roll-7" colspan=2>XG Bright</td>
	<td class="roll-0" colspan=2>XG Dark</td>
	<td class="roll-1">XG<br/>Resonant</td>
	<td class="roll-2">XG<br/>LFO LPF</td>
	<td class="roll-3">XG<br/>Velocity LPF</td>
	<td class=""></td>
	<td class="roll-4">XG<br/>Attack</td>
	<td class="roll-5">XG<br/>Release</td>
	<td class="roll-6">XG<br/>Sweep</td>
	<td class="roll-7">XG<br/>Resonant Sweep</td>
	<td class="roll-0">XG<br/>Muted</td>
	<td class="roll-1">XG<br/>Complex Filter EG</td>
	<td class="" colspan=2></td>
	<td class="roll-2" colspan=3>XG Detuned</td>
	<td class="roll-3" colspan=2>XG Octave</td>
	<td class="roll-4" colspan=2>XG Fifth</td>
	<td class="roll-5">XG Bend</td>
	<td class="roll-6" colspan=3>XG Tutti</td>
	<td class="roll-7">XG Velo<br/>(Velocity Switch)</td>
	<td class=""></td>
	<td class="roll-0">XG VX<br/>(Velocity Crossfade)</td>
	<td class="" colspan=2></td>
	<td class="roll-1">XG<br/>Detune</td>
	<td class="" colspan=3></td>
	<td class="roll-2" colspan=3>XG Tutti</td>
	<td class="" colspan=9></td>
	<td class="roll-3" colspan=31>XG Other Waves</td>
	<td class=""></td>
	<td class="roll-4" colspan=6>XG Other Instrument</td>
	<td class="" colspan=10></td>
	<td class="roll-2" colspan=3>XG QY100<br/>Exclusive</td>
	<td class="" colspan=11></td>
	<td class="roll-7">XG MU100<br/>Native</td>
	<td class=""></td>
	<td class="roll-6" colspan=16>XG PSR<br/>Panel 1</td>
	<td class="roll-5" colspan=8>XG PSR<br/>Panel 2</td>
	<td class="roll-0"><span class="glue">XG PSR</span><br/>Native</td>
</tr><tr>
	<td>001</td>
	<td class="roll-1" rowspan=7>GS SC-55<br/>Section 1</td>
	<td class="" rowspan=7></td>
	<td class="roll-2" rowspan=7>GS SC-88<br/>Section 1</td>
	<td class="roll-3" rowspan=7>GS SC-88 Pro<br/>Section 1</td>
	<td class="roll-4" rowspan=7>GS SC-8850<br/>Section 1</td>
	<td class="" colspan=123 rowspan=47></td>
</tr><tr>
	<td>002</td>
</tr><tr>
	<td>003</td>
</tr><tr>
	<td>004</td>
</tr><tr>
	<td>005</td>
</tr><tr>
	<td>006</td>
</tr><tr>
	<td>007</td>
</tr><tr>
	<td>008</td>
	<td class="roll-0" rowspan=2>GS SC-55<br/>Section 2</td>
	<td class="" rowspan=8></td>
	<td class="roll-1" rowspan=4>GS SC-88<br/>Section 2</td>
	<td class="roll-2" rowspan=8>GS SC-88 Pro<br/>Section 2</td>
	<td class="roll-3" rowspan=8>GS SC-8850<br/>Section 2</td>
</tr><tr>
	<td>009</td>
</tr><tr>
	<td>010</td>
	<td class="" rowspan=6></td>
</tr><tr>
	<td>011</td>
</tr><tr>
	<td>012</td>
	<td class="" rowspan=4></td>
</tr><tr>
	<td>013</td>
</tr><tr>
	<td>014</td>
</tr><tr>
	<td>015</td>
</tr><tr>
	<td>016</td>
	<td class="roll-0" rowspan=4>GS SC-55<br/>Section 3</td>
	<td class="" rowspan=8></td>
	<td class="roll-1" rowspan=4>GS SC-88<br/>Section 3</td>
	<td class="roll-2" rowspan=8>GS SC-88 Pro<br/>Section 3</td>
	<td class="roll-3" rowspan=8>GS SC-8850<br/>Section 3</td>
	<td class="roll-4" colspan=2><span class="glue">XG MU2000</span>Sampling</td>
</tr><tr>
	<td>017</td>
</tr><tr>
	<td>018</td>
</tr><tr>
	<td>019</td>
</tr><tr>
	<td>020</td>
	<td class="" rowspan=4></td>
	<td class="" rowspan=4></td>
</tr><tr>
	<td>021</td>
</tr><tr>
	<td>022</td>
</tr><tr>
	<td>023</td>
</tr><tr>
	<td>024</td>
	<td class="roll-0">GS SC-55<br/>Section 4</td>
	<td class="" rowspan=8></td>
	<td class="roll-1" rowspan=3>GS SC-88<br/>Section 4</td>
	<td class="roll-2" rowspan=8>GS SC-88 Pro<br/>Section 4</td>
	<td class="roll-3" rowspan=8>GS SC-8850<br/>Section 4</td>
</tr><tr>
	<td>025</td>
	<td class="" rowspan=7></td>
</tr><tr>
	<td>026</td>
</tr><tr>
	<td>027</td>
	<td class="" rowspan=5></td>
</tr><tr>
	<td>028</td>
</tr><tr>
	<td>029</td>
</tr><tr>
	<td>030</td>
</tr><tr>
	<td>031</td>
</tr><tr>
	<td>032</td>
	<td class="roll-0">GS SC-55<br/>Section 5</td>
	<td class="" rowspan=8></td>
	<td class="roll-1" rowspan=2>GS SC-88<br/>Section 5</td>
	<td class="roll-2" rowspan=4>GS SC-88 Pro<br/>Section 5</td>
	<td class="roll-3" rowspan=8>GS SC-8850<br/>Section 5</td>
</tr><tr>
	<td>033</td>
</tr><tr>
	<td>034</td>
</tr><tr>
	<td>035</td>
</tr><tr>
	<td>036</td>
</tr><tr>
	<td>037</td>
</tr><tr>
	<td>038</td>
</tr><tr>
	<td>039</td>
</tr><tr>
	<td>040</td>
	<td class="" colspan=2 rowspan=8></td>
	<td class="roll-0">GS SC-88<br/>Section 6</td>
	<td class="roll-1" rowspan=6>GS SC-88 Pro<br/>Section 6</td>
	<td class="roll-2" rowspan=8>GS SC-8850<br/>Section 6</td>
</tr><tr>
	<td>041</td>
</tr><tr>
	<td>042</td>
</tr><tr>
	<td>043</td>
</tr><tr>
	<td>044</td>
</tr><tr>
	<td>045</td>
</tr><tr>
	<td>046</td>
</tr><tr>
	<td>047</td>
</tr><tr>
	<td>048</td>
	<td class="roll-0">XG MU<br/>Timbre</td>
	<td class=""></td>
	<td class="roll-1">GS SC-88<br/>Section 7</td>
	<td class="roll-2">GS SC-88 Pro<br/>Section 7</td>
	<td class="roll-3">GS SC-8850<br/>Section 7</td>
	<td class="" colspan=3></td>
	<td class="roll-4">XG MU<br/>Poly Timbre</td>
	<td class="" colspan=7></td>
	<td class="roll-5">XG MU<br/>Looped Timbre</td>
	<td class="" colspan=7></td>
	<td class="roll-6">XG MU<br/>Looped Poly Timbre</td>
	<td class="" colspan=23></td>
	<td class="roll-0">XG MU<br/>Looped Phrase</td>
	<td class="" colspan=7></td>
	<td class="roll-0">XG MU<br/>Looped Poly Phrase</td>
	<td class="" colspan=7></td>
	<td class="roll-0">XG MU<br/>SFX Timbre</td>
	<td class="" colspan=7></td>
	<td class="roll-0">XG MU<br/>SFX Poly Timbre</td>
	<td class="" colspan=7></td>
	<td class="roll-0">XG MU<br/>SFX Phrase</td>
	<td class="" colspan=7></td>
	<td class="roll-0">XG MU<br/>SFX Poly Phrase</td>
	<td class="" colspan=7></td>
	<td class="roll-0">XG MU<br/>Rhythm Timbre</td>
	<td class="" colspan=7></td>
	<td class="roll-0">XG MU<br/>Rhythm Poly Timbre</td>
	<td class="" colspan=15></td>
	<td class="roll-0">XG MU<br/>Rhythm Poly Phrase</td>
	<td class="" colspan=7></td>
</tr><tr>
	<td>049</td>
	<td class="roll-1">GS SC-55<br/>Capital</td>
	<td class=""></td>
	<td class="roll-2">GS SC-88<br/>Capital</td>
	<td class="roll-3">GS SC-88 Pro<br/>Capital</td>
	<td class="roll-4">GS SC-8850<br/>Capital</td>
	<td class="" colspan=121></td>
	<td class="roll-1">C/M<br/>PCM</td>
	<td class="roll-2">MT-32</td>
</tr><tr>
	<td>050</td>
</tr><tr>
	<td>051</td>
</tr><tr>
	<td>052</td>
</tr><tr>
	<td>053</td>
</tr><tr>
	<td>054</td>
</tr><tr>
	<td>055</td>
</tr><tr>
	<td>056</td>
	<td class="roll-0">GM 1 AG-10<br/>Capital</td>
</tr><tr>
	<td>057</td>
</tr><tr>
	<td>058</td>
</tr><tr>
	<td>059</td>
</tr><tr>
	<td>060</td>
</tr><tr>
	<td>061</td>
	<td class="roll-5">NS5R GS<br/>Drum Kit</td>
</tr><tr>
	<td>062</td>
	<td class="roll-6">GM 1 AG-10<br/>Drum Kit</td>
</tr><tr>
	<td>063</td>
	<td class="roll-7" colspan=6>KROSS 2<br/>Preset Program</td>
	<td class="roll-0" colspan=4>KROSS 2<br/>User Program</td>
	<td class="roll-1" colspan=3>KROSS 2<br/>Preset Combination</td>
	<td class="roll-2" colspan=4>KROSS 2<br/>User Combination</td>
	<td class="roll-3" colspan=4><span class="glue">S90 ES</span><br/>Preset Program</td>
	<td class="roll-4" colspan=2><span class="glue">Yamaha ES</span><br/>User Program</td>
	<td class="roll-5"><span class="glue">Yamaha ES</span><br/>Preset Drums</td>
	<td class="roll-6"><span class="glue">Yamaha ES</span><br/>User Drums</td>
	<td class="roll-3" colspan=3><span class="glue">Yamaha ES</span><br/>Plug User</td>
	<td class="roll-3" colspan=6><span class="glue">Motif ES</span><br/>Preset Program</td>
</tr><tr>
	<td>064</td>
	<td class="roll-0">XG<br/>SFX</td>
</tr><tr>
	<td>065</td>
</tr><tr>
	<td>066</td>
</tr><tr>
	<td>067</td>
	<td class="roll-3">PLG-DX<br/>SFX</td>
</tr><tr>
	<td>068</td>
</tr><tr>
	<td>069</td>
</tr><tr>
	<td>070</td>
</tr><tr>
	<td>071</td>
</tr><tr>
	<td>072</td>
</tr><tr>
	<td>073</td>
</tr><tr>
	<td>074</td>
</tr><tr>
	<td>075</td>
</tr><tr>
	<td>076</td>
</tr><tr>
	<td>077</td>
</tr><tr>
	<td>078</td>
</tr><tr>
	<td>079</td>
</tr><tr>
	<td>080</td>
	<td class="roll-0">NS5R<br/>PrgU</td>
</tr><tr>
	<td>081</td>
	<td class="roll-1">NS5R 05R/W<br/>PrgA</td>
	<td class="roll-2"><span class="glue">03R/W</span><br/>PrgA</td>
</tr><tr>
	<td>082</td>
	<td class="roll-2">NS5R X5DR<br/>PrgB</td>
</tr><tr>
	<td>083</td>
	<td class="roll-3">NS5R<br/>PrgC</td>
</tr><tr>
	<td>084</td>
</tr><tr>
	<td>085</td>
</tr><tr>
	<td>086</td>
</tr><tr>
	<td>087</td>
</tr><tr>
	<td>088</td>
	<td class="roll-0">NS5R<br/>CmbU</td>
</tr><tr>
	<td>089</td>
	<td class="roll-1">NS5R 05R/W<br/>CmbA</td>
	<td class="roll-2"><span class="glue">03R/W</span><br/>CmbA</td>
</tr><tr>
	<td>090</td>
	<td class="roll-2">NS5R X5DR<br/>CmbB</td>
</tr><tr>
	<td>091</td>
	<td class="roll-3">NS5R<br/>CmbC</td>
</tr><tr>
	<td>092</td>
</tr><tr>
	<td>093</td>
</tr><tr>
	<td>094</td>
</tr><tr>
	<td>095</td>
</tr><tr>
	<td>096</td>
</tr><tr>
	<td>097</td>
</tr><tr>
	<td>098</td>
</tr><tr>
	<td>099</td>
</tr><tr>
	<td>100</td>
</tr><tr>
	<td>101</td>
</tr><tr>
	<td>102</td>
</tr><tr>
	<td>103</td>
</tr><tr>
	<td>104</td>
	<td class="" colspan=104></td>
	<td class="roll-4" colspan=48>XG PSR<br/>Compatible</td>
</tr><tr>
	<td>105</td>
</tr><tr>
	<td>106</td>
</tr><tr>
	<td>107</td>
</tr><tr>
	<td>108</td>
	<td class="" colspan=128></td>
	<td class="roll-4" colspan=32>XG PSR<br/>VRM</td>
</tr><tr>
	<td>109</td>
</tr><tr>
	<td>110</td>
</tr><tr>
	<td>111</td>
</tr><tr>
	<td>112</td>
</tr><tr>
	<td>113</td>
</tr><tr>
	<td>114</td>
</tr><tr>
	<td>115</td>
</tr><tr>
	<td>116</td>
</tr><tr>
	<td>117</td>
</tr><tr>
	<td>118</td>
</tr><tr>
	<td>119</td>
</tr><tr>
	<td>120</td>
	<td class="roll-0">GM 2<br/>Drum Kit</td>
	<td class="roll-1">GM 2 PA<br/>Drum Kit</td>
</tr><tr>
	<td>121</td>
	<td class="roll-1">GM 2<br/>Capital</td>
	<td class="roll-2" colspan=9>GM 2<br/>Variation</td>
	<td class="" colspan=6></td>
	<td class="roll-2">GM 2 XG<br/>Capital</td>
	<td class="roll-2" colspan=11>GM 2 XG<br/>Variation</td>
	<td class="" colspan=4></td>
	<td class="roll-2"><span class="glue">GM 2 PA</span><br/>Capital</td>
	<td class="roll-2" colspan=31>GM 2 PA<br/>Variation</td>
</tr><tr>
	<td>122</td>
</tr><tr>
	<td>123</td>
</tr><tr>
	<td>124</td>
</tr><tr>
	<td>125</td>
</tr><tr>
	<td>126</td>
	<td class="roll-6">XG<br/>SFX Kit</td>
	<td class="" colspan=151></td>
	<td class="roll-7">XG PSR<br/>SFX Kit</td>
</tr><tr>
	<td>127</td>
	<td class="roll-7">XG<br/>Drum Kit</td>
	<td class="" colspan=151></td>
	<td class="roll-0">XG PSR<br/>Drum Kit</td>
</tr><tr>
	<td>128</td>
	<td class="roll-0"><span class="glue">GS SC-55</span><br/>Drum Kit</td>
	<td class=""></td>
	<td class="roll-1"><span class="glue">GS SC-88</span><br/>Drum Kit</td>
	<td class="roll-2"><span class="glue">GS SC-88 Pro</span><br/>Drum Kit</td>
	<td class="roll-3"><span class="glue">GS SC-8850</span><br/>Drum Kit</td>
	<td class="" colspan=122></td>
	<td class="roll-4"><span class="glue">MT-32</span><br/>Drum Kit</td>
</tr></tbody>
</table>
</div>