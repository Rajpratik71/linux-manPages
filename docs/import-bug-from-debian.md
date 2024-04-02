import-bug-from-debian(1)                                     General Commands Manual                                    import-bug-from-debian(1)

NAME
       import-bug-from-debian - Import bugs from Debian's BTS, and file them against Ubuntu in LP.

SYNOPSIS
       import-bug-from-debian [options] bug...
       import-bug-from-debian -h

DESCRIPTION
       import-bug-from-debian  clones  bugs  from Debian's BTS into Launchpad. Each bug listed on the command line has its initial report re-filed
       against the same source package in Ubuntu.  The Ubuntu bug is linked back to its Debian counterpart.

       Each bug may be provided either as a bug number or URL.

OPTIONS
       -b, --browserless
              Don't open the bug in a browser at the end.

       -h, --help
              Display a help message and exit.

       -l INSTANCE, --lpinstance=INSTANCE
              Use the specified instance of Launchpad (e.g. "staging"), instead of the default of "production".

       -p PACKAGE, --package=PACKAGE
              Launchpad package to file bug against, if not the same source package name as Debian.   Useful  for  importing  removal  bugs  filed
              against ftp.debian.org.

       --no-conf
              Do not read any configuration files, or configuration from environment variables.

ENVIRONMENT
       All  of  the  CONFIGURATION  VARIABLES  below are also supported as environment variables.  Variables in the environment take precedence to
       those in configuration files.

CONFIGURATION VARIABLES
       The following variables can be set in the environment or in ubuntu-dev-tools(5) configuration files.  In  each  case,  the  script-specific
       variable takes precedence over the package-wide variable.

       IMPORT_BUG_FROM_DEBIAN_LPINSTANCE, UBUNTUTOOLS_LPINSTANCE
              The default value for --lpinstance.

SEE ALSO
       ubuntu-dev-tools(5)

AUTHORS
       import-bug-from-debian  was  written  by  James  Westby <james.westby@ubuntu.com>, and this manual page was written by Stefano Rivera <ste‐
       fanor@ubuntu.com>.

       Both are released under the terms of the GNU General Public License, version 2.

ubuntu-dev-tools                                                 September 21 2010                                       import-bug-from-debian(1)
