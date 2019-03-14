#!/bin/sh

curl -I http://grochmal.org/.error-pages/index.html |
grep -i 'Keep-Alive: timeout='

