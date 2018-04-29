#!/bin/sh

curl -I http://grochmal.org/.error-pages/index.html |
grep 'X-Frame-Options: DENY'

