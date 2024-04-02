TAP2RPM(1)                                                                                                                                                                                     TAP2RPM(1)

NAME
       tap2rpm - create RPM packages which wrap .tap files

SYNOPSIS
       tap2rpm [options]

DESCRIPTION
       Create a set of RPM/SRPM packages in the current directory

       -t, --tapfile <tapfile>
              Build the application around the given .tap (default twistd.tap)

       -y, --type <type>
              The  configuration has the given type . Allowable types are tap, source, xml and python.  The first three types are mktap output formats, while the last one is a manual building of appli‐
              cation (see twistd(1), the -y option).

       -p, --protocol <protocol>
              The name of the protocol this will be used to serve. This is intended as a part of the description. Default is the name of the tapfile, minus any extensions.

       -d, --rpmfile <rpmfile>
              The name of the RPM package. Default is 'twisted-'+protocol.

       -V, --set-version <version>
              The version of the RPM package. The default is 1.0

       -e, --description <description>
              The one-line description. Default is uninteresting.

       -l, --long_description <long_description>
              A multi-line description. Default is explanation about this being an automatic package created from tap2rpm.

       -m, --maintainer <maintainer>
              The maintainer, as "Name Lastname <email address>". This will go in the meta-files.

       --version
              Output version information and exit.

AUTHOR
       tap2rpm was written by Sean Reifschneider based on tap2deb by Moshe Zadka.  This man page is heavily based on the tap2deb man page by Moshe Zadka.

REPORTING BUGS
       To report a bug, visit http://twistedmatrix.com/trac/wiki/TwistedDevelopment#FilingTickets for more information.

COPYRIGHT
       Copyright © 2000-2009 Twisted Matrix Laboratories.
       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

                                                                                                July 2001                                                                                      TAP2RPM(1)
