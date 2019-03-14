#!/bin/sh

curl -H 'Referer: http://example.com' \
     -I http://grochmal.org/public/mycv.pdf |
grep -i '302 Moved Temporarily'

