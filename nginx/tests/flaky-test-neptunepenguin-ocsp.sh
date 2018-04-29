#!/bin/sh

# Note: this is a flaky test, you can ignore its failure.
echo QUIT |
openssl s_client -connect neptunepenguin.net:443 \
                 -tls1 -tlsextdebug -status |
grep 'OCSP Response Status: successful (0x0)'

