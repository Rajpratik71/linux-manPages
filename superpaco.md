SUPERPACO(8)                                                          System                                                          SUPERPACO(8)

NAME
       superpaco - Debian, RPM or Slackware package installation support for paco(8).

SYNOPSIS
       superpaco [OPTIONS] <packages>

DESCRIPTION
       superpaco  performs  the  installation  of  Debian,  RPM or Slackware binary packages, without requiring the use of dpkg(8), rpm(8) or pkg‐
       tool(8). The installations are logged by paco (but see option -n below),

       To install RPM packages, cpio(1) and ( rpm2cpio(1) or rpmunpack ) are required.

OPTIONS
       -h, --help
              Display a brief usage message and exit.

       -v, --version
              Display version information and exit.

       -q, --quiet
              Be silent, except for errors.

       -n, --no-paco
              Do not use paco to log the installation.

       --root=PATH
              When installing the files, use PATH as the root directory.

       -s, --strip-release
              Remove the release suffix from the name of the package (e.g. 'foo-1.0.2-2.1' --> 'foo-1.0.2').

WEB SITE
       http://paco.sourceforge.net

COPYRIGHT
       Copyright (C) 2004-2009 David Rosal <davidrr@sourceforge.net>
       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU‐
       LAR PURPOSE.

SEE ALSO
       paco(8), pacorc(5), pacoball(8), rpm2paco(8)

paco-2.0.9                                                         28 June 2010                                                       SUPERPACO(8)
