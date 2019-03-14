#!/bin/sh

curl -I http://www.neptunepenguin.net/.error-pages/index.html |
grep -i 'Keep-Alive: timeout='

