ldns-resolver(1)                                                                           General Commands Manual                                                                           ldns-resolver(1)



NAME
       ldns-resolver - tries to create a resolver from a resolv.conf file.

SYNOPSIS
       ldns-resolver file


DESCRIPTION
       ldns-resolver tries to create a resolver from a resolv.conf file.  This is only useful to test the library for robusteness with input data.


OPTIONS
       ldns-resolver takes a filename of the resolv.conf file as input.  For example ldns-resolver /etc/resolv.conf will show if the file can be parsed successfully.


AUTHOR
       Written by the ldns team as an example for ldns usage.


REPORTING BUGS
       Report bugs to <ldns-team@nlnetlabs.nl>.


COPYRIGHT
       Copyright (C) 2005 NLnet Labs. This is free software. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



                                                                                                 27 Apr 2005                                                                                 ldns-resolver(1)
