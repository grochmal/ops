#!/bin/sh

curl --http2 -I https://www.neptunepenguin.net/.error-pages/index.html |
grep -i 'HTTP/2 200'

