#!/bin/sh

curl -I http://neptunepenguin.net/.error-pages/index.html |
grep -i 'Content-Type: text/html; charset=utf-8'

