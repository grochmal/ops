#!/bin/sh

curl -I http://norm.grochmal.org/.error-pages/index.html |
grep -i 'Cache-Control: max-age='

