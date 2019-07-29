domainname(8)                                                                              System Manager's Manual                                                                              domainname(8)



NAME
       domainname - set or display name of current domain
       nisdomainname - set or display name of current NIS(YP) domain
       ypdomainname - set or display name of current NIS(YP) domain

SYNOPSIS
       domainname [ domain ]
       nisdomainname [ domain ]
       ypdomainname [ domain ]

DESCRIPTION
       Without   an   argument,  domainname displays the name of the current NIS domainname of the system.  domainname uses the getdomainname(2) function for getting the domainname, nisdomainname and ypdo-
       mainname are using yp_get_default_domain(3).

       Only the super-user can set the name of the domain by specifying the new domain as an argument. All three programs uses setdomainname(2) for this. Bear in mind, that  already  running  programs  may
       continue to use the old domainname.

SEE ALSO
       getdomainname(2), setdomainname(2), yp_get_default_domain(3), ypbind(8), ypcat(1), ypmatch(1), ypwhich(1), yppoll(8), ypserv(8), ypset(8)

AUTHOR
       domainname is part of the yp-tools package, which was written by Thorsten Kukuk <kukuk@linux-nis.org>.



YP Tools 2.14                                                                                     April 2010                                                                                    domainname(8)
