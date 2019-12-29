NFNL_OSF(8)                                 iptables 1.8.3                                 NFNL_OSF(8)

NAME
       nfnl_osf - OS fingerprint loader utility

SYNOPSIS
       nfnl_osf -f fingerprints [ -d ]

DESCRIPTION
       The nfnl_osf utility allows to load a set of operating system signatures into the kernel for
       later matching against using iptables' osf match.

OPTIONS
       -f fingerprints
              Read signatures from file fingerprints.

       -d     Instead of adding the signatures from fingerprints into the kernel, remove them.

EXIT STATUS
       Exit status is 0 if command succeeded, otherwise a negative return code indicates the type of
       error which happened:

       -1     Illegal arguments passed, fingerprints file not readable or failure in netlink communi‐
              cation.

       -ENOENT
              Fingerprints file not specified.

       -EINVAL
              Netlink handle initialization failed or fingerprints file format invalid.

FILES
       An up to date set of operating system signatures can be downloaded from http://www.open‐
       bsd.org/cgi-bin/cvsweb/src/etc/pf.os .

SEE ALSO
       The description of osf match in iptables-extensions(8) contains further information about the
       topic as well as example nfnl_osf invocations.

iptables 1.8.3                                                                             NFNL_OSF(8)
