#!/bin/sh

curl -I http://www.grochmal.org/.error-pages/hotlinking-is-bad.PNG |
grep -i 'Content-Type: image/png'

