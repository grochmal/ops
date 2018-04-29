#!/bin/sh

curl -I http://grochmal.org/favicon.ico |
grep 'ETag: [^\t ]\+'

