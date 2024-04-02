rbldns-conf(8)                                                System Manager's Manual                                               rbldns-conf(8)

NAME
       rbldns-conf - sets up an IP-address-listing DNS service.

SYNOPSIS
       rbldns-conf acct logacct D ip base

DESCRIPTION
       rbldns-conf creates a service directory D that runs rbldns(8).  The name D must start with a slash and must not contain any special charac‐
       ters.  Normally D is /etc/rbldns.

       You can run the service under svscan(8) by using the update-service(8) program on Debian GNU/Linux

       update-service --add D

       or by creating a symbolic link in the svscan(8) directory (normally /service or /etc/service), e.g.:

       ln -s D /service

       The service will start within five seconds, and will be restarted upon reboot.  You can use svc(8) to control the service.

       rbldns-conf arranges for rbldns(8) to chroot to D/root and to run under the uid and gid of acct.  The name acct must not contain  any  spe‐
       cial characters.

       rbldns-conf creates D/root/Makefile to run rbldns-data(8) upon request.

       rbldns-conf arranges for rbldns(8) to listen for UDP packets on port 53 of ip, and to send outgoing packets from ip.

       rbldns-conf arranges for rbldns(8) to answer queries under the base domain.  The name base must not contain any special characters.

       rbldns-conf  creates  an  automatically rotated log directory in D/log/main.  The logs are owned by logacct.  The corresponding multilog(8)
       processes run under the uid and gid of logacct.  The name logacct must not contain any special characters.

SEE ALSO
       rbldns(8), rbldns-data(8) svscan(8), svc(8), multilog(8), axfrdns-conf(8), dnscache-conf(8), tinydns-conf(8), walldns-conf(8),  update-ser‐
       vice(8)

       http://cr.yp.to/djbdns.html

                                                                                                                                    rbldns-conf(8)
