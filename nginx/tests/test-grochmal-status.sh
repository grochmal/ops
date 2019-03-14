#!/bin/sh

curl http://grochmal.org/nginx-status |
grep -i '<title>Not Authorized</title>'

