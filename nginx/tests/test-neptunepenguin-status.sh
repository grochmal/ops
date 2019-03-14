#!/bin/sh

curl http://neptunepenguin.net/nginx-status |
grep -i '<title>Not Authorized</title>'

