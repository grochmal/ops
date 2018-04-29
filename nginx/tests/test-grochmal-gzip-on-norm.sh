#!/bin/sh

curl -H 'Accept-Encoding: gzip' \
     -I http://norm.grochmal.org/.error-pages/gzip-big.txt |
grep 'Content-Encoding: gzip'

