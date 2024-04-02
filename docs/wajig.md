wajig(1)                                                      General Commands Manual                                                     wajig(1)

NAME
       wajig - Simplified command line administrator for Debian

SYNOPSIS
       wajig [options] commands...

DESCRIPTION
       This manual page briefly documents the wajig command.

       wajig  packages  into one tool many commands useful for managing a Debian system. Instead of having to remember whether to use dpkg or apt-
       get or apt-cache, etc, wajig does the selection of the appropriate tool for you.

       wajig is a user command but will use sudo to run commands requiring super user permissions.

       The primary documentation is available from http://www.togaware.com/wajig.

OPTIONS
       This program follows the usual GNU command line syntax, with long options starting with two dashes (`-').  A summary of options to get  you
       started is included below.  For more details see wajig tutorial and wajig commands.

       -h, --help
              Show summary.

       -V, --version
              Show version of program.

AUTHOR
       This  manual  page  was written by Graham Williams <Graham.Williams@togaware.com>, for the Debian GNU/Linux system (but may be used by oth‐
       ers).

                                                                    March, 2012                                                           wajig(1)
