#!/bin/sh

curl -I http://norm.grochmal.org/favicon.ico |
grep 'ETag: [^\t ]\+'

