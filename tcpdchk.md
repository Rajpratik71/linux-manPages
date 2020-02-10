TCPDCHK(8)                                                                               System Manager's Manual                                                                               TCPDCHK(8)

NAME
       tcpdchk - tcp wrapper configuration checker

SYNOPSIS
       tcpdchk [-a] [-d] [-i inet_conf] [-v]

DESCRIPTION
       tcpdchk  examines  your  tcp  wrapper  configuration  and  reports  all  potential  and  real  problems  it  can  find.  The program examines the tcpd access control files (by default, these are
       /etc/hosts.allow and /etc/hosts.deny), and compares the entries in these files against entries in the inetd network configuration file.

       tcpdchk reports problems such as non-existent pathnames; services that appear in tcpd access control rules, but are not controlled by tcpd; services that should not be wrapped; non-existent host
       names  or non-internet address forms; occurrences of host aliases instead of official host names; hosts with a name/address conflict; inappropriate use of wildcard patterns; inappropriate use of
       NIS netgroups or references to non-existent NIS netgroups; references to non-existent options; invalid arguments to options; and so on.

       Where possible, tcpdchk provides a helpful suggestion to fix the problem.

OPTIONS
       -a     Report access control rules that permit access without an explicit ALLOW keyword.

       -d     Examine hosts.allow and hosts.deny files in the current directory instead of the default ones.

       -i inet_conf
              Specify this option when tcpdchk is unable to find your inetd.conf network configuration file, or when you suspect that the program uses the wrong one.

       -v     Display the contents of each access control rule.  Daemon lists, client lists, shell commands and options are shown in a pretty-printed format; this makes it easier for you  to  spot  any
              discrepancies between what you want and what the program understands.

FILES
       The default locations of the tcpd access control tables are:

       /etc/hosts.allow
       /etc/hosts.deny

SEE ALSO
       tcpdmatch(8), explain what tcpd would do in specific cases.
       hosts_access(5), format of the tcpd access control tables.
       hosts_options(5), format of the language extensions.
       inetd.conf(5), format of the inetd control file.

AUTHORS
       Wietse Venema (wietse@wzv.win.tue.nl),
       Department of Mathematics and Computing Science,
       Eindhoven University of Technology
       Den Dolech 2, P.O. Box 513,
       5600 MB Eindhoven, The Netherlands

                                                                                                                                                                                               TCPDCHK(8)
