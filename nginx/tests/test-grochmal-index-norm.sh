#!/bin/sh

curl http://norm.grochmal.org/.error-pages/ |
grep -i '<title>No Error</title>'

