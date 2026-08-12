# CDN Regional Origin
To further improve client side responsiveness, Lightingale Community operates a set of edge servers distributed across the globe, functioning as **regional origins** for downstream CDN PoPs to hit (e.g. Cloudflare, CloudFront, Fastly, BunnyCDN...). We use DNS GSLB to direct traffic from CDN PoPs to a desired set of distributed edge servers, depending on both server load and geographical proximity.

## Precompressed static file distribution
We operate precompressed static file distribution on our DEOs for response time reduction and cost optimisation.

CDNs are great at caching static content, but unless the client is willing to pay a premium to precache content, or the CDN provider offers tiered caching to curb cache misses, round trip time introduced by cache misses may not be acceptable. Larger files may also be considered by CDN providers as cache abuse. As such, we went with this instead of solely relying on CDNs.

Storing uncompressed static files isn't quite economical in terms of storage and egress traffic. As such, unlike normal static file stores, the servers avoid storing uncompressed data whenever possible, requiring clients to support both announcing and decompressing either Brotli (`br`) or Gzip. As most modern browsers support Brotli and at least Gzip, real clients should retrieve the respective files transparently without any error.

## Edge services
We run sandboxed lightweight edge services on our DEOs to avoid surprise bills.

Serverless edge compute offers from cloud providers may seem to be cheap at first glance, but any surge in usage can cause compute bills to skyrocket, and data transfer is not cheap either. Operating edge services on regional origins thus allows us to approach the outcome without worrying about going bankrupt on a whim.

Apart from decreasing client response time for dynamic services, running edge services ourselves also allows us to run services that requires maintaining distributed states, so we are not restricted to only running stateless microservices.