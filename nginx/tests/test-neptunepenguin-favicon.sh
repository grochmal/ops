#!/bin/sh

curl -I http://neptunepenguin.net/favicon.ico |
grep -i 'Content-Type: image/png'

