
iscsi_discovery(8)                                                                         System Manager's Manual                                                                         iscsi_discovery(8)



NAME
       iscsi_discovery - discover iSCSI targets

SYNOPSIS
       iscsi_discovery <IP> [-p <port>] [-d] [ -t <tcp|iser> [-f] ] [-m] [-l]


DESCRIPTION
       Perform  send-targets discovery to the specified IP. If a discovery record is generated, try to login to the portal using the preferred transport (-t flag specifies the requested transport type, TCP
       is the default).  If login using a certain transport succeeds, mark the portal for automatic login (unless -m flag is used), and disconnect (unless -l flag is used).

       For iSCSI discovery to work, open-iscsi services must be running. i.e. iscsid should be up, and the iSCSI modules loaded. This is best accomplished by the init.d startup script.


       [-p=]port-number
              set the port number (default is 3260).

       [-d]   print debugging information.

       [-t=]transport-type
              set transport (default is tcp).

       [-f]   force specific transport - disable the fallback to tcp (default is fallback enabled).  force the transport specified by the argument of the -t flag.


       [-m]   manual startup - will set manual startup (default is automatic startup).

       [-l]   login - login to the new discovered nodes (default is false).


AUTHOR
       Written by Dan Bar Dov

REPORTING BUGS
       Report bugs to <erezzi.list@gmail.com>.

COPYRIGHT
       Copyright © Voltaire Ltd. 2006.



                                                                                                                                                                                           iscsi_discovery(8)
