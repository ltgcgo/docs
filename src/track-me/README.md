# Track me, senpai!
Exploiting reverse psychology to convince people switch to privacy-friendly browsers. Uses a combination of server-side detection and cookie storage.

## Usage
Just deploy the page and the appropriate detection method.

### Server-side detection
Server-side detection should not breach any privacy law, as the visitor is already supplying every possible information to the server.

#### Caddy
```sh
header Accept-CH "sec-ch-ua-full-version,ua-full-version,sec-ch-ua-full-version-list"
@chromeVictims {
	header "Sec-CH-UA-Full-Version-List" *Chrom*
	not {
		header "Cookie" *track-me-senpai*
		path /track-me/*
	}
}
@otherVictims {
	header "Sec-CH-UA" `*"Google Chrome"*`
	header "Sec-CH-UA" `*"Microsoft Edge"*`
	header "Sec-CH-UA" `*"Edge"*`
	header "Sec-CH-UA" `*"Opera"*`
	header "Sec-CH-UA" `*Arc*`
	not {
        header "Cookie" *track-me-senpai*
        path /track-me/*
    }
}
redir @chromeVictims /track-me/
redir @otherVictims /track-me/
```

### Client-side detection
Client-side detection may breach privacy laws. It will be developed if requested.
