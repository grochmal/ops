#!/bin/sh

curl -I http://norm.grochmal.org/.error-pages/index.html |
grep -i 'Keep-Alive: timeout='

