# Ditzy
Ditzy is a transport-agnostic universal multi-message encoding scheme, allowing stateful bidirectional communications regardless of the statefulness of the underlying transport. With the state of the reconstructed tunnel fully decoupled from the underlying transport, possibilities are endless.

This project is inspired by [Tor HTTP Meek](https://gitweb.torproject.org/pluggable-transports/meek.git/), [MIDI 1.0](https://midi.org/specifications/midi1-specifications) and [QUIC](https://quicwg.org/).

💌 Feel your messages delivered safely by your trustworthy Ponyvillan mailmare!

The first draft was written on 18th Nov 2021, with the next iteration on 5th Feb 2023. The current draft is written on 29th June 2023.

## Advantages
* State of tunneled connections are decoupled from their underlying transports
* Seamless connection migration on connection losses and IP changes
* Total control over frame transmission

## Use cases
* Bidirectional communication through incapable infrastructure (e.g. CDNs, request reflectors)
* Stablizing communication over unstable networks
* Replacing QUIC where UDP communication is not feasible
* Connection multiplexing
* Connection splitting

## Specifications
* [Binary encoding format](binfmt.md)
* [Recommended general implementation](generic.md)
* [Recommended implementation over HTTP](http.md)
* [Recommended implementation over DNS](dns.md)

## Reference implementation API docs
### JavaScript
