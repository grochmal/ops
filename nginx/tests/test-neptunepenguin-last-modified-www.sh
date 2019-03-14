#!/bin/sh

curl -I http://www.neptunepenguin.net/.error-pages/favicon.png |
grep -i 'Last-Modified: .\+'

