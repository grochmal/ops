#!/bin/sh

curl -I http://www.grochmal.org/.error-pages/index.html |
grep 'Cache-Control: max-age='

