#!/bin/sh

curl -w 'SCHEME: %{scheme}\n' \
     -I https://grochmal.org/.error-pages/index.html |
grep -i 'SCHEME: HTTPS'

