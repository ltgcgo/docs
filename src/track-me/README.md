# Track me, senpai!
Exploiting reverse psychology to convince people switch to privacy-friendly browsers. Uses a combination of server-side detection of cookie storage.

## Usage
Just deploy the page and appropriate server-side detection.

### Server-side detection
#### Caddy
```sh
@chromeVictims {
	header "Sec-CH-UA-Full-Version-List" *Chrom*
	not {
		header "Cookie" *track-me-senpai*
	}
}
```