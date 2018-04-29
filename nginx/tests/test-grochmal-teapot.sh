#!/bin/sh

curl http://grochmal.org/.error-pages/teapot |
grep "<title>I'm a Teapot</title>"

