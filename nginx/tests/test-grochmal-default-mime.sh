#!/bin/sh

curl -I http://grochmal.org/.error-pages/dummy.dummy |
grep -i 'Content-Type: application/octet-stream'

