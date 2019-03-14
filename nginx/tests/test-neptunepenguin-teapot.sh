#!/bin/sh

curl http://neptunepenguin.net/.error-pages/teapot |
grep -i "<title>I'm a Teapot</title>"

