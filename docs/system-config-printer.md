SYSTEM-CONFIG-PRIN(1)                                                                          Man pages                                                                         SYSTEM-CONFIG-PRIN(1)

NAME
       system-config-printer - configure a CUPS server

SYNOPSIS
       system-config-printer [[--show-jobs printer] | [--debug] | [--help]]

DESCRIPTION
       system-config-printer configures a CUPS server. It uses the CUPS API (bound to Python with pycups) to do this. The communication with the server is performed using IPP. As a result, it is
       equally able to configure a remote CUPS server as a local one.

OPTIONS
       --help
           Display a short usage message.

       --show-jobs printer
           Show the named print queue.

       --debug
           Enable debugging output.

AUTHOR
       Tim Waugh <twaugh@redhat.com>
           Author.

system-config-printer                                                                         25 Apr 2013                                                                        SYSTEM-CONFIG-PRIN(1)
