#!/bin/sh

curl http://www.grochmal.org/.error-pages/gzip-big.txt |
grep -i "Mom, I'm uncompressed now!"

