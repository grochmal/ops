#!/bin/sh

curl -I -H 'Cookie: userid=blah' http://www.neptunepenguin.net |
grep -i 'Cache-Control: no-cache'

