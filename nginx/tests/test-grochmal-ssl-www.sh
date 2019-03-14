#!/bin/sh

curl -w 'SCHEME: %{scheme}\n' \
     -I https://www.grochmal.org/.error-pages/index.html |
grep -i 'SCHEME: HTTPS'

