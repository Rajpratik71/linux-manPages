ypset(8)                                                                                   System Manager's Manual                                                                                   ypset(8)



NAME
       ypset - bind ypbind to a particular NIS server

SYNOPSIS
       ypset [ -d domain ] [ -h hostname ] server

DESCRIPTION
       In   order   to  run  ypset, ypbind must be initiated with the -ypset or -ypsetme options.  See ypbind(8).  ypset tells ypbind to get NIS services for the specified domain from the ypserv(8) process
       running on server.

       In cases where several hosts on the local net are supplying NIS services, it is possible for ypbind to rebind to another host even while you attempt to find out if the ypset operation succeeded. For
       example, you can type:

       example% ypset host1
       example% ypwhich
       host2
       which  can  be  confusing.  This  is  a function of the NIS subsystem's attempt to know always a running NIS server, and occurs when host1 does not respond to ypbind because it is not running
       ypserv (or is overloaded), and host2, running ypserv, gets the binding.
       Server indicates the NIS server to bind to,  and must be specified as a name or an IP address. This will work only if the node has a current valid binding for  the  domain  in  question,  and
       ypbind has been set to allow use of ypset.  In most  cases, server should be specified as an IP address.
OPTIONS
       -d domain
              Specify a domain other than the default domain as returned by domainname(8).
       -h hostname
              Set the NIS binding on host hostname
               instead of the local machine.
SEE ALSO
       domainname(8), ypbind(8), ypcat(8), ypmatch(1), ypserv(8), yppoll(8), ypwhich(1)
AUTHOR
       ypset is part of the yp-tools package, which was written by Thorsten Kukuk <kukuk@linux-nis.org>.



YP Tools 2.14                                                                                     April 2010                                                                                         ypset(8)
