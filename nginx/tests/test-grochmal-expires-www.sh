#!/bin/sh

curl -I http://www.grochmal.org/.error-pages/index.html |
grep 'Expires: [^\t ]\+'

