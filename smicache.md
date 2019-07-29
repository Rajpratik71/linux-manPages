smicache(1)                                                          SMI Tools                                                         smicache(1)

NAME
       smicache - caching method for use with libsmi

SYNOPSIS
       smicache [ -Vh ] [ -d dir ] [ -p prefix ] [ mib ]

DESCRIPTION
       The smicache program can be used by libsmi to fetch MIB modules that cannot be found in regular local MIB directories.

OPTIONS
       -V     Show the smicache version and exit.

       -h     Show a help text and exit.

       -d dir Write fetched module file(s) to directory dir.

       -p prefix
              Use the URL prefix prefix for fetching modules.

       mib    The MIB module to be fetched.

       Note  that  smicache  is just a very simple script that builds on the wget program to retrieve files from URLs. It does not handle the file
       attributes of retrieved modules in any special way, so that you have to care about permissions in multi-user environments.

EXAMPLE
       Smicache can be used by putting the following line into the global configuration file:

         cache /usr/local/share/mibs/cache \
           /usr/local/bin/smicache \
           -d /usr/local/share/mibs/cache \
           -p http://www.ibr.cs.tu-bs.de/projects/libsmi/smicache/

       You might want to chmod 1777 /usr/local/share/mibs/cache.

SEE ALSO
       The libsmi(3) project is documented at http://www.ibr.cs.tu-bs.de/projects/libsmi/.

       smilint(1)

AUTHOR
       (C) 2001-2004 Frank Strauss, TU Braunschweig, Germany <strauss@ibr.cs.tu-bs.de>

IBR                                                               August 10, 2004                                                      smicache(1)
