#!/bin/sh

curl --http2 -I https://www.grochmal.org/.error-pages/index.html |
grep -i 'HTTP/2 200'

