# Ditzy
Ditzy is a transport-agnostic universal multi-message encoding scheme, allowing stateful bidirectional communications regardless of the statefulness of the underlying transport. With the state of the reconstructed tunnel fully decoupled from the underlying transport, possibilities are endless. How Ditzy performs is entirely dependent on implementation.

This project is inspired by [Tor HTTP Meek](https://gitweb.torproject.org/pluggable-transports/meek.git/), [MIDI 1.0](https://midi.org/specifications/midi1-specifications), [Reliable UDP](https://en.wikipedia.org/wiki/Reliable_User_Datagram_Protocol) and [QUIC](https://quicwg.org/).

💌 Feel your messages delivered safely by your trustworthy Ponyvillan mailmare!

The first draft was written on 18th Nov 2021, with the next iteration on 5th Feb 2023. The current draft is written on 29th June 2023.

## Advantages
* State of reconstructed connections are decoupled from their underlying transports entirely
* Seamless connection migration on connection losses and IP changes
* Total control over data transmission

## Disadvantages
* Directional speed penalty when not in stream mode
* Not suitable for time-sensitive applications
* Resource overhead on both servers and clients
* Possible attack vector via decorated messages

## Use cases
* Bidirectional communication through incapable infrastructure (e.g. CDNs, serverless functions, request reflectors, fronted containers)
* Connection multiplexing and splitting
* Stablizing communication over unstable networks
* Replacing QUIC where UDP communication is not feasible

## Specifications
* [Binary encoding format](binfmt.md)
* [Recommended implementation practices](generic.md)

## Reference implementation API docs
- JavaScript