#!/bin/sh

curl -I http://norm.neptunepenguin.net/.error-pages/hotlinking-is-bad.PNG |
grep -i 'Content-Type: image/png'

