#!/bin/sh

curl -I http://norm.grochmal.org/.error-pages/dummy.dummy |
grep 'Content-Type: application/octet-stream'

