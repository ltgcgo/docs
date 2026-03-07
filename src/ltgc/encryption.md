# Encryption & Hashing

## TLS
This section outlines how we utilize TLS encryption.

### ECH
We currently do not utilize ECH directly on our servers. This is still a WIP.

### Hash
Whenever available, we will serve the certificate hash used for direct connections to our endpoints under [this URL](https://www.ltgc.cc/cert-sha256) for whoever requiring it. Exact certificate hash can be utilized to confirm if MITM attacks are observed.

### Authorities (CA)
We currently issue certificates from the following certificate authorities. Hashes of the utilized root certificates are up-to-date as of 7th March, 2026.

- [Amazon Trust Services](https://www.amazontrust.com/repository/)
  - `Amazon Root CA 1`² (CS): `87dcd4dc74640a322cd205552506d1be64f12596258096544986b4850bc72706`
  - `Amazon Root CA 2` (CS): `8b358466d66126312120645a5875a6a57e3c81d98476a967604244254eac00f0`
  - `Amazon Root CA 3` (CS): `40c826fdb22ba32a2f9db4f94770f72b8b1da9c8ffda7b11e6f27af245c89b5e`
  - `Amazon Root CA 4` (CS): `543d9b7fc2a6471cd84fca52c2cf6159df83ebfcd88d8b08b5af3f88737f52e6`
- [Certainly](https://www.certainly.com/repository/)
  - `Certainly Intermediate R1`² (CS): `fec41e32ca75c295a6240fa639d3abe3bfb5cb131d6690e2331a176bed2e5bd2`
  - `Certainly Intermediate E1` (CS): `3379233c434610c8eaa9361acbdd24c7d655409c6d680a8c2585ffda27011ee7`
- [Google Trust Services](https://pki.goog/repository/)
  - `GTS Root R1`² (CS): `3ee0278df71fa3c125c4cd487f01d774694e6fc57e0cd94c24efd769133918e5`
  - `GTS Root R4`² (CS): `76b27b80a58027dc3cf1da68dac17010ed93997d0b603e2fadbe85012493b5a7`
  - `WE1`²: `1dfc1605fbad358d8bc844f76d15203fac9ca5c1a79fd4857ffaf2864fbebf96`
  - `WR1`²: `b10b6f00e609509e8700f6d34687a2bfce38ea05a8fdf1cdc40c3a2a0d0d0e45`
- [Let's Encrypt](https://letsencrypt.org/certificates/)
  - `E7`² (CS): `aeb1fd7410e83bc96f5da3c6a7c2c1bb836d1fa5cb86e708515890e428a8770b`
  - `E8`² (CS): `83624fd338c8d9b023c18a67cb7a9c0519da43d11775b4c6cbdad45c3d997c52`
  - `ISRG Root X1`: `96bcec06264976f37460779acf28c5a7cfe8a3c0aae11a8ffcee05c0bddf08c6`
  - `R12`: `131fce7784016899a5a00203a9efc80f18ebbd75580717edc1553580930836ec`
  - `R13`: `d3b128216a843f8ef1321501f5df52a5df52939ee2c19297712cd3de4d419354`
- [Sectigo](https://www.sectigo.com/knowledge-base/detail/Sectigo-Root-Certificates)¹ ([additional roots](https://www.sectigo.com/resource-library/sectigo-root-intermediate-certificate-files))
  - `USERTrust RSA CA`: `e793c9b02fd8aa13e21c31228accb08119643b749c898964b1746d46c3d4cbd2`
- [SSL](https://www.ssl.com/repository/)¹
  - `EV Root CA RSA R2`: `2e7bf16cc22485a7bbe2aa8696750761b0ae39be3b2fe9d0cc6d4ef73491425c`

1. We do not interact with these CAs directly, only via Cloudflare.
2. These certificate roots are active as of the time of update.

Depending on the exact endpoint contacted for TLS connections, you may encounter different certificates being served. We currently use the following CAs for different endpoints, information up-to-date at the time of writing.

- Direct connection (clearnet PoP, Tor, I2P, Yggdrasil)
  - Google Trust Services: `GTS Root R1`, `WR1`
- BunnyCDN
  - Let's Encrypt: Unknown
- CacheFly
  - Let's Encrypt: Unknown
- Cloudflare
  - Google Trust Services: `GTS Root R4`, `WE1`
  - Let's Encrypt: Unknown
  - Sectigo: Unknown
  - SSL: Unknown
- CloudFront
  - Amazon Trust Services: `Amazon Root CA 1`
- Deno Deploy
  - Let's Encrypt: `E7`, `E8`
- Fastly
  - Certainly: `Certainly Intermediate R1`