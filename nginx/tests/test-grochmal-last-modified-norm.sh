#!/bin/sh

curl -I http://norm.grochmal.org/.error-pages/favicon.png |
grep 'Last-Modified: .\+'

