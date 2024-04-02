nnslog(1)                                                      Name service facility                                                     nnslog(1)

__________________________________________________________________________________________________________________________________________________

NAME
       nnslog - Name service facility, Commandline Logging Client Application

SYNOPSIS
       nnslog ?-host host? ?-port port?

__________________________________________________________________________________________________________________________________________________

DESCRIPTION
       Please read Name service facility, introduction first.

       The  application  described  by  this  document, nnslog, is a simple command line client for the nano name service facility provided by the
       Tcllib packages nameserv, and nameserv::server.

       It essentially implements "nns search -continuous *", but uses a different output formatting. Instead of continuously showing  the  current
       contents of the server in the terminal it simply logs all received add/remove events to stdout.

       This name service facility has nothing to do with the Internet's Domain Name System, otherwise known as DNS. If the reader is looking for a
       package dealing with that please see either of the packages dns and resolv, both found in Tcllib too.

   USE CASES
       nnslog was written with the following main use case in mind.

       [1]    Monitoring the name service for all changes and logging them in a text terminal.

   COMMAND LINE
       nnslog ?-host host? ?-port port?
              The command connects to the specified name service, sets up a search for all changes and then prints all received events to  stdout,
              with  each  events on its own line. The command will not exit until it is explicitly terminated by the user. It will especially sur‐
              vive the loss of the connection to the name service and reestablish the search and log when the connection is restored.

              The options to specify the name service will be explained later, in section OPTIONS.

   OPTIONS
       This section describes all the options available to the user of the application

       -host name|ipaddress
              If this option is not specified it defaults to localhost. It specifies the name or ip-address of the host the name service  to  talk
              to is running on.

       -port number
              If  this  option  is  not  specified it defaults to 38573. It specifies the TCP port the name service to talk to is listening on for
              requests.

BUGS, IDEAS, FEEDBACK
       This document, and the package it describes, will undoubtedly contain bugs and other problems.  Please report such in the category nameserv
       of the Tcllib Trackers [http://core.tcl.tk/tcllib/reportlist].  Please also report any ideas for enhancements you may have for either pack‐
       age and/or documentation.

SEE ALSO
       nameserv(3tcl), nameserv::common(3tcl)

KEYWORDS
       application, client, name service

CATEGORY
       Networking

COPYRIGHT
       Copyright (c) 2008 Andreas Kupries <andreas_kupries@users.sourceforge.net>

tcllib                                                                  1.0                                                              nnslog(1)
