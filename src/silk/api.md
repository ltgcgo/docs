# Silk API
All APIs are assumed to be hosted at [api.ltgc.cc](https://api.ltgc.cc/) if without further clarification.

## Endpoints
### `GET /nr/silk/servers`
Grab a list of included servers, along with their auto-CW status.

Returns an array of `Server` objects.

### `GET /nr/silk/timeline`
Fetches a list of posts already stored on the server.

Returns an array of `Post` objects.

### `WS/SSE /rt/silk/timeline`
If there are changes made to the timeline, this endpoint will push such changes to the clients.

Sents `EventWrapper` objects regardless of connection type.

## Data structure
### `EventWrapper`
```json
{
	"event": <String>, // "set", "delete"
	"data": <Post>
}
```

### `Server`
```json
{
	"domain": "example.com",
	"cw": false,
	"active": true
}
```

### `Post`
Data of an example post is shown below.
```json
{
	"id": "110464545243574580",
	"uri": "https://equestria.social/users/thatonegib/statuses/110464545243574580",
	"url": "https://equestria.social/@thatonegib/110464545243574580",
	"tags": [{
		"name": "mlp",
		"url": "https://equestria.social/tags/mlp"
	}],
	"emojis": [{
		"code": "flutteryay",
		"url": "https://equestria.social/system/custom_emojis/images/000/000/145/original/1295608.png",
		"static": "https://equestria.social/system/custom_emojis/images/000/000/145/static/1295608.png",
		"inPicker": true
	}, {
		"code": "ajsmug",
		"url": "https://equestria.social/system/custom_emojis/images/000/000/088/original/1292830.png",
		"static": "https://equestria.social/system/custom_emojis/images/000/000/088/static/1292830.png",
		"inPicker": true
	}],
	"card": null,
	"poll": {
		"id": "49940",
		"atExpire": 1685560245796,
		"expired": false,
		"multiple": false,
		"sumVote": 0,
		"sumVoter": 0,
		"options": [{
			"title": "Don't choose",
			"sumVote": 0
		},{
			"title": "Don't choose either",
			"sumVote": 0
		}],
		"emojis": []
	},
	"atNew": 1685555194757,
	"replyPost": "110464545243574580",
	"replyUser": "109524364471531266",
	"cwReal": false,
	"cwText": "",
	"access": "public",
	"lang": "en",
	"sumReply": 1,
	"sumBoost": 3,
	"sumFav": 3,
	"atEdit": 1685555194758,
	"text": "<p>Day 7: The Church. (final)</p>",
	"boost": null,
	"app": {
		"name": "Web",
		"site": "https://joinmastodon.org/"
	},
	"user": {
		"id": "109524364471531266",
		"username": "thatonegib",
		"acct": "thatonegib",
		"dispName": "Gib Riel-Delano",
		"locked": false,
		"bot": false,
		"discoverable": true,
		"group": false,
		"note": "<p>He/Him.<br />&quot;Road to hell is paved with good intentions&quot;<br />♥️ <br /><span class=\"h-card\"><a href=\"https://equestria.social/@AlzMarioWolfe\" class=\"u-url mention\">@<span>AlzMarioWolfe</span></a></span><br /> 💜 <br />@DamienInTheDark<br /> 04 Oct 2019<br />Comms CLOSED</p>",
		"url": "https://equestria.social/@thatonegib",
		"avatar": "https://equestria.social/system/accounts/avatars/109/524/364/471/531/266/original/8123b1c31f504128.jpg",
		"avatarStatic": "https://equestria.social/system/accounts/avatars/109/524/364/471/531/266/original/8123b1c31f504128.jpg",
		"header": "https://equestria.social/system/accounts/headers/109/524/364/471/531/266/original/e5cd38c16822e681.jpg",
		"headerStatic": "https://equestria.social/system/accounts/headers/109/524/364/471/531/266/original/e5cd38c16822e681.jpg",
		"sumPost": 58,
		"atLastPost": "2023-05-31",
		"noIndex": false,
		"emojis": [],
		"roles": [],
		"fields": [{
			"name": "Look through my Gallery!",
			"value": "<a href=\"https://www.deviantart.com/thatonegib/\" target=\"_blank\" rel=\"nofollow noopener noreferrer me\"><span class=\"invisible\">https://www.</span><span class=\"\">deviantart.com/thatonegib/</span><span class=\"invisible\"></span></a>",
			"atVerify": null
		}, {
			"name": "Help me make a living!",
			"value": "<a href=\"https://www.patreon.com/ThatOneGib\" target=\"_blank\" rel=\"nofollow noopener noreferrer me\"><span class=\"invisible\">https://www.</span><span class=\"\">patreon.com/ThatOneGib</span><span class=\"invisible\"></span></a>",
			"atVerify": null
		}, {
			"name": "Watch the sauce get made!",
			"value": "<a href=\"https://www.youtube.com/channel/UC2V6hQau5NkH4abuBFoFhyg\" target=\"_blank\" rel=\"nofollow noopener noreferrer me\"><span class=\"invisible\">https://www.</span><span class=\"ellipsis\">youtube.com/channel/UC2V6hQau5</span><span class=\"invisible\">NkH4abuBFoFhyg</span></a>",
			"atVerify": null
		}, {
			"name": "Obligatory Twatter link",
			"value": "<a href=\"https://twitter.com/ThatOneGib\" target=\"_blank\" rel=\"nofollow noopener noreferrer me\"><span class=\"invisible\">https://</span><span class=\"\">twitter.com/ThatOneGib</span><span class=\"invisible\"></span></a>",
			"atVerify": null
		}],
		"atNew": 1671148800000,
		"sumFan": 25,
		"sumSub": 5
	},
	"media": [{
		"id": "110464545127306536",
		"type": "image",
		"url": "https://equestria.social/system/media_attachments/files/110/464/545/127/306/536/original/4f8c3b035aede9ea.jpeg",
		"preview": "https://equestria.social/system/media_attachments/files/110/464/545/127/306/536/small/4f8c3b035aede9ea.jpeg",
		"remote": null,
		"previewRemote": null,
		"text": null,
		"meta": {
			"original": {
				"width": 1015,
				"height": 2042,
				"size": "1015x2042",
				"aspect": 0.4970617042115573
			},
			"small":{
				"width": 338,
				"height": 680,
				"size": "338x680",
				"aspect": 0.4970588235294118
			}
		},
		"alt": "Alt text example",
		"blurhash": "USAAX:WFMtogouocMyWBjXa$f,jZIUWBxukC"
	}],
	"ats": [{
		"id": "110377043343501824",
		"username": "silk",
		"url": "https://equestria.social/@silk",
		"acct": "silk"
	}],
	"handle": "@thatonegib@equestria.social",
	"rid": "110464545243574580@equestria.social"
}
```