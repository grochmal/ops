#!/bin/sh

curl -I http://norm.neptunepenguin.net/.error-pages/index.html |
grep -i 'Keep-Alive: timeout='

