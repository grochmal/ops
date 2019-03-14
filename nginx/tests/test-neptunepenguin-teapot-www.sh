#!/bin/sh

curl http://www.neptunepenguin.net/.error-pages/teapot |
grep -i "<title>I'm a Teapot</title>"

