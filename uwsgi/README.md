# Installation

Of both uWSGI config and log rotate.

    mkdir -p /usr/local/src
    cd /usr/local/src
    git clone https://github.com/grochmal/ops.git
    ln -s /usr/local/src/ops/uwsgi/uwsgi-emperor /etc/uwsgi-emperor
    ln -s /usr/local/src/ops/uwsgi/logrotate/uwsgi /etc/logrotate.d/uwsgi
    echo -e '[uwsgi]\nini = %d/uwsgi-emperor/emperor.ini > /etc/uwsgi.ini

This assumes a modular (everything built as a plugin) uWSGI install.

