#!/bin/sh

curl -H 'Accept-Encoding: gzip' \
     http://www.neptunepenguin.net/.error-pages/gzip-small.txt |
grep -i "I'm a small uncompressed file, I should not be compressed in transit."

