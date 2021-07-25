# Short Summary for Let's Encrypt

The idea behind let's encrypt certificates is the use of quickly expiring (3
months) certificates that can be quickly renewed.  Any ACME client is capable
of automatically renewing certificates but since `certbot` has ready made
packages for most distros we will just use that.  The first time you use
`certbot` to get the certificates is widely documented, the tricky bit is to
get `certbot renew` to run often and in a consistent manner.

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
The directories there have their 


TODO
/etc/letsencrypt/accounts
/etc/letsencrypt/archive
/etc/letsencrypt/csr - revocation
/etc/letsencrypt/keys
/etc/letsencrypt/live
/etc/letsencrypt/renewal
/etc/letsencrypt/renewal-hooks



## Hooks

