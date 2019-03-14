#!/bin/sh

curl -I http://neptunepenguin.net/.error-pages/favicon.png |
grep -i 'Last-Modified: .\+'

