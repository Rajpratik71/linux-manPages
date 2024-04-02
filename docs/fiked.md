FIKED(1)                                                      General Commands Manual                                                     FIKED(1)

NAME
       fiked - a fake IKE PSK+XAUTH daemon based on vpnc

SYNOPSIS
       fiked [-rdqhV] -g gateway -k id:secret [-u user] [-l file] [-L file]

DESCRIPTION
       Fiked impersonates a VPN gateway's IKE responder in order to capture XAUTH login credentials in insecure PSK+XAUTH setups, such as commonly
       found in Cisco based VPN sites.

       Fiked supports IKEv1 in aggressive mode, using pre-shared keys and XAUTH.  Supported algorithms are DES, 3DES, AES-128,  AES-192,  AES-256;
       MD5, SHA1; and DH groups 1, 2 and 5.  IKE main mode is not supported.

       To  actually  implement  an  attack  against a VPN site, you have to intercept the IKE traffic to the VPN gateway and redirect it to fiked.
       Your options include hostap or ARP poisoning, and usually will require some (eg.)  pf(4) redirection magic, depending on the situation.

       Opening a socket on 500/udp requires root privileges on most systems.

OPTIONS
       -d     Detach from TTY and run as a daemon.

       -g     Impersonate gateway.  This IP address is used in the responder ID payload, and as a source address if -r is used.

       -h     Display help and exit.

       -k     Use secret with key/group id id as pre-shared key in phase 1 authentication.  This option may be  used  multiple  times,  each  time
              specifying  a  different id, secret pair.  Fiked will use the key id specified by a client to choose a matching secret, or the first
              one if none matches.
              Note that specifying secret's on the command line exposes them to other users on the system.

       -u     Drop privileges after opening sockets and files by setting the real, effective and stored user IDs to user and loading the appropri‐
              ate  primary  and  anxillary groups.  This potentially reduces the impact of security vulnerabilities in fiked, because the ISAKMP /
              IKE handling code, which is most likely to be vulnerable, will not be running with super user privileges.
              If -u is not given, fiked will drop privileges only if the real user ID is different from the effective user ID (i.e. when installed
              set-user-ID  root  and run as a non-root user), in which case the real user ID will be the new effective and stored user ID, and the
              group list will be left untouched.

       -l     Append captured XAUTH user credentials to file using a grep friendly format, including the secret, group id, and gateway address.

       -L     Append verbous logging to file instead of just standard output.  If -q is also given, log to file only.

       -q     Be quiet and do not log to standard output.

       -r     Forge the source address on sent packets to match gateway.  This uses a raw socket to send the packets.  Use  this  option  if  your
              particular attack setup does not rewrite the packets travelling from fiked back to clients.
              Note  that  using  -r  prevents dropping privileges if fiked is installed set-user-ID root, since libnet requires root privileges to
              send packets through a raw socket.
              This option is not available if fiked was built without libnet support.

       -V     Display version information and exit.

EXAMPLES
       To impersonate gateway 10.0.0.1 using secrets for group ids group1 and group2, writing results to file account.log:
              fiked -g 10.0.0.1 -k group1:g3h31m -k group2:s3kr3t -l account.log

       The same with only one key, and running as a daemon logging to file fiked.log:
              fiked -g 10.0.0.1 -k group1:g3h31m -l account.log -d -L fiked.log

SEE ALSO
       arpspoof(8), ath(4), wi(4), pf(4), iptables(8), vpnc(8)

AUTHORS
       Fiked was written by Daniel Roethlisberger <daniel@roe.ch>, based in part on vpnc by Maurice Massar, Geoffrey Keating and contributors.

BUGS
       IKE protocol compliance is just good enough to attack Cisco VPN clients and clones like vpnc, but nowhere near complete, secure,  or  error
       free.

       Main mode is not supported.

       Only a single gateway address can be specified.

       Secrets can only be specified as command line arguments, which potentially exposes them to other users on the system, especially on systems
       which do not have setproctitle(3), such as Linux.

                                                                   4 August 2009                                                          FIKED(1)
