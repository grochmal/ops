#!/bin/sh

curl -I http://neptunepenguin.net/.error-pages/index.html |
grep -i 'Keep-Alive: timeout='

