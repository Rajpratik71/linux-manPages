yptest(8)                                                                                  System Manager's Manual                                                                                  yptest(8)



NAME
       yptest - test NIS configuration

SYNOPSIS
       yptest [-q] [-d domain] [-h host] [-m map] [-u user]

DESCRIPTION
       yptest calls various NIS functions to check if the NIS configuration is correct and works as expected.

OPTIONS
       -q     Be quiet, don't print messages

       -d domainname
              Specify a domain other than the default domain as returned by domainname(8).  This option is not supported by all tests.

       -h hostname
              Query ypserv on hostname instead of the currently used one.  This option is not supported by all tests.

       -m map Use the map map for the tests instead of passwd.byname.  This option should be used if the default map does not exist.

       -u user
              Use the account user instead of nobody.  This option should be used if the nobody account does not exist in the map used for testing (passwd.byname or the one given with the -m option).

SEE ALSO
       domainname(8), ypbind(8), ypcat(8), ypmatch(1), ypserv(8), yppoll(8), ypwhich(1)

AUTHOR
       yptest is part of the yp-tools package, which was written by Thorsten Kukuk <kukuk@linux-nis.org>.



YP Tools 2.14                                                                                     April 2010                                                                                        yptest(8)
