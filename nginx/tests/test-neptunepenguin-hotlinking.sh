#!/bin/sh

curl -H 'Referer: http://example.com' \
     -I http://neptunepenguin.net/public/mycv.pdf |
grep -i '302 Moved Temporarily'

