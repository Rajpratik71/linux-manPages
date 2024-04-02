SHONEYPOT(8)                                                  System Manager's Manual                                                 SHONEYPOT(8)

NAME
       thpot - Tiny honeypot to setup simple (and fake) services

SYNOPSIS
       thpot [service name]

DESCRIPTION
       This  manual  page documents briefly the thpot command.  This manual page was written for the Debian distribution because the original pro‐
       gram does not have a manual page.  Instead, it has documentation in the GNU Info format; see below.

       thpot is a program that enables you to fake services by configuring it to be executed through either xinetd or inetd.  All  the  connection
       attempts and sessions to simulated services are logged under /var/log/thpot.

OPTIONS
       This program takes as argument the name of the service which is being simulated, it can be anyone of shell, ftp, http, mssql, smtp, pop3 or
       ssh. If the service name is none of these a null response is returned (but the session is logged)

FILES
       /var/log/thpot
              Location of the connections attempts and sessions to the honeypot services.

       /etc/thpot/thp.conf
              Configuration for the honeypot

       /usr/share/thpot/
              Miscellaneous files and functions used by thpot

SEE ALSO
       inetd.conf(5), inetd(8)

AUTHOR
       This manual page was written by Javier Fernandez-Sanguino Pen~a <jfs@computer.org>, for the Debian GNU/Linux system (but  may  be  used  by
       others).

                                                                September 17, 2003                                                    SHONEYPOT(8)
