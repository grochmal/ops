#!/bin/sh

curl http://grochmal.org/.error-pages/teapot |
grep -i "<title>I'm a Teapot</title>"

