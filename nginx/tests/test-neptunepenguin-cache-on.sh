#!/bin/sh

curl -I http://neptunepenguin.net/.error-pages/index.html |
grep -i 'Cache-Control: max-age='

