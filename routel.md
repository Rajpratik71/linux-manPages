ROUTEL(8)                                                                                         Linux                                                                                         ROUTEL(8)

NAME
       routel - list routes with pretty output format
       routef - flush routes

SYNTAX
       routel [tablenr [raw ip args...]]
       routef

DESCRIPTION
       These programs are a set of helper scripts you can use instead of raw iproute2 commands.
       The routel script will list routes in a format that some might consider easier to interpret then the ip route list equivalent.
       The routef script does not take any arguments and will simply flush the routing table down the drain. Beware! This means deleting all routes which will make your network unusable!

FILES
       /usr/bin/routef
       /usr/bin/routel

AUTHORS
       The routel script was written by Stephen R. van den Berg <srb@cuci.nl>, 1999/04/18 and donated to the public domain.
       This manual page was written by Andreas Henriksson  <andreas@fatal.se>, for the Debian GNU/Linux system.

SEE ALSO
       ip(8)

iproute2                                                                                       3 Jan, 2008                                                                                      ROUTEL(8)
