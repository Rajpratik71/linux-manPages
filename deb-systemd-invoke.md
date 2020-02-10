DEB-SYSTEMD-INVOKE(1p)                                                             User Contributed Perl Documentation                                                             DEB-SYSTEMD-INVOKE(1p)

NAME
       deb-systemd-invoke - wrapper around systemctl, respecting policy-rc.d

SYNOPSIS
       deb-systemd-invoke start|stop|restart unit file ...

DESCRIPTION
       deb-systemd-invoke is a Debian-specific helper script which asks /usr/sbin/policy-rc.d before performing a systemctl call.

       deb-systemd-invoke is intended to be used from maintscripts to start systemd unit files. It is specifically NOT intended to be used interactively by users. Instead, users should run systemd and
       use systemctl, or not bother about the systemd enabled state in case they are not running systemd.

perl v5.22.1                                                                                    2016-11-29                                                                         DEB-SYSTEMD-INVOKE(1p)
