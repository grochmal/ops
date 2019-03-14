#!/bin/sh

curl -I http://www.grochmal.org/.error-pages/dummy.dummy |
grep -i 'Content-Type: application/octet-stream'

