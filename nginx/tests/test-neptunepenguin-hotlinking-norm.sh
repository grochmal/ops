#!/bin/sh

curl -H 'Referer: http://example.com' \
     -I http://norm.neptunepenguin.net/favicon.png |
grep -i '302 Moved Temporarily'

