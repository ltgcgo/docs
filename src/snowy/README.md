# Snowy
A [`BroadcastChannel`](https://developer.mozilla.org/en-US/docs/Web/API/BroadcastChannel) polyfill for Firefox 29+ and Chromium 5+, implemented with `SharedWorker`.

Snowy will not be active if `BroadcastChannel` already exists.

## Usage
* Place `snowy.js` under the root directory of your website.
  * If `snowy.js` needs to be placed somewhere else, set `self.SNOWY_PATH` to where `snowy.js` resides.
* Run `bc.js` in your page to start the polyfill.