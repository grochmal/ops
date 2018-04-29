#!/bin/sh

curl -I http://grochmal.org/favicon.ico |
grep 'Content-Type: image/png'

