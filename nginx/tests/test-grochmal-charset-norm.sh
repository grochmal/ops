#!/bin/sh

curl -I http://norm.grochmal.org/.error-pages/index.html |
grep 'Content-Type: text/html; charset=utf-8'

