requestbackport(1)                                            General Commands Manual                                           requestbackport(1)

NAME
       requestbackport - File a backport request bug

SYNOPSIS
       requestbackport [options] package

DESCRIPTION
       Determine  the  intermediate  releases  that  package  needs  to  be backported to, list all reverse-dependencies, and file the backporting
       request.  requestbackport will include a testing checklist in the bug.

OPTIONS
       -d DEST, --destination=DEST
              Backport to DEST release and necessary intermediate releases. Default: current stable release.

       -s SOURCE, --source=SOURCE
              Backport from SOURCE release.  Default: current development release.

       -l INSTANCE, --lpinstance=INSTANCE
              Launchpad instance to connect to.  Default: production.

       --no-conf
              Don't read config files or environment variables

       -h, --help
              Display a help message and exit.

SEE ALSO
       backportpackage(1), reverse-depends(1), https://wiki.ubuntu.com/UbuntuBackports.

AUTHORS
       requestbackport and this manpage were written by Stefano Rivera <stefanor@ubuntu.com>.

       Both are released under the terms of the ISC License.

ubuntu-dev-tools                                                   November 2011                                                requestbackport(1)
