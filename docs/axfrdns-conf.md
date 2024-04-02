axfrdns-conf(8)                                               System Manager's Manual                                              axfrdns-conf(8)

NAME
       axfrdns-conf - sets up a DNS zone-transfer service.

SYNOPSIS
       axfrdns-conf acct logacct D tiny ip

DESCRIPTION
       axfrdns-conf  creates  a service directory D that runs axfrdns(8) under tcpserver(1).  The name D must start with a slash and must not con‐
       tain any special characters.  Normally D is /etc/axfrdns.

       You can run the service under svscan(8) by using the update-service(8) program on Debian GNU/Linux

       update-service --add D

       or by creating a symbolic link in the svscan(8) directory (normally /service or /etc/service), e.g.:

       ln -s D /service

       The service will start within five seconds, and will be restarted upon reboot.  You can use svc(8) to control the service.

       axfrdns-conf arranges for tcpserver(1) to listen for TCP connections on port 53 of ip.  It sets up D/tcp in tcprules(1) format  to  control
       access to axfrdns(8); initially all access is denied.  It also sets up D/Makefile to compile tcp into tcp.cdb for tcpserver(1).

       axfrdns-conf  arranges  for  axfrdns(8)  to  chroot to tiny/root and to run under the uid and gid of acct.  The name tiny must start with a
       slash and must not contain any special characters; normally it is /etc/tinydns.  The name acct must not contain any special characters.

       axfrdns-conf creates an automatically rotated log directory in D/log/main.  The logs are owned by logacct.  The  corresponding  multilog(8)
       processes run under the uid and gid of logacct.  The name logacct must not contain any special characters.

SEE ALSO
       axfrdns(8), svscan(8), svc(8), multilog(8), dnscache-conf(8), rbldns-conf(8), tinydns-conf(8), walldns-conf(8), update-service(8)

       http://cr.yp.to/djbdns.html

                                                                                                                                   axfrdns-conf(8)
