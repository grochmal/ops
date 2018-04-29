#!/bin/sh

curl -I http://www.grochmal.org/.error-pages/hotlinking-is-bad.PNG |
grep 'Content-Type: image/png'

