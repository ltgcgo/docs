# Extensions
## Port assign
Octavia supports the following ways of specifying port assignment: standard meta port assign, XF port assign.

## Lyrics
Octavia supports the following ways of specifying lyrics: text event substitution, standard meta lyrics, XF lyrics.

## Chords
Octavia supports the following ways of specifying chord information: XF chords.

<div class="table-wrapper">
<table><thead><tr>
	<th>Type</th>
	<th>ID</th>
	<th>XF ID</th>
	<th>Specifier</th>
	<th>Name</th>
	<th>Voicing</th>
	<th>Semitones</th>
	<th>On QY?</th>
	<th>On PSR?</th>
</tr></thead><tbody><tr>
	<td>Other</td>
	<td><code>ff</code></td>
	<td><code>7f</code></td>
	<td></td>
	<td>No chords</td>
	<td>1</td>
	<td>0</td>
</tr><tr>
	<td rowspan=11>Major</td>
	<td><code></code></td>
	<td><code>00</code></td>
	<td><code>---</code><br/><code>M</code></td>
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
	<td><code>21</code></td>
	<td><code>sus2</code><br/><code>1+2+5</code></td>
	<td>Suspended second</td>
	<td>1+2+5</td>
	<td>0, 2, 7</td>
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
	<td rowspan=6>Major seventh</td>
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
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td><code>1c</code></td>
	<td><code>M7aug</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td><code>05</code></td>
	<td><code>M7(9)</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td><code>03</code></td>
	<td><code>M7(#11)</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td rowspan=10>Minor</td>
	<td><code></code></td>
	<td><code>08</code></td>
	<td><code>m</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td><code>09</code></td>
	<td><code>m6</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td><code>0c</code></td>
	<td><code>m(9)</code><br/><code>madd9</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td><code>0a</code></td>
	<td><code>m7</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td><code>0b</code></td>
	<td><code>m7b5</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td><code>0d</code></td>
	<td><code>m7(9)</code><br/><code>m7add9</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td><code>0e</code></td>
	<td><code>m7(11)</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td><code>0f</code></td>
	<td><code>mM7</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td>✕</td>
	<td><code>mM7b5</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td><code>10</code></td>
	<td><code>mM7(9)</code><br/><code>mM7add9</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td rowspan=10>Dominant</td>
	<td><code></code></td>
	<td><code>13</code></td>
	<td><code>7</code></td>
	<td></td>
	<td></td>
	<td></td>
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
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td><code>12</code></td>
	<td><code>dim7</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr><tr>
	<td rowspan=3>Other</td>
	<td><code></code></td>
	<td><code>1e</code></td>
	<td><code>1+8</code></td>
	<td></td>
	<td>1+8</td>
	<td>0, 12</td>
</tr><tr>
	<td><code></code></td>
	<td><code>1f</code></td>
	<td><code>5</code><br/><code>1+5</code></td>
	<td></td>
	<td>1+5</td>
	<td></td>
</tr><tr>
	<td><code></code></td>
	<td><code>22</code></td>
	<td><code>cc</code></td>
	<td></td>
	<td></td>
	<td></td>
</tr></tbody></table>
</div>