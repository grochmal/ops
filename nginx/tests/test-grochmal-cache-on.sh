#!/bin/sh

curl -I http://grochmal.org/.error-pages/index.html |
grep -i 'Cache-Control: max-age='

