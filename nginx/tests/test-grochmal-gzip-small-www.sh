#!/bin/sh

curl -H 'Accept-Encoding: gzip' \
     http://www.grochmal.org/.error-pages/gzip-small.txt |
grep "I'm a small uncompressed file, I should not be compressed in transit."

