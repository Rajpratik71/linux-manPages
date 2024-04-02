repomanage(1)                                                                                                                                                                                   repomanage(1)



NAME
       repomanage - list the newest or oldest RPM packages in a directory

SYNOPSIS
       repomanage [options] directory

DESCRIPTION
       repomanage is a program to manage a directory of RPM packages. It displays a list of the newest or oldest packages in a directory for easy piping to xargs or similar programs.

OPTIONS
       -h, --help
              Display a help message, and then quit.

       -o, --old
              Print the oldest packages.

       -n, --new
              Print the newest packages.

       -s, --space
              Space-separated instead of newline-separated output.

       -k KEEP, --keep=KEEP
              Newest N packages to keep - defaults to 1.

       -c, --nocheck
              Do not check package payload signatures/digests.


SEE ALSO
       yum.conf (5)
       http://yum.baseurl.org/


AUTHORS
       See the Authors file included with this program.



                                                                                               13 January 2013                                                                                  repomanage(1)
