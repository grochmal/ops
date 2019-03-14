#!/bin/sh

curl http://grochmal.org/.error-pages/gzip-big.txt |
grep -i "Mom, I'm uncompressed now!"

