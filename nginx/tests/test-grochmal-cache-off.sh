#!/bin/sh

curl -I -H 'Cookie: userid=blah' http://www.grochmal.org |
grep -i 'Cache-Control: no-cache'

