#!/bin/sh

curl -H 'Referer: http://example.com' \
     -I http://norm.grochmal.org/favicon.png |
grep -i '302 Moved Temporarily'

