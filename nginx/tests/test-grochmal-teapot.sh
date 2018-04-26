#!/bin/sh

curl http://www.grochmal.org/.error-pages/teapot |
grep "<title>I'm a Teapot</title>"

