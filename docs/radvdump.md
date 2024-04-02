RADVDUMP(8)                                                                                                                                                                                       RADVDUMP(8)



NAME
       radvdump - dump router advertisements

SYNOPSIS
       radvdump [ -vhfe ] [ -d debuglevel ]


DESCRIPTION
       radvdump prints out the contents of incoming router advertisements sent by radvd or some other software implementing (parts of) "Neighbor Discovery for IP Version 6 (IPv6)" (RFC 4861).


OPTIONS
       For every one character option there is also a long option, which is listed right next to the "short" option name:


       -v, --version
              Displays the version of radvdump and then aborts.

       -h, --help
              Displays a short usage description and then aborts.

       -f, --file-format
              Output received router advertisements in the format of the radvd configuration file.  Since radvd 0.9, this is the default and the switch is provided for backward compatibility only.

       -e, --exclude-defaults
              Exclude default valued options from configuration file format.  This option is ignored if option -f is not set.

       -d debuglevel, --debug debuglevel
              With  this option you turn on debugging information. The debugging level is an integer in the range from 1 to 4, from quiet to very verbose. A debugging level of 0 completely turns off debug‐
              ging.

              The default debugging level is 0.


FILES
       /usr/sbin/radvdump

BUGS
       There certainly are some bugs. If you find them or have other suggestions please contact Reuben Hawkins <reubenhwk@gmail.com>.


SEE ALSO
       radvd(8), radvd.conf(5)

AUTHORS
       Lars Fenneberg <lf@elemental.net>  - previous maintainer
       Nathan Lutchansky <lutchann@litech.org> - previous maintainer
       Reuben Hawkins <reubenhwk@gmail.com>    - current maintainer
       Marko Myllynen <myllynen@lut.fi>   - Mobile IPv6 support



radvd 2.17                                                                                       31 Mar 2008                                                                                      RADVDUMP(8)
