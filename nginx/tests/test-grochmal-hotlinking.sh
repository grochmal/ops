#!/bin/sh

curl -H 'Referer: http://example.com' \
     -I http://grochmal.org/public/mycv.pdf |
grep '302 Moved Temporarily'

