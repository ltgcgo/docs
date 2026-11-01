# Access denial
<div>
<p id="denial-reason"></p>
<script>
const denialReasonDisp = document.querySelector("p#denial-reason");
const searchMap = new Map();
if (self.location?.search?.length > 1) {
	for (const item of location.search.substring(1).split("&")) {
		const tokens = item.split("=");
		searchMap.set(decodeURIComponent(tokens[0]), decodeURIComponent(tokens[1]));
	};
};
//console.debug(searchMap);
const denialReason = searchMap.get("reason");
if (denialReason?.length > 0) {
	denialReasonDisp.append("Your access has been blocked for the reason: ");
	const detailedReason = {"vpn":"VPN usage","client":"Outdated or blocked client","denyAnonymity":"Source website denies anonymity"}[denialReason];
	const shownReason = document.createElement(detailedReason?.length > 0 ? "b" : "i");
	shownReason.append(detailedReason ?? denialReason);
	denialReasonDisp.append(shownReason);
	denialReasonDisp.append(".");
};
</script>
</div>

## VPN
If you're accessing any Lightingale service from a VPN, chances are you're already blocked by us, but will get unblocked if with mixnets like Tor, or encrypted proxies. This is intentional.

We strongly support privacy and anonimity, while also highly detest the idea of fattening any commercial VPN vendor. VPNs do not offer security in ways they market, and privacy on the Internet in any way, let alone either anonimity or anti-censorship, and in no way any of them contribute to the effort of developing either anti-censorship or concealing technology to truly liberate the masses. As such, we've long since decided to take direct action, actively identifying and fingerprinting VPNs, while advising people to switch to real solutions that survives actual hostile environments instead.

Notice that EPs (encapsulated/encrypted proxies) do **not** count as VPNs, as they are fundamentally different.

## Client
We identify some clients as high-risk, and block requests from those clients upon identification. If you are using some risky browsers and are privacy-concious, consider switching to one of [Firefox](https://www.firefox.com/en-GB/download/all/desktop-esr/), [Thorium](https://thorium.rocks), and [Cromite](https://github.com/uazo/cromite/releases/latest).

## FAQ
### I'm using a VPN, what should I do?
To put it simply, please stop using a VPN to access us.

If you're familiar with accessing services hosted on mixnets, you can access our services [via alternative means](./ds.md) ([fallback](https://ltgc.cc/about.htm#access)). Or if you don't want to go through the hassle, please disconnect from your VPN, and if you have access to either exit/outproxy-enabled mixnet (e.g. [Tor](https://torproject.org/), [I2P](https://geti2p.net/) ([I2Pd](https://i2pd.website) is recommended if you are comfortable with command line), [Yggdrasil](https://yggdrasil-network.github.io)) or encrypted proxies (any tunnel protocol identified by Ο ‍­р‍ ­е­‍ n­ ‍G ‍­F­‍ W is banned), use them instead.

If you're using Tor bridges in a legislation intending to outlaw censorship circumvention and/or privacy, we advise you to connect via Snowflake instead of `obfs4`.

### What if I'm blocked wrongly?
Within 18 hours, please [contact us](https://ltgc.cc/about.htm) and provide your Cloudflare Ray ID in your unblocking appeal. After we've verified that you did indeed not connect from a VPN, you'll be unblocked as soon as possible. However, if you used a client program we deem as high-risk, we will reject your appeal immediately.

<details>
<summary>If your provider matches any of the below, your appeal will also be denied immediately. We recommend you to switch to encrypted proxies, or connect to mixnets over tunnels from said providers instead. The list below is not exhaustive in any way, and the provider doesn't need to be commercial for inclusion.</summary>

- CyberGhost VPN
- Express VPN
- Hide.me VPN
- Hotspot Shield
- IPVanish VPN
- iVPN
- Mullvad VPN
- Nord VPN
- Norton VPN
- Private Internet Access VPN
- Proton
- Riseup.net
- SoftEther VPN/VPNGate
- Surfshark VPN
- TunnelBear VPN
- WhoVPN
- Windscribe VPN
</details>

### Can you make certain VPNs/tunnels exempt for [reason]?
We will not make VPNs that advertise themselves as "privacy focused", as it's fundamentally no different than you connect to a network access point somewhere else, and the packets exchanged are all easily fingerprintable. We will include these VPN providers in our actively monitored list of blocked networks instead.

We do make non-VPN tunnels exempt, as long as one or more of the conditions below is met.

- Belongs to a network of fingerprinting-resistant tunnels run without any intention of profitting.
- Does not intend to offer location changing. Notable examples below.
  - Cloudflare WARP
  - Fastly Private Relay
  - iCloud Private Relay
- Is an outproxy or an exit of mixnets. (e.g. Tor exits, I2P outproxies)

### Could you just stop blocking VPNs?
In short, no. The longer version, nooooooooooooooooooooooooooooooooooo. Since you have the liberty to continue living in bubble of hope over VPNs, we also have the liberty to choose to deny your access based on that bubble, especially if you're physically located in a legislation intending to outlaw censorship circumvention and/or privacy.
