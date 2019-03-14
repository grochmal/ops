#!/bin/sh

curl http://www.grochmal.org/.error-pages/teapot |
grep -i "<title>I'm a Teapot</title>"

