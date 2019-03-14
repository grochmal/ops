#!/bin/sh

curl -I http://www.neptunepenguin.net/.error-pages/dummy.dummy |
grep -i 'Content-Type: application/octet-stream'

