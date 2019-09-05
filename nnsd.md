nnsd(1)                                                        Name service facility                                                       nnsd(1)

__________________________________________________________________________________________________________________________________________________

NAME
       nnsd - Name service facility, Commandline Server Application

SYNOPSIS
       nnsd ?-localonly flag? ?-port port?

__________________________________________________________________________________________________________________________________________________

DESCRIPTION
       Please read Name service facility, introduction first.

       The  application described by this document, nns, is a simple command line server for the nano name service facility provided by the Tcllib
       packages nameserv, and nameserv::server.  Beyond that the application's sources also serve as an example of how to use the  server  package
       nameserv::server.

       This name service facility has nothing to do with the Internet's Domain Name System, otherwise known as DNS. If the reader is looking for a
       package dealing with that please see either of the packages dns and resolv, both found in Tcllib too.

   USE CASES
       nnsd was written with the following main use case in mind.

       [1]    Run a nano name service on some host.

   COMMAND LINE
       nnsd ?-localonly flag? ?-port port?
              The command configures a server per the specified options and starts it. The command will not exit on its, as it keeps the name ser‐
              vice database wholly in memory. The user has to kill it explicitly, eithre by sending a a signal, or through the job-control facili‐
              ties of the shell in use.

              The options to configure the name service are explained in section OPTIONS.

   OPTIONS
       This section describes all the options available to the user of the application

       -localonly bool
              If this option is not specified it defaults to true, i.e.  acceptance of only local connections. The server will accept remote  con‐
              nections, i.e. connections from other hosts, if and only if this option is configured to false.

       -port number
              If this option is not specified it defaults to 38573. It specifies the TCP port the server has to listen on for requests.

BUGS, IDEAS, FEEDBACK
       This document, and the package it describes, will undoubtedly contain bugs and other problems.  Please report such in the category nameserv
       of the Tcllib Trackers [http://core.tcl.tk/tcllib/reportlist].  Please also report any ideas for enhancements you may have for either pack‐
       age and/or documentation.

SEE ALSO
       nameserv::common(3tcl), nameserv::server(3tcl)

KEYWORDS
       application, name service, server

CATEGORY
       Networking

COPYRIGHT
       Copyright (c) 2007-2008 Andreas Kupries <andreas_kupries@users.sourceforge.net>

tcllib                                                                 1.0.1                                                               nnsd(1)
