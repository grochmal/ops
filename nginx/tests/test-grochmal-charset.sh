#!/bin/sh

curl -I http://grochmal.org/.error-pages/index.html |
grep -i 'Content-Type: text/html; charset=utf-8'

