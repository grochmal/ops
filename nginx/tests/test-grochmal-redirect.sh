#!/bin/sh

curl -I http://grochmal.org |
grep -i '301 Moved Permanently'

