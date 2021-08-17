# Installation

The biggest problems one may face to install the uWSGI configuration is that
every distribution has a different idea of the best practice to run it.
It is a fair misunderstanding as uWSGI itself does not promote any best
practice, hence different people will run it in different ways.

What we do here is an emperor run with vassals that have lots of defaults.
Note that uWSGI can be quite flaky when reading the config,
and on may need to comment out big parts of the configuration to pinpoint
errors based on uWSGI version.  The best way to test is to simply run
the `wsgi` binary by hand, i.e.

    /usr/bin/wsgi --ini /etc/uwsgi-king/emperor.ini

Note that we are not using `--emperor` but `--ini` and invoking emperor mode
inside the config.  The paths to even this simple command will vary on
distributions.

On a Red Hat based systems the following should install the emperor mode
configuration and the logrotate.

    mkdir -p /usr/local/src
    cd /usr/local/src
    git clone https://github.com/grochmal/ops.git
    ln -s /usr/local/src/ops/uwsgi/uwsgi-emperor /etc/uwsgi-emperor
    ln -s /usr/local/src/ops/uwsgi/logrotate/uwsgi /etc/logrotate.d/uwsgi
    echo -e '[uwsgi]\nini = %d/uwsgi-emperor/emperor.ini > /etc/uwsgi.ini

This assumes a modular (everything built as a plugin) uWSGI install.

On a Debian based system one need to be more careful with the system itself
overwriting the scripts during updates, hence we will use the `uwsgi-king`
directory and provide out won service.

    LOCAL=/usr/local/src/ops/uwsgi
    mkdir -p /usr/local/src
    cd /usr/local/src
    git clone https://github.com/grochmal/ops.git
    ln -s $(LOCAL)/uwsgi-emperor /etc/uwsgi-king
    rm -rf /etc/logrotate.d/uwsgi
    ln -s $(LOCAL)/logrotate/uwsgi /etc/logrotate.d/uwsgi
    systemctl stop uwsgi
    systemctl disable uwsgi
    ln -s $(LOCAL)/uwsgi-king.service /etc/systemd/system/uwsgi-king.service
    systemctl enable uwsgi-king
    systemctl start uwsgi-king

This also assumes a modular build but be careful of system packages here.
Sometimes packages such as `uwsgi-emperor` do not provide the binary
functionality but only scripts and services - which in turn may need to be
disabled in order for our king to run.

