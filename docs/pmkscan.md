PMKSCAN(1)                                                  BSD General Commands Manual                                                 PMKSCAN(1)

NAME
     pmkscan — source scanning tool

SYNOPSIS
     pmkscan [-hlv] [-f file]

DESCRIPTION
     pmkscan is a tool which scans the sources with the intention to generate build files like pmkfile(5) , config file template (by default con‐
     fig.h.pmk) and makefile template (by default Makefile.pmk).

     The options are as follows:

     -f file
             Use the given file instead of the default script named scanfile(5) which should be in the working directory.

     -h      Display usage.

     -l      Log into pmkscan log file.

     -v      Display the version number.

FILES
     pmkfile  default pmkscan(1) generated pmkfile.
     pmkscan.dat
              pmkscan(1) database
     scanfile
              pmkscan(1) specifications file

SEE ALSO
     pmk(1), pmkfile(5) scanfile(5)

AUTHOR
     Damien Couderc.

BSD                                                               March 28, 2003                                                               BSD
