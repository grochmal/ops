#!/bin/sh

curl -I http://www.grochmal.org/.error-pages/favicon.png |
grep -i 'Last-Modified: .\+'

