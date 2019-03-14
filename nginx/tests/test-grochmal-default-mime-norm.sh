#!/bin/sh

curl -I http://norm.grochmal.org/.error-pages/dummy.dummy |
grep -i 'Content-Type: application/octet-stream'

