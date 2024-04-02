INTLTOOLIZE(8)                                                System Manager's Manual                                               INTLTOOLIZE(8)

NAME
       intltoolize - copy intltool related files to software package

SYNOPSIS
       intltoolize [option]...

DESCRIPTION
       This prepares a package to use intltool by linking or copying various files needed by intltool into place for use when building.  Note that
       you must change your working directory to the top level directory of the package before running intltoolize.

OPTIONS
       --automake
           Work silently and assume that automake is being used in software.

       -c
       --copy
           Copy files rather than creating symbolic links to them.

       --debug
           Enable verbose shell tracing.

       -n
       --dry-run
           Print commands only, instead of executing them.

       -f
       --force
           Replace existing files if they exist.

       --help
           Show usage and basic help information.

       --version
           Show version information.

REPORTING BUGS
       Report bugs to http://bugs.launchpad.net/intltool

AUTHOR
       Darin Adler <darin@bentspoon.com>
       Kenneth Christiansen <kenneth@gnu.org>
       Maciej Stachowiak <mjs@eazel.com>

SEE ALSO
       intltool-prepare(8), intltool-extract(8), intltool-merge(8), intltool-update(8)

intltool                                                            2003-08-02                                                      INTLTOOLIZE(8)
