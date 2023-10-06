# Privacy policy
By using services provided by the Lightingale Community, you agree to the following terms.

## Default
Unless stated explicitly otherwise, the following policy will be applied to any web-based service run by the Lightingale Community.

TL;DR, we have access to all of the data the client implementation chooses to share with us, but unless an error is caused or you explicitly want us to, none of the data would be stored.

### Accessible
Below is the list of data accessible by us if provided, on the server-side without user interaction.

* When accessing via clearnet, the IP address of your exit.
* When accessing via clearnet, IP packet fingerprints. (e.g. TCP fingerprint, UDP fingerprint)
* TLS connection fingerprint, when connected via TLS.
* Standardized client-identifying headers, if provided. Visit [MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers) for more information. Below is a list of possible headers, and may not include all headers.
  * `Accept`: Which types of content is accepted by the client.
  * `Accept-Encoding`: Encoding schemes accepted by the client, usually compression algorithms.
  * `Accept-Language`: Languages expected by the client.
  * `Authorization`: Tokens proving client's identification.
  * `Origin`: The URL of request's origin.
  * `Referer`: The initiator URL of each request.
  * `Sec-Fetch-Dest`: The initiator type of each request.
  * `Sec-Fetch-Mode`: Mode applied on requests.
  * `Sec-Fetch-Site`: Relationship between requested resource and source.
  * `User-Agent`: Implementation identification string provided by the client.
  * `X-Forwarded-For`, `X-Real-IP`: If behind a reverse proxy, the connecting IP address observed by the reverse proxy. These headers are almost always stripped, spoofed or generalized on reverse proxies we have control of however.
* [Client hints](https://developer.mozilla.org/en-US/docs/Web/HTTP/Client_hints), sent by Chromium-based browsers (e.g. Google Chrome). Below is a list of headers sent unconditionally by Chromium-based browsers. To prevent us from receiving these headers, please switch to a browser that isn't based on Chromium.
  * `Sec-CH-UA`: Array of implementation identification strings provided by the client.
  * `Sec-CH-UA-Mobile`: If the client runs on mobile platforms (e.g. Android, iOS).
  * `Sec-CH-UA-Platform`: The platform running the client, usually OS families.
* All other headers clients choose to provide.
* When the service involves server-side dynamically-generated content, basic cookies allowing said service to function properly.

We also have access to data you explicitly choose to share with us. They may be in cleartext or in their encrypted form.

### Use
#### General
* Data explicitly stored by users will *likely* persist until takedowns.
* During suspected infiltrations, we will use any information accessible to identify and exterminate unauthorized access. Data stored during this period will be removed as soon as related investigations are finished.
* We do not share any information with any third-parties.
* Data requests from individuals and law enforcement agencies will be assessed before any action is taken. See the data request section for details.

#### Low-importance
Unless overriden, these uses do not store data.

* To deny access from clients we deem as unfit of service (WAF), we will use `Origin`, `Referer`, `Sec-CH-UA`, `Sec-Fetch-Site`, `User-Agent`, observed client IP address (if on clearnet/behind reverse proxies), IP packet fingerprints (if on clearnet) and TLS fingerprint.
* To conserve bandwidth whenever we can, we will use `Accept-Encoding`.
* To serve content to client's expectation, we will use `Accept`.
* To distinguish between sessions if essential to the service client accesses, `Authorization` and/or basic cookies will be used.
* To serve localized content in client's desired languages, we may use `Accept-Language`.

#### Medium-importance
Data stored from these uses will be kept for 24 hours.

* Requests will be logged **without** observed IP addresses **only** upon causing non-critical software errors.

#### High-importance
Data stored from these uses will be kept until their removal.

* Requests will be logged **with** observed IP addresses **only** upon causing critical software errors, or attempting to utilize known exploits.

### Data request
* Approved data requests will be fulfilled within 30 days since approval, in the form that's available to us. Encrypted data will be provided as-is, alongwith their respective decryption keys when available.
* Individuals can file requests for their data, and will be approved upon proving ownership.
* Law enforcement agencies can file requests for data, but will only be approved if all listed criteria are satisfied.
  * Belongs to a political body deemed as "full democracy" or "flawed democracy" by *The Economist Democracy Index*.
  * Provides sufficient information for proving their identity.
  * Belongs to the political body where related services are hosted, or can provide proof that affected users violated our [acceptable usage policy](./aup.html).
* If the service's ability to continue operation becomes next-to-impossible due to a failed compliance from a rejected data request, we will wipe all data stored on our behalf and cease operation on said service. The same goes for the Lightingale Community itself.

### Infrastructure providers
We extensively rely on Cloudflare for our infrastructure on the clearnet. If you do **not** want to go through Cloudflare, feel free to access our services [through alternative means](https://ltgc.cc/about.htm#access). Otherwise, a copy of [privacy policy](https://www.cloudflare.com/en-gb/privacypolicy/) from Cloudflare could be obtained.

To improve availability and/or decrease cost on some of our services, we may also use other infrastructure providers. Check their respective privacy policies for details. Below is a list of providers we rely on.

* [AWS CloudFront](https://aws.amazon.com/cloudfront/), for CDN.
* [AWS Lambda](aws.amazon.com/lambda/), for serverless computing.
* [CacheFly](https://www.cachefly.com), for CDN.
* [Cloudflare](https://cloudflare.com), for CDN, WAF and edge serverless computing.
* [Deno Deploy](https://deno.com/deploy/), for edge serverless computing.
* [Fastly](https://fastly.com), for CDN and edge serverless computing.
* [GCoreLabs](https://gcorelabs.com), for CDN.