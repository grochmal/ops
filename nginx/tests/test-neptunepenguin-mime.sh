#!/bin/sh

curl -I http://neptunepenguin.net/.error-pages/hotlinking-is-bad.PNG |
grep -i 'Content-Type: image/png'

