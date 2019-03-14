#!/bin/sh

curl -I http://norm.neptunepenguin.net/favicon.ico |
grep -i 'ETag: [^ ]\+'

