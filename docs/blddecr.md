BLDSUBMIT(8)                                                  System Manager's Manual                                                 BLDSUBMIT(8)

NAME
       blddecr - decrement the counter of an IP address on a bld host

SYNOPSIS
       blddecr [host [port]] ip

DESCRIPTION
       blddecr asks the bld daemon listening on host:port (default localhost:2905) to decrement the counter for ip.

SEE ALSO
       bld(8) bldread(8) bldquery(8) bldinsert(8) blddecr(8)

AUTHOR
       Olivier Beyssac <obld@r14.freenix.org>

                                                                    August 2004                                                       BLDSUBMIT(8)
