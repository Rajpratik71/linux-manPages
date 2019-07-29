IPTABLES-APPLY(8)                                                 iptables 1.6.0                                                 IPTABLES-APPLY(8)

NAME
       iptables-apply - a safer way to update iptables remotely

SYNOPSIS
       iptables-apply [-hV] [-t timeout] [-w savefile] {[rulesfile]|-c [runcmd]}

DESCRIPTION
       iptables-apply  will  try  to  apply  a  new rulesfile (as output by iptables-save, read by iptables-restore) or run a command to configure
       iptables and then prompt the user whether the changes are okay. If the new iptables rules cut the existing connection, the user will not be
       able to answer affirmatively. In this case, the script rolls back to the previous working iptables rules after the timeout expires.

       Successfully applied rules can also be written to savefile and later used to roll back to this state. This can be used to implement a store
       last good configuration mechanism when experimenting with an iptables setup script:  iptables-apply  -w  /etc/network/iptables.up.rules  -c
       /etc/network/iptables.up.run

       When called as ip6tables-apply, the script will use ip6tables-save/-restore and IPv6 default values instead. Default value for rulesfile is
       '/etc/network/iptables.up.rules'.

OPTIONS
       -t seconds, --timeout seconds
              Sets the timeout in seconds after which the script will roll back to the previous ruleset (default: 10).

       -w savefile, --write savefile
              Specify  the  savefile  where  successfully  applied  rules  will   be   written   to   (default   if   empty   string   is   given:
              /etc/network/iptables.up.rules).

       -c runcmd, --command runcmd
              Run command runcmd to configure iptables instead of applying a rulesfile (default: /etc/network/iptables.up.run).

       -h, --help
              Display usage information.

       -V, --version
              Display version information.

SEE ALSO
       iptables-restore(8), iptables-save(8), iptables(8).

LEGALESE
       Original  iptables-apply  -  Copyright  2006 Martin F. Krafft <madduck@madduck.net>.  Version 1.1 - Copyright 2010 GW <gw.2010@tnode.com or
       http://gw.tnode.com/>.

       This manual page was written by Martin F. Krafft <madduck@madduck.net> and extended by GW <gw.2010@tnode.com or http://gw.tnode.com/>.

       Permission is granted to copy, distribute and/or modify this document under the terms of the Artistic License 2.0.

iptables 1.6.0                                                                                                                   IPTABLES-APPLY(8)
