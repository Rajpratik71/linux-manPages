yppoll(8)                                                                                  System Manager's Manual                                                                                  yppoll(8)



NAME
       yppoll - return version and master server of a NIS map

SYNOPSIS
       yppoll [ -h host ] [ -d domain ] mapname

DESCRIPTION
       yppoll


OPTIONS
       -h host
              Ask the NIS server process running on host for information about mapname.  If host is not specified, the server polled is the default server returned by ypwhich(1).

       -d domain
              Specify a domain other than the default domain as returned by domainname(8).

SEE ALSO
       domainname(8), ypbind(8), ypcat(8), ypmatch(1), ypserv(8), ypset(8), ypwhich(1)

AUTHOR
       yppoll is part of the yp-tools package, which was written by Thorsten Kukuk <kukuk@linux-nis.org>.



YP Tools 2.14                                                                                     April 2010                                                                                        yppoll(8)
