#!/bin/sh

curl -I http://grochmal.org/favicon.ico |
grep -i 'Content-Type: image/png'

