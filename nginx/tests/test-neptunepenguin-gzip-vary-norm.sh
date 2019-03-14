#!/bin/sh

curl -H 'Accept-Encoding: gzip' \
     -I http://norm.neptunepenguin.net/.error-pages/gzip-big.txt |
grep -i 'Vary:.*Accept-Encoding'

