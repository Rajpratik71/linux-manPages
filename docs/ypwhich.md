ypwhich(1)                                                                                 General Commands Manual                                                                                 ypwhich(1)



NAME
       ypwhich - return name of NIS server or map master

SYNOPSIS
       ypwhich [ -d domain ] [ -Vn ] [ hostname ]
       ypwhich [ -d domain ] [ -t ] -m [ mname ]
       ypwhich -x

DESCRIPTION
       ypwhich  returns  the  name  of  the NIS server that supplies the NIS services to a NIS client, or which is the master for a map.  If invoked without arguments, it gives the NIS server for the local
       machine. If hostname is specified, that machine is queried to find out which NIS master it is using.

OPTIONS
       -d domain
              Specify a domain other than the default domain.

       -t     This option inhibits map nickname translation.

       -m mname
              Find the master NIS server for a map.  No hostname can be specified with the -m option.  mname can be a mapname or nickname for a map.  If mname is omitted, ypwhich will  produce  a  list  of
              available maps.

       -x     Display the map nickname translation table.

       -Vn    Version of ypbind(8), V2 is default.


FILES
       /var/yp/nicknames
              map nickname translation table.

SEE ALSO
       domainname(8), nicknames(5), ypbind(8), ypcat(1), ypmatch(1), yppoll(8), ypserv(8), ypset(8)

AUTHOR
       ypwhich is part of the yp-tools package, which was written by Thorsten Kukuk <kukuk@linux-nis.org>.



YP Tools 2.14                                                                                     April 2010                                                                                       ypwhich(1)
