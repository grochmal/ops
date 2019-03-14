#!/bin/sh

curl -w 'SCHEME: %{scheme}\n' \
     -I https://neptunepenguin.net/.error-pages/index.html |
grep -i 'SCHEME: HTTPS'

