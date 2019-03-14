#!/bin/sh

curl http://neptunepenguin.net/.error-pages/ |
grep -i '<title>No Error</title>'

