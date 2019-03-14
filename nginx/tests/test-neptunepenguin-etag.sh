#!/bin/sh

curl -I http://neptunepenguin.net/favicon.ico |
grep -i 'ETag: [^ ]\+'

