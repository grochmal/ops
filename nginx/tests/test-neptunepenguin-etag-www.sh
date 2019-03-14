#!/bin/sh

curl -I http://www.neptunepenguin.net/favicon.ico |
grep -i 'ETag: [^ ]\+'

