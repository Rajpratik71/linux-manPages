LIBTOOLIZE(1)                                                                                   User Commands                                                                                   LIBTOOLIZE(1)



NAME
       libtoolize - manual page for libtoolize 2.4.1a

SYNOPSIS
       libtoolize [OPTION]...

DESCRIPTION
       Prepare a package to use libtool.

       -c, --copy
              copy files rather than symlinking them

       --debug
              enable verbose shell tracing

       -n, --dry-run
              print commands rather than running them

       -f, --force
              replace existing files

       -i, --install
              copy missing auxiliary files

       --ltdl[=DIR]
              install libltdl sources [default: libltdl]

       --no-warn
              don't display warning messages

       --nonrecursive
              prepare ltdl for non-recursive make

       -q, --quiet
              work silently

       --recursive
              prepare ltdl for recursive make

       --subproject
              prepare ltdl to configure and build independently

       -v, --verbose
              verbosely report processing

       --version
              print version information and exit

       -h, --help
              print short or long help message

       The following space or comma delimited options can be passed to libtoolize via the environment variable LIBTOOLIZE_OPTIONS, unknown environment options are ignored:

       --debug
              enable verbose shell tracing

       --no-warn
              don't display warning messages

       --quiet
              work silently

       --verbose
              verbosely report processing

       You must `cd' to the top directory of your package before you run `libtoolize'.

       When reporting a bug, please describe a test case to reproduce it and include the following information:

       host-triplet:
              x86_64-apple-darwin11.2.0

       libtoolize:
              (GNU libtool) 2.4.1a

       automake:
              automake (GNU automake) 1.11.1

       autoconf:
              autoconf (GNU Autoconf) 2.68

AUTHOR
       Written by Gary V. Vaughan <gary@gnu.org>, 2003

REPORTING BUGS
       Report bugs to <bug-libtool@gnu.org>.
       GNU libtool home page: <http://www.gnu.org/software/libtool/>.
       General help using GNU software: <http://www.gnu.org/gethelp/>.

COPYRIGHT
       Copyright © 2010 Free Software Foundation, Inc.
       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       The full documentation for libtoolize is maintained as a Texinfo manual.  If the info and libtoolize programs are properly installed at your site, the command

              info libtoolize

       should give you access to the complete manual.



libtoolize 2.4.1a                                                                                October 2011                                                                                   LIBTOOLIZE(1)
