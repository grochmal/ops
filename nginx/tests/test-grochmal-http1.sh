#!/bin/sh

curl --http1.1 -I https://grochmal.org/.error-pages/index.html |
grep -i 'HTTP/1.1 200 OK'

