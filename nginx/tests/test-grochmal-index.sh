#!/bin/sh

curl http://grochmal.org/.error-pages/ |
grep -i '<title>No Error</title>'

