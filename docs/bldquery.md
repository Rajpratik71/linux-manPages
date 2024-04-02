BLDQUERY(8)                                                   System Manager's Manual                                                  BLDQUERY(8)

NAME
       bldquery - query a bld host

SYNOPSIS
       bldquery [host [port]] ip

DESCRIPTION
       bldquery asks the bld daemon listening on host:port (default localhost:2905) if ip is blacklisted or not.

SEE ALSO
       bld(8) bldread(8) bldsubmit(8) bldinsert(8) blddecr(8)

AUTHOR
       Olivier Beyssac <obld@r14.freenix.org>

                                                                    August 2004                                                        BLDQUERY(8)
