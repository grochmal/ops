#!/bin/sh

curl -I http://norm.grochmal.org/favicon.ico |
grep -i 'Content-Type: image/png'

