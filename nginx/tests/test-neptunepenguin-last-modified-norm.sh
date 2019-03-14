#!/bin/sh

curl -I http://norm.neptunepenguin.net/.error-pages/favicon.png |
grep -i 'Last-Modified: .\+'

