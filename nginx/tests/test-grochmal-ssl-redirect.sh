#!/bin/sh

curl -I https://grochmal.org |
grep -i 'location: https://www.grochmal.org'

