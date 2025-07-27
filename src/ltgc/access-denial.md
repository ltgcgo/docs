# Access denial
## VPN
If you're accessing any Lightingale service from a VPN, chances are you're already blocked by us, but will get unblocked if with mixnets like Tor, or encrypted proxies. This is intentional.

We strongly support privacy and anonimity, while also highly detest the idea of fattening any commercial VPN vendor. VPNs do not offer privacy or security on the Internet in any way, let alone either anonimity or anti-censorship, and in no way any of them contribute to the effort of developing either anti-censorship or concealing technology to truly liberate the masses. As such, we've long since decided to take direct action, actively identifying and fingerprinting VPNs, while advising people to switch to real solutions instead.

## Client
We identify some client programs as high-risk, and block requests from those programs if identified.

## FAQ
### I'm using a VPN, what should I do?
To put it simply, please stop using a VPN to access us.

If you're familiar with accessing services hosted on mixnets, you can access our services [via alternative means](./ds.md) ([fallback](https://ltgc.cc/about.htm#access)). Or if you don't want to go through the hassle, please disconnect from your VPN, and if you have access to either exit/outproxy-enabled mixnet (e.g. [Tor](https://torproject.org/), [I2P](https://geti2p.net/) ([I2Pd](https://i2pd.website) is recommended if you are comfortable with command line), [Lokinet](https://lokinet.org)) or encrypted proxies, use them instead.

### What if I'm blocked wrongly?
Within 18 hours, please [contact us](https://ltgc.cc/about.htm) and provide your Cloudflare Ray ID in your unblocking appeal. After we've verified that you did indeed not connect from a VPN, you'll be unblocked as soon as possible. However, if you used a client program we deem as high-risk, we will reject your appeal immediately.

### Can you make certain VPNs/tunnels exempt for [reason]?
We will not make VPNs that advertise themselves as "privacy focused", as it's fundamentally no different than you connect to a network access point somewhere else, and the packets exchanged are all easily fingerprintable. We will include these VPN providers in our actively monitored list of blocked networks instead.

We do make non-VPN tunnels exempt, as long as one or more of the conditions below is met.

- Belongs to a network of fingerprinting-resistant tunnels run without any intention of profitting.
- Does not offer location changing. (e.g. Cloudflare WARP, iCloud Private Relay)
- Is an outproxy or an exit of mixnets. (e.g. Tor exits, I2P outproxies)

### Could you just stop blocking VPNs?
In short, no. The longer version, nooooooooooooooooooooooooooooooooooo.
