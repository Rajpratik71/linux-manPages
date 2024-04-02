walldns-conf(8)                                               System Manager's Manual                                              walldns-conf(8)

NAME
       walldns-conf - sets up a DNS wall service.

SYNOPSIS
       walldns-conf acct logacct D ip

DESCRIPTION
       walldns-conf creates a service directory D that runs walldns(8).  The name D must start with a slash and must not contain any special char‐
       acters.  Normally D is /etc/walldns.

       You can run the service under svscan(8) by using the update-service(8) program on Debian GNU/Linux

       update-service --add D

       or by creating a symbolic link in the svscan(8) directory (normally /service or /etc/service), e.g.:

       ln -s D /service

       The service will start within five seconds, and will be restarted upon reboot.  You can use svc(8) to control the service.

       walldns-conf arranges for walldns to chroot to D/root and to run under the uid and gid of acct.  The name acct must not contain any special
       characters.

       walldns-conf arranges for walldns(8) to listen for UDP packets on port 53 of ip, and to send outgoing packets from ip.

       walldns-conf  creates  an automatically rotated log directory in D/log/main.  The logs are owned by logacct.  The corresponding multilog(8)
       processes run under the uid and gid of logacct.  The name logacct must not contain any special characters.

SEE ALSO
       walldns(8), svscan(8), svc(8), multilog(8), axfrdns-conf(8), rbldns-conf(8), tinydns-conf(8), dnscache-conf(8), update-service(8)

       http://cr.yp.to/djbdns.html

                                                                                                                                   walldns-conf(8)
