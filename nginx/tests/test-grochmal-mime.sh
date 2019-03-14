#!/bin/sh

curl -I http://grochmal.org/.error-pages/hotlinking-is-bad.PNG |
grep -i 'Content-Type: image/png'

