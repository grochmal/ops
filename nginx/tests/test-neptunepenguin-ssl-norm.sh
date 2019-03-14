#!/bin/sh

curl -w 'SCHEME: %{scheme}\n' \
     -I https://norm.neptunepenguin.net/.error-pages/index.html |
grep -i 'SCHEME: HTTPS'

