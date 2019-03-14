#!/bin/sh

curl -I http://norm.neptunepenguin.net/favicon.ico |
grep -i 'Content-Type: image/png'

