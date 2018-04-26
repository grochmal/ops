#!/bin/sh

curl -I http://orion.grochmal.org |
grep 'Location: http://www.grochmal.org'

