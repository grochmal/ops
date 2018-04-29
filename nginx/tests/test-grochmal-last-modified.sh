#!/bin/sh

curl -I http://grochmal.org/.error-pages/favicon.png |
grep 'Last-Modified: .\+'

