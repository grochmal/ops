#!/bin/sh

curl -H 'Accept-Encoding: gzip' \
     -I http://grochmal.org/.error-pages/gzip-big.txt |
grep 'Content-Encoding: gzip'

