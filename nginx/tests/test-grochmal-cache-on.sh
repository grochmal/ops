#!/bin/sh

curl -I http://grochmal.org/.error-pages/index.html |
grep 'Cache-Control: max-age='

