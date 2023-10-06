# Privacy policy
By using services provided by the Lightingale Community, you agree to the following terms.

## Default
Unless stated explicitly otherwise, the following policy will be applied to any web-based service run by the Lightingale Community.

TL;DR, we have access to all of the data the client implementation chooses to share with us, but unless an error is caused, none of the data would be stored.

### Accessible
Below is the list of data accessible by us if provided, on the server-side without user interaction.

* When accessing via clearnet, the IP address of your exit.
* Client-identifying headers, if provided. Visit [MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers) for more information. Below is a list of possible headers, and may not include all headers.
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
  * `X-Forwarded-For`, `X-Real-IP`: If behind a reverse proxy, the connecting IP address observed by the reverse proxy.
* [Client hints](https://developer.mozilla.org/en-US/docs/Web/HTTP/Client_hints), set by Chromium-based browsers (e.g. Google Chrome).
* When the service involves server-side dynamically-generated content, basic cookies allowing said service to function properly.
* IP packet fingerprint. (e.g. TCP fingerprint, UDP fingerprint)
* TLS connection fingerprint, when connected via TLS.

### Use

### Data request

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