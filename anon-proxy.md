MIX(8)                                                        System Manager's Manual                                                       MIX(8)

NAME
       mix - starts the proxyserver of the an.on anonymizing proxy project.

SYNOPSIS
       mix [-j] [OPTIONS...]

DESCRIPTION
       This manual page documents briefly the mix command.

       This manual page was written for the Debian distribution because the original program does not have a manual page.

       ix  is  the a proxyserver which sends your httprequest through a chain of anonymizing proxyservers to anonymize it. Even for the JAP-Admins
       it is impossible to allocate the request to your IP-Address.

OPTIONS
       This program follows the usual GNU command line syntax, with long options starting with two dashes (`-').  A summary of options is included
       below.  For a complete description, see the Info files.

       -a           --autoreconnect
                 auto reconnects if connection to first mix was lost

       -d           --daemon
                 start as daemon.

       -j           --localproxy
                 act as local proxy (mandatory)

       -l           --logdir=<dir>
                 directory where log files go to

       -n           --next=<ip:port>
                 first mix of cascade

       -p           --port=<[host:]port|path>
                 listening on [host:]port|path

       -s           --socksport=<portnumber>
                 listening port for socks

       -v           --version
                 effective user

       -?           --help
                 Show help message

       --usage   Display brief usage message

SEE ALSO
       The JAP anonymizing Proxy-system is documented on http://anon.inf.tu-dresden.de/.

AUTHOR
       This  manual  page was written by David Spreen netzwurm@debian.org for the Debian system (but may be used by others).  This manual was pub‐
       lished as free software; you can redistribute it and/or modify it under the terms of the GNU General Public License  as  published  by  the
       Free Software Foundation; either version 2 of the License, or any later version.

                                                                                                                                            MIX(8)
