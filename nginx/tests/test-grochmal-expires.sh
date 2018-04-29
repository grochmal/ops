#!/bin/sh

curl -I http://grochmal.org/.error-pages/index.html |
grep 'Expires: [^\t ]\+'

