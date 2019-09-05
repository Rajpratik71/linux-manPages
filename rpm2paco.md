RPM2PACO(8)                                                           System                                                           RPM2PACO(8)

NAME
       rpm2paco - create paco logs from a local RPM database

SYNOPSIS
       rpm2paco [OPTIONS] <packages>

DESCRIPTION
       rpm2paco  is  a shell script that create paco(8) logs from rpm(8) ones. The newly created logs are placed into the paco log directory auto‐
       matically.

       Is not mandatory to add the version suffix to the input packages, since rpm adds it automatically.

OPTIONS
       -a, --all
              Read the whole rpm database of the system, and create a paco log for each logged package. Warning: for more  than  a  few  packages,
              this may take a long time.

       -q, --quiet
              Be quiet, except for errors.

       -f, --force
              Force overwrite of any already logged package. By default they are skipped.

       -j, --sync-version
              Remove  obsolete versions of the packages from the paco database. For instance, if foo-1.0 is beeing imported, and foo-2.4 is logged
              by paco but not by rpm, remove foo-2.4 from the paco database.

       -s, --strip-release
              Remove the release suffix from the name of the package (e.g. 'foo-1.0.2-2.1' --> 'foo-1.0.2').

       -h, --help
              Print a usage message and exit.

       -v, --version
              Print version information and exit.

WEB SITE
       http://paco.sourceforge.net

COPYRIGHT
       Copyright (C) 2004-2009 David Rosal <davidrr@sourceforge.net>
       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU‐
       LAR PURPOSE.

SEE ALSO
       paco(8), pacorc(5), superpaco(8), pacoball(8)

paco-2.0.9                                                         28 June 2010                                                        RPM2PACO(8)
