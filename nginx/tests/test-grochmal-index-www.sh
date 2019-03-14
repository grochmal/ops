#!/bin/sh

curl http://www.grochmal.org/.error-pages/ |
grep -i '<title>No Error</title>'

