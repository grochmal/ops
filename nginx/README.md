# Installation

Of nginx into the default \*nix configuration

    mkdir -p /usr/local/src
    cd /usr/local/src
    git clone https://github.com/grochmal/ops.git
    ln -s /usr/local/src/ops/nginx/webd /etc/nginx/webd
    echo 'include webd/nginx.conf;' > /etc/nginx/nginx.conf

The `webd` directory needs to be in the default nginx include path,
that is `/etc/nginx` on most systems.

