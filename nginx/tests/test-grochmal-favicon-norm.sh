#!/bin/sh

curl -I http://norm.grochmal.org/favicon.ico |
grep 'Content-Type: image/png'

