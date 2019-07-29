IPTABLES-APPLY(8)                                                                              iptables 1.4.21                                                                              IPTABLES-APPLY(8)



NAME
       iptables-apply - a safer way to update iptables remotely

SYNOPSIS
       iptables-apply [-hV] [-t timeout] ruleset-file

DESCRIPTION
       iptables-apply  will  try  to  apply  a  new  ruleset (as output by iptables-save/read by iptables-restore) to iptables, then prompt the user whether the changes are okay. If the new ruleset cut the
       existing connection, the user will not be able to answer affirmatively. In this case, the script rolls back to the previous ruleset after the timeout expired. The timeout can be set with -t.

       When called as ip6tables-apply, the script will use ip6tables-save/-restore instead.

OPTIONS
       -t seconds, --timeout seconds
              Sets the timeout after which the script will roll back to the previous ruleset.

       -h, --help
              Display usage information.

       -V, --version
              Display version information.

SEE ALSO
       iptables-restore(8), iptables-save(8), iptables(8).

LEGALESE
       iptables-apply is copyright by Martin F. Krafft.

       This manual page was written by Martin F. Krafft <madduck@madduck.net>

       Permission is granted to copy, distribute and/or modify this document under the terms of the Artistic License 2.0.



iptables 1.4.21                                                                                                                                                                             IPTABLES-APPLY(8)
