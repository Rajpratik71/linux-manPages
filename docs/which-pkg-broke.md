which-pkg-broke(1)                                                debian-goodies                                                which-pkg-broke(1)

NAME
       which-pkg-broke - find which package might have broken another

SYNOPSIS
       which-pkg-broke package

DESCRIPTION
       The  which-pkg-broke  program  will retrieve a list of the named package and all its dependencies sorted by the time they were installed on
       the system (as determined from the mtime information of /var/lib/dpkg/info/*.list .

       This tool makes it possible for a system admin to obtain information that might correlate installation of package dependencies with a pack‐
       age breakage in order to find which package update might be responsible for the breakage.

EXAMPLES
       This tool can be useful determine which package dependencies were upgraded more recently and might be associated with the bug that is being
       observed.  For example, if aptitude stops working properly, an administrator can run:

       $ which-pkg-broke aptitude
       Package <libapt-pkg-libc6.3-5-3.3> has no install time info
       libdb1-compat                    Fri Aug  8 03:02:11 2003
       libsigc++-1.2-5c102              Fri Aug  8 05:15:58 2003
       aptitude                         Sun Jan 11 17:38:06 2004
       libncurses5                      Sun Jan 18 08:11:05 2004
       libc6                            Thu Jan 22 07:55:10 2004
       libgcc1                          Tue Jan 27 07:37:22 2004
       gcc-3.3-base                     Tue Jan 27 07:37:31 2004
       libstdc++5                       Tue Jan 27 07:37:32 2004

       So depending on exactly when the misbehaviour started, there may be a reason to point the finger at a more-recently  updated  library  like
       libstdc++ or libncurses, which are more-recently installed than aptitude itself.

SEE ALSO
       rc-alert(1)

AUTHOR
       which-pkg-broke was written by Bill Gribble <grib AT billgribble.com>

       This manual page was written by Javier Fernandez-Sanguino for the Debian GNU/Linux distribution.

debian-goodies                                                     July 24 2006                                                 which-pkg-broke(1)
