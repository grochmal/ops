#!/bin/sh

curl -H 'Referer: http://example.com' \
     -I http://norm.grochmal.org/.error-pages/favicon.png |
grep '302 Moved Temporarily'

