#!/bin/sh

curl -I http://www.grochmal.org/favicon.ico |
grep 'ETag: [^\t ]\+'

