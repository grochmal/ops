#!/bin/sh

curl -I http://neptunepenguin.net/.error-pages/index.html |
grep -i 'X-Request-ID: [^ ]\+'

