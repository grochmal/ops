#!/bin/sh

curl http://www.neptunepenguin.net/.error-pages/ |
grep -i '<title>No Error</title>'

