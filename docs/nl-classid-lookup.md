nl-classid-lookup(8)                                                                       System Manager's Manual                                                                       nl-classid-lookup(8)



NAME
       nl-classid-lookup - Lookup classid definitions

SYNOPSIS
       nl-classid-lookup [-hv] [-r] [--raw] name


DESCRIPTION
       nl-classid-lookup searches the classid database for a matching entry. It is used to resolve qdisc/class names to classid values and vice versa.


OPTIONS
       -h or --help
              Print help text to console and exit.

       -v or --version
              Print versioning information to console and exit.

       -r or --reverse
              Do a reverse lookup. Lookup a classid and print its name.

       --raw  Print the raw classid in hexadecimal format, do not pretty print it.


USAGE
       Resolve the qdisc/class name "interactive":

              # nl-classid-lookup interactive

       Lookup the name of classid 1:2:

              # nl-classid-lookup -r 1:2


FILES
       /etc/libnl/classid


AUTHOR
       Thomas Graf is the original author and current maintainer of libnl and libnl tools. Many people have contributed to it since.



libnl                                                                                          19 October 2010                                                                           nl-classid-lookup(8)
