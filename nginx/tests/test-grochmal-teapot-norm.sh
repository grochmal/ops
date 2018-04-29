#!/bin/sh

curl http://norm.grochmal.org/.error-pages/teapot |
grep "<title>I'm a Teapot</title>"

