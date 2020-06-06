TAP2DEB(1)                                                                                                                                                                                     TAP2DEB(1)

NAME
       tap2deb - create Debian packages which wrap .tap files

SYNOPSIS
       tap2deb [options]

DESCRIPTION
       Create a ready to upload Debian package in ".build"

       -u, --unsigned
              do not sign the Debian package

       -t, --tapfile <tapfile>
              Build the application around the given .tap (default twistd.tap)

       -y, --type <type>
              The  configuration has the given type . Allowable types are tap, source, xml and python.  The first three types are mktap output formats, while the last one is a manual building of appli‐
              cation (see twistd(1), the -y option).

       -p, --protocol <protocol>
              The name of the protocol this will be used to serve. This is intended as a part of the description. Default is the name of the tapfile, minus any extensions.

       -d, --debfile <debfile>
              The name of the debian package. Default is 'twisted-'+protocol.

       -V, --set-version <version>
              The version of the Debian package. The default is 1.0

       -e, --description <description>
              The one-line description. Default is uninteresting.

       -l, --long_description <long_description>
              A multi-line description. Default is explanation about this being an automatic package created from tap2deb.

       -m, --maintainer <maintainer>
              The maintainer, as "Name Lastname <email address>". This will go in the meta-files, as well as be used as the id to sign the package.

       --version
              Output version information and exit.

AUTHOR
       Written by Moshe Zadka, based on twistd's help messages

REPORTING BUGS
       To report a bug, visit http://twistedmatrix.com/bugs/

COPYRIGHT
       Copyright © 2000-2008 Twisted Matrix Laboratories.
       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

                                                                                                July 2001                                                                                      TAP2DEB(1)
