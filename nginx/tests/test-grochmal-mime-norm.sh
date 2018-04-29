#!/bin/sh

curl -I http://norm.grochmal.org/.error-pages/hotlinking-is-bad.PNG |
grep 'Content-Type: image/png'

