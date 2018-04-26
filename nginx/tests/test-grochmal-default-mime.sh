#!/bin/sh

curl -I http://www.grochmal.org/.error-pages/dummy.dummy |
grep 'Content-Type: application/octet-stream'

