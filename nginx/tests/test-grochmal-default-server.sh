#!/bin/sh

curl -I http://orion.grochmal.org |
grep -i 'Location: http://www.grochmal.org'

