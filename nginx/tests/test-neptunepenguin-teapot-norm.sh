#!/bin/sh

curl http://norm.neptunepenguin.net/.error-pages/teapot |
grep -i "<title>I'm a Teapot</title>"

