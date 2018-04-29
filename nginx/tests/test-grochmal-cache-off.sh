#!/bin/sh

curl -I http://www.grochmal.org |
grep 'Cache-Control: no-cache'

