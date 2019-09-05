dnscache-conf(8)                                              System Manager's Manual                                             dnscache-conf(8)

NAME
       dnscache-conf - sets up a DNS cache service.

SYNOPSIS
       dnscache-conf acct logacct D [ ip ]

DESCRIPTION
       This is a reference page.  For tutorial information, see the instructions for
       workstations (http://cr.yp.to/djbdns/run-cache.html),
       home computers (http://cr.yp.to/djbdns/run-cache-home.html),
       external caches (http://cr.yp.to/djbdns/run-cache-x.html), or
       upgrading from BIND (http://cr.yp.to/djbdns/run-cache-bind-1.html).

       dnscache-conf  creates  a  service  directory D that runs dnscache(8).  The name D must start with a slash and must not contain any special
       characters.  Normally D is /etc/dnscache.

       You can run the service under svscan(8) by using the update-service(8) program on Debian GNU/Linux

       update-service --add D

       or by creating a symbolic link in the svscan(8) directory (normally /service or /etc/service), e.g.:

       ln -s D /service

       The service will start within five seconds, and will be restarted upon reboot.  You can use svc(8) to control the service.

       dnscache-conf arranges for dnscache(8) to chroot to D/root and to run under the uid and gid of acct.  The name acct must  not  contain  any
       special characters.

       dnscache-conf arranges for dnscache(8) to listen for UDP packets and TCP connections on port 53 of ip.

       ip is optional; if it is not supplied, dnscache-conf arranges for dnscache(8) to listen on 127.0.0.1.

       dnscache-conf creates D/root/ip/127.0.0.1 so that dnscache(8) will accept queries from 127.0.0.1.

       dnscache-conf puts 128 bytes of not-particularly-secret data into D/seed and arranges for dnscache(8) to pass D/seed to dns_random_init(3).
       If your system has a good source of random data, you can replace D/seed with 128 bytes of data from that source.

       dnscache-conf creates an automatically rotated log directory in D/log/main.  The logs are owned by logacct.  The corresponding  multilog(8)
       processes run under the uid and gid of logacct.  The name logacct must not contain any special characters.

SEE ALSO
       dnscache(8), svscan(8), svc(8), multilog(8), axfrdns-conf(8), rbldns-conf(8), tinydns-conf(8), walldns-conf(8), update-service(8)

       http://cr.yp.to/djbdns.html

                                                                                                                                  dnscache-conf(8)
