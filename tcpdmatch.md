TCPDMATCH(8)                                                                             System Manager's Manual                                                                             TCPDMATCH(8)

NAME
       tcpdmatch - tcp wrapper oracle

SYNOPSIS
       tcpdmatch [-d] [-i inet_conf] daemon client

       tcpdmatch [-d] [-i inet_conf] daemon[@server] [user@]client

DESCRIPTION
       tcpdmatch predicts how the tcp wrapper would handle a specific request for service.  Examples are given below.

       The  program examines the tcpd access control tables (default /etc/hosts.allow and /etc/hosts.deny) and prints its conclusion.  For maximal accuracy, it extracts additional information from your
       inetd network configuration file.

       When tcpdmatch finds a match in the access control tables, it identifies the matched rule. In addition, it displays the optional shell commands or options in a pretty-printed format; this  makes
       it easier for you to spot any discrepancies between what you want and what the program understands.

ARGUMENTS
       The following two arguments are always required:

       daemon A daemon process name. Typically, the last component of a daemon executable pathname.

       client A host name or network address, or one of the `unknown´ or `paranoid´ wildcard patterns.

              When a client host name is specified, tcpdmatch gives a prediction for each address listed for that client.

              When a client address is specified, tcpdmatch predicts what tcpd would do when client name lookup fails.

       Optional information specified with the daemon@server form:

       server A host name or network address, or one of the `unknown´ or `paranoid´ wildcard patterns. The default server name is `unknown´.

       Optional information specified with the user@client form:

       user   A client user identifier. Typically, a login name or a numeric userid.  The default user name is `unknown´.

OPTIONS
       -d     Examine hosts.allow and hosts.deny files in the current directory instead of the default ones.

       -i inet_conf
              Specify this option when tcpdmatch is unable to find your inetd.conf network configuration file, or when you suspect that the program uses the wrong one.

EXAMPLES
       To predict how tcpd would handle a telnet request from the local system:

            tcpdmatch in.telnetd localhost

       The same request, pretending that hostname lookup failed:

            tcpdmatch in.telnetd 127.0.0.1

       To predict what tcpd would do when the client name does not match the client address:

            tcpdmatch in.telnetd paranoid

       On some systems, daemon names have no `in.´ prefix, or tcpdmatch may need some help to locate the inetd configuration file.

FILES
       The default locations of the tcpd access control tables are:

       /etc/hosts.allow
       /etc/hosts.deny

SEE ALSO
       tcpdchk(8), tcpd configuration checker
       hosts_access(5), format of the tcpd access control tables.
       hosts_options(5), format of the language extensions.
       inetd.conf(5), format of the inetd control file.

AUTHORS
       Wietse Venema (wietse@wzv.win.tue.nl),
       Department of Mathematics and Computing Science,
       Eindhoven University of Technology
       Den Dolech 2, P.O. Box 513,
       5600 MB Eindhoven, The Netherlands

                                                                                                                                                                                             TCPDMATCH(8)
