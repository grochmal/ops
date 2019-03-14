#!/bin/sh

curl -I http://www.neptunepenguin.net/favicon.ico |
grep -i 'Content-Type: image/png'

