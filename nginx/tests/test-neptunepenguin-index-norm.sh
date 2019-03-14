#!/bin/sh

curl http://norm.neptunepenguin.net/.error-pages/ |
grep -i '<title>No Error</title>'

