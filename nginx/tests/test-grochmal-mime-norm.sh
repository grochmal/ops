#!/bin/sh

curl -I http://norm.grochmal.org/.error-pages/hotlinking-is-bad.PNG |
grep -i 'Content-Type: image/png'

