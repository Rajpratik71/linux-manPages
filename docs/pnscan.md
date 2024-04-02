PNSCAN(1)                                                                                                                                PNSCAN(1)

NAME
       pnscan - multi threaded port scanning tool

SYNOPSIS
       pnscan [ options]  [ <CIDR | host-range> <port-range>]

       pnscan [ options]  [ <port>]

DESCRIPTION
       This manual page documents briefly the pnscan command.

       pnscan is a tool that can be used to survey TCP network services.

       When  used with two command line arguments it will scan the indicated network/hosts and ports. When used without arguments or just one then
       it will read hostname/IP addresses from stdin and probe those. The single port/service argument is used as a default if no  port  is  indi‐
       cated on stdin

       For example, it can be used to survey the installed versions of SSH, FTP, SMTP, Web, IDENT and possibly other services.

       This   program   implements   a   multithreaded   TCP   port   scanner.    More   information   and   new   relaseses   may  be  found  at:
       http://www.lysator.liu.se/~pen/pnscan

OPTIONS
       -h     Show summary of options.

       -v     Be verbose.

       -V     Print version.

       -d     Print debugginf info.

       -s     Lookup and print hostnames.

       -S     Enable shutdown mode.

       -l     Line oriented output.

       -w<string>
              Request string to send.

       -r<string>
              Response string to look for.

       -W<hex list>
              Hex coded request string to send.

       -R<hex list>
              Hex coded response string to look for.

       -L<length>
              Max bytes of response to print.

       -t<msecs>
              Connect/Write/Read timeout.

       -n<workers>
              Concurrent worker threads.

SEE ALSO
       nmap (1) and ipsort (1).

AUTHOR
       pnscan was written by Peter Eriksson <pen@lysator.liu.se>.

       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.1 or
       any later version published by the Free Software Foundation; with no Invariant Sections, no Front-Cover Texts and no Back-Cover Texts.

                                                                   25 March 2002                                                         PNSCAN(1)
