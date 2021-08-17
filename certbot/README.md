# Short Summary for Let's Encrypt

To serve pages through HTTP over TLS (formerly SSL), aka. HTTPS, one needs to
identify the server through a certificate chain that the client trusts.  Let's
Encrypt is a chain of certificates trusted by many clients, and `certbot` is
one tool that allows to generate (and trust) certificates from your server into
that certificate chain.

The idea behind let's encrypt certificates is the use of quickly expiring (3
months) certificates that can be quickly renewed.  Any ACME client is capable
of automatically renewing certificates but since `certbot` has ready made
packages for most distros we will just use that.  The first time you use
`certbot` to get the certificates is widely documented, the tricky bit is to
get `certbot renew` to run often and in a consistent manner.


## Trust

Many tools, scripts and extensions exist for `certbot` to generate and trust
certificates on many web servers.  The basic concept is to trust your server as
long as `certbot` can verify that it is indeed running on that server and the
domain given in the configuration point to that same server.  It performs this
check by generating a random challenge and sends it to let's encrypt, in turn
let's encrypt attempts to connect to the server over HTTP and retrieve that
same challenge.  Different options to `certbot` will setup the challenge and
check in different ways:

- `--standalone` will start a brand new HTTP server.  This will likely need to
  be run as `root` since it must bind to port 80.

- `--webroot` will expect a directory called `.well-known` in the web server
  root.  This directory must be writeable by the process running `certbot`.

- `--web-server-name` will use a plugin for the given web server.  This simply
  performs `--webroot` to a known location in the default web server
  installation.


## Renewal

We will base ourselves on the Debian package, which already has all these files
in place.  I will simplify the files in here, the actual distro files have a
few more fail-safes to account for esoteric configurations.  Most distros will
be based on `systemd init` these days, in which case we need a unit and a
timer.  Let's call it `certbot.service`, in a package it lives at
`/lib/systemd/system/` but in a user configuration it would be placed at
`/etc/systemd/user`.

    [Unit]
    Description=Certbot

    [Service]
    Type=oneshot
    ExecStart=/usr/bin/certbot -q renew
    PrivateTmp=true

The `PrivateTmp` is a good idea since it will disallow other processes from
seeing temporary files from `certbot`.  Once we have a unit we can make a
timer, say `certbot.times`.  Again in an OS package it will live at
`/lib/systemd/system/` and in a user configuration it would be placed at
`/etc/systemd/user`.

    [Unit]
    Description=Run certbot twice daily

    [Timer]
    OnCalendar=*-*-* 00,12:00:00
    RandomizedDelaySec=43200
    Persistent=true

    [Install]
    WantedBy=timers.target

In here the only strange bit is `Persistent=true` which ensures that a run that
has been missed, e.g. due to a reboot will be performed once the machine is on.
To make this possible `systemd` stores the time of execution on disk.

Another option is to use `cron`, just note that on several modern systems
`cron` itself may run from within `systemd`.  Instead of modifying the
`crontab` one can place a file into `/etc/cron.d`, which makes finding the
running service easier.  Let's Encrypt encourages to select a random time of
the day to request renewal in order to to overwhelm their servers.  Hence we
will use two request here: at 3:41 and at 15:41.  Please change these values in
your configuration.  We will call the file `/etc/cron.d/certbot`.

    # certbot crontab
    SHELL=/bin/sh
    PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

    41 3,15 * * * root test -x /usr/bin/certbot && certbot -q renew

There's one more loose end to tie: logs.  `certbot` writes into
`/var/log/letsencrypt` and as any logs we need to make sure these do not eat
away all disk space.  Pretty much every system will use some version of log
rotation compatible with `logrotate`, and we will create a configuration file
for that, namely `/etc/logrotate/certbot`.

    /var/log/letsencrypt/*.log {
        rotate 12
        weekly
        compress
        missingok
    }

Now you should be able to sleep better knowing that `certbot renew` will run
correctly and update your certificates when needed.  Next let's check how the
configuration should look in case something is wrong.


## Configuration

Let's Encrypt `certbot` runs based on the configuration in `/etc/letsencrypt`.
The directories there have each their own function as storage and/or
configuration.

`/etc/letsencrypt/accounts` stores the account information with which current
certificates have been generated and can be renewed with.  There are old (now
discontinued) `v1` accounts and the new `v2` accounts.  The accounts are not as
important as they sound, there is no direct link between certificates and
accounts, and one can easily create a new account and renew the current
certificates under a new account with `--reuse-key`.

`/etc/letsencrypt/archive` contains all previous instances of certificates.
New and renewed certificates are numbered in ascending order, the latest
certificate (the live certificate) is still placed here and soft linked from
the required places.

`/etc/letsencrypt/csr` stores the certificate signing requests (CSR) that were
sent to let's encrypt by `certbot`.  Either for new certificate creation or for
renewal.

`/etc/letsencrypt/keys` the encryption private keys for the certificates.
These are generated here before the certificate generation.

`/etc/letsencrypt/live` contains soft links to latest certificate and key in
the `archive` directory.  These links can be used directly by a web server and
just re-opened once a certificate is renewed.

`/etc/letsencrypt/renewal` certificate renewal configuration is stored in ini
files.  Each references the certificates' location, the web root for challenges
and account used.

`/etc/letsencrypt/renewal-hooks` hooks that `certbot` will invoke automatically
upon certificate renewal.  See next section for the most common use.


## Hooks

When a file is replaced on the file system new processes that open the file
will retrieve its new content.  On the other hand, processes that have a file
already open and that file is replaced will not see changes to the file.  This
is because of how file systems operate, the replaced file is a new file (with
different inodes from the original file) to with the directory re-points the
name of the file.  The file name is stored in the directory, hence the replaced
file will still be in the same directory with the same name.

For the purposes of certificates that will be used by a web server, this detail
of file system operation is quite important.  A web server is a process that
will likely run for a very long time (sometimes years without stopping) and
will not see the new contents of the renewed certificates unless nudged to do
so.  The hooks are executables - often scripts - that nudge the web server to
reopen the certificates and read the new contents.  One could use the hooks for
other purposes, such as copying the new certificates to a different location,
but the reopening of files by the web server is by far the most common purpose.

In our example we use the `nginx` web server, which reopens all files it
currently have opened by calling `nginx -s realod`.

