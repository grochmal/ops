#!/bin/sh

curl -H 'Accept-Encoding: gzip' \
     -I http://neptunepenguin.net/.error-pages/gzip-big.txt |
grep -i 'Vary:.*Accept-Encoding'

