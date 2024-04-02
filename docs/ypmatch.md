ypmatch(1)                                                                                 General Commands Manual                                                                                 ypmatch(1)



NAME
       ypmatch - print the values of one or more keys from a NIS map

SYNOPSIS
       ypmatch [ -kt ] [ -d domain ] key ... mapname
       ypmatch -x

DESCRIPTION
       ypmatch prints the values of one or more keys from the NIS database specified by mapname, which may be a map name or a map nickname.

OPTIONS
       -d domain
              Specify a domain other than the default domain as returned by domainname(8).

       -k     Display map keys. This option is useful with maps in which the values are null or the key is not part of the value.

       -t     This option inhibits map nickname translation.

       -x     Display the map nickname translation table.

FILES
       /var/yp/nicknames
              map nickname translation table.

SEE ALSO
       domainname(8), nicknames(5), ypbind(8), ypcat(1), yppoll(8), ypserv(8), ypset(8), ypwhich(1)

AUTHOR
       ypmatch is part of the yp-tools package, which was written by Thorsten Kukuk <kukuk@linux-nis.org>.



YP Tools 2.14                                                                                     April 2010                                                                                       ypmatch(1)
