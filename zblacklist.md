ZBLACKLIST(1)                                                       zblacklist                                                       ZBLACKLIST(1)

NAME
       zblacklist - zmap IP blacklist tool

SYNOPSIS
       zblacklist [ -b <blacklist> ] [ -w <whitelist> ] [ OPTIONS... ]

DESCRIPTION
       ZBlacklist is a network tool for limiting and deduplicating a list of IP addresses using a blacklist or whitelist.

OPTIONS
   BASIC OPTIONS
       -b, --blacklist-file=path
              File of subnets to exclude, in CIDR notation, one-per line. It is recommended you use this to exclude RFC 1918 addresses, multicast,
              IANA reserved space, and other IANA special-purpose addresses. An example blacklist file blacklist.conf for this purpose.

       -w, --whitelist-file=name
              File of subnets to include, in CIDR notation, one-per line. All other subnets will be excluded.

       -l, --log-file=name
              File to log to.

       -v, --verbosity
              Level of log detail (0-5, default=3)

       --no-duplicate-checking
              Don´t deduplicate input addresses. Default is false.

       --ignore-blacklist-errors
              Ignore invalid entries in the blacklist. Default is false.

zmap v2.1.1                                                       September 2015                                                     ZBLACKLIST(1)
