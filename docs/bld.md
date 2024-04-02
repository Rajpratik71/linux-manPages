BLD(8)                                                        System Manager's Manual                                                       BLD(8)

NAME
       bld - A black list daemon

SYNOPSIS
       bld -h | [option]

OPTIONS
       -v     Output version information and exit

       -n     Do not fork to become a daemon

       -a address
              Address to bind to

       -p port
              Port to listen to

       -l number
              Log verbosity (between 0 and 3)

       -t number
              Minimum time interval before blacklisting

       -m number
              Maximum submissions in time interval

       -i number
              IP list size

       -b number
              Blacklist size

       -e number
              Blacklist expiration

       -P filename
              Filename where to save PID

       -T number
              Timeout for client connections

       -u user
              User to run as

       -g group
              Group to run as

       -f filename
              Use a specific configuration file

       -A filename
              Filename where to find ACLs

       -W filename
              Filename where to find whitelist

       -B filename
              Filename where to store blacklist

       -I filename
              Filename where to store whole IP list

       DESCRIPTION

       By  default,  the  bld  daemon  listens to requests on port 2905.  Requests are either IP addresses submissions or checks against the black
       list.

       bld uses a very simple algorithm to decide whether to add IP addresses to the blacklist or not. The first time an IP address is  submitted,
       it  is  added  to  an internal list with a timestamp and all further requests increment a counter for this IP.  As soon as the minimum time
       interval is elapsed (default: 30 seconds), and if a maximum requests ratio is reached (default: 10 submissions in the 30 seconds interval),
       the IP is put in the blacklist.  It is then blacklisted for a configurable time (default: 900 seconds).

PROTOCOL
       Requests sent to bld are rather simple.  Each request or reply is followed by a linefeed and a carriage return.  A client may only send one
       request per TCP session.  As of now, two commands may be used: ip (address submission) and ip? (ask if address is blacklisted).

       ip=a.b.c.d submits an IP address.  The server acknowledges either with a 200 code if the address is not blacklisted or a 421 if it is.

       ipdecr=a.b.c.d decrements the internal counter for an IP address.  The lowest value for the counter is zero.  The  server  always  acknowl‐
       edges with a 200 code.

       ip?=a.b.c.d asks if address is blacklisted.  The server reply may be 421 if it is or 200 if it's not.

       ipbl=a.b.c.d forces the insertion in the blacklist.  The server acknowledges with a 200 code.

       If  using IP based restrictions, the server reply may be 600 if the client is not in the correct ACL to perform a request.  Any other error
       will generate a reply with a 500 error code.

NOTES
       bld binds to localhost by default and accepts any local request, so please make sure that only trusted users can establish a connection  to
       the  daemon.  Please check that all authorized hosts meet the minimal security requirements before changing this parameter even if using an
       access control list (see bld_acl.conf(5)).

       bld will log some statistics if it receives the SIGUSR1 signal.  SIGUSR2 is used to force a dump of both lists in bld working directory.

FILES
       /etc/bld/bld.conf      /etc/bld/bld_acl.conf      /etc/bld/bld_whitelist.conf       /var/run/bld/bld.pid       /var/run/bld/bld_iplist.dump
       /var/run/bld/bld_blacklist.dump

SEE ALSO
       bld.conf(5) bld_acl.conf(5) bld_whitelist.conf(5) bldread(8) bldquery(8) bldsubmit(8) blddecr(8)

AUTHOR
       Olivier Beyssac <obld@r14.freenix.org>

                                                                    August 2004                                                             BLD(8)
