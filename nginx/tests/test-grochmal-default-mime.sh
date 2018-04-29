#!/bin/sh

curl -I http://grochmal.org/.error-pages/dummy.dummy |
grep 'Content-Type: application/octet-stream'

