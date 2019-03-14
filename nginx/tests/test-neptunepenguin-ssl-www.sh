#!/bin/sh

curl -w 'SCHEME: %{scheme}\n' \
     -I https://www.neptunepenguin.net/.error-pages/index.html |
grep -i 'SCHEME: HTTPS'

