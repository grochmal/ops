#!/bin/sh

curl -I http://norm.neptunepenguin.net/.error-pages/dummy.dummy |
grep -i 'Content-Type: application/octet-stream'

