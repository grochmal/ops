#!/bin/sh

curl -I http://www.grochmal.org/.error-pages/index.html |
grep -i 'Cache-Control: max-age='

