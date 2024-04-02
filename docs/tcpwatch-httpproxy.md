TCPWATCH-HTTPPROXY(1)                                         General Commands Manual                                        TCPWATCH-HTTPPROXY(1)

NAME
       tcpwatch-httpproxy - program to record your HTTP request

SYNOPSIS
       tcpwatch-httpproxy [-Llisten_port:dest_port] [-Llisten_port:dest_hostname:dest_port] [-Llisten_port:listen_host:dest_hostname:dest_port]

DESCRIPTION
       This manual page documents briefly the tcpwatch-httpproxy command.

       tcpwatch-httpproxy is a program that allows you to record HTTP request for later replay

OPTIONS
       --help show a summary about options and commands

       -L     set up a proxy process that you can attach your browser to. See above for arguments.

       -v, --version
              Show version of program.

SEE ALSO
       funkload(1),

AUTHOR
       tcpwatch-httpproxy was written by Shane Hathaway, but under the name 'tcpwatch'.

       This manual page was written by Toni Mueller <toni@debian.org>, for the Debian project (but may be used by others).

                                                                 December 22, 2007                                           TCPWATCH-HTTPPROXY(1)
