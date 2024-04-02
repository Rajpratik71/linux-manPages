BLD-PF_LOG.PL(8)                                              System Manager's Manual                                             BLD-PF_LOG.PL(8)

NAME
       bld-pf_log.pl - feed BLD with Postifx log files

SYNOPSIS
       bld-pf_log.pl

DESCRIPTION
       bld-pf_log.pl reads mail logs and submits to a bld daemon anything that looks like a "user unknown" Postfix log line.  This script gets its
       information from stdin, so the easiest way to use it is like this:

          tail -f /path/to/postfix/logfile | bld-pf_log.pl

       You may have to provide various options to the tail program in order to support file modifications such as log rotations.

SEE ALSO
       bld(8) bldread(8) tail(1)

AUTHOR
       Olivier Beyssac <obld@r14.freenix.org>

                                                                   December 2004                                                  BLD-PF_LOG.PL(8)
