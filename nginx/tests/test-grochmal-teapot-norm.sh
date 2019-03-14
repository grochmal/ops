#!/bin/sh

curl http://norm.grochmal.org/.error-pages/teapot |
grep -i "<title>I'm a Teapot</title>"

