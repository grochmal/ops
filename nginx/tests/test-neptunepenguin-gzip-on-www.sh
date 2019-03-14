#!/bin/sh

curl -H 'Accept-Encoding: gzip' \
     -I http://www.neptunepenguin.net/.error-pages/gzip-big.txt |
grep -i 'Content-Encoding: gzip'

