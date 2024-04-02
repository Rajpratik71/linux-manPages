cups-config(1)                                                                                    Apple Inc.                                                                                   cups-config(1)



NAME
       cups-config - get cups api, compiler, directory, and link information.

SYNOPSIS
       cups-config --api-version
       cups-config --build
       cups-config --cflags
       cups-config --datadir
       cups-config --help
       cups-config --ldflags
       cups-config [ --image ] [ --static ] --libs
       cups-config --serverbin
       cups-config --serverroot
       cups-config --version

DESCRIPTION
       cups-config is the CUPS program configuration utility. It should be used by application developers to determine the necessary command-line options for the compiler and linker, as well as determining
       installation directories for filters, configuration files, and drivers.

OPTIONS
       --api-version
            Displays the current API version (major.minor).

       --build
            Displays a system-specific build number.

       --cflags
            Displays the necessary compiler options.

       --datadir
            Displays the default CUPS data directory.

       --help
            Displays the program usage message.

       --image
            When used with --libs, adds the CUPS imaging library to the list of displayed libraries.

       --ldflags
            Displays the necessary linker options.

       --libs
            Displays the necessary librarys to link to.

       --serverbin
            Displays the default CUPS binary directory, where filters and backends are stored.

       --serverroot
            Displays the default CUPS configuration file directory.

       --static
            When used with --libs, shows the static libraries instead of the default (shared) libraries.

       --version
            Displays the full version number of the CUPS installation (major.minor.patch).

SEE ALSO
       http://localhost:631/help

COPYRIGHT
       Copyright 2007-2013 by Apple Inc.



23 October 2008                                                                                      CUPS                                                                                      cups-config(1)
