BLDREAD(8)                                                    System Manager's Manual                                                   BLDREAD(8)

NAME
       bldread - read bld dumps

SYNOPSIS
       bld -h | filename

OPTIONS
       -h display usage

DESCRIPTION
       bldread is the utility designed to read bld dump files.  It outputs semicolon separated values in the following order:

       ·      IP address (`a.b.c.d')

       ·      Insertion time (timestamp in seconds)

       ·      Last update (timestamp in seconds)

       ·      Number of submissions during the interval

       ·      Second submissions counter

       ·      options bitfield (`1' if forced insertion, no other options yet)

       ·      Blacklist flag (`1' if blacklisted, `0' otherwise)

       ·      Internal pointer value for debugging purposes

       ·      Another internal pointer value for debugging purposes

FILES
       /var/run/bld/bld_iplist.dump /var/run/bld/bld_blacklist.dump

SEE ALSO
       bld(8) bldquery(8) bldsubmit(8) bldinsert(8) blddecr(8)

AUTHOR
       Olivier Beyssac <obld@r14.freenix.org>

                                                                    August 2004                                                         BLDREAD(8)
