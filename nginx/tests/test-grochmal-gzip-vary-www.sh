#!/bin/sh

curl -H 'Accept-Encoding: gzip' \
     -I http://www.grochmal.org/.error-pages/gzip-big.txt |
grep -i 'Vary:.*Accept-Encoding'

