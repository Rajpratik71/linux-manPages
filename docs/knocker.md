KNOCKER(1)                                                    General Commands Manual                                                   KNOCKER(1)

NAME
       knocker - An easy to use network security port scanner

SYNOPSIS
       knocker --host <host> [OPTION]

DESCRIPTION
       knocker  is  a  simple  and easy to use TCP security port scanner written in C using pthreads which is able to analyze hosts and all of the
       different services started on them.

OPTIONS
       -H, --host
              host name or numeric Internet address to scan

       -P, --port
              port number to scan (single port scan only)

       -SP, --start-port
              port number to begin the scan from

       -EP, --end-port
              port number to end the scan at

       --last-host
              uses the last scanned host as target

       --last-scan
              performs again the last port scan

       -q, --quiet
              disable console output and logs to file.

       -lf, --logfile <logfile>
              log the results to a specified file.

       -nf, --no-fency
              disable fency output

       -nc, --no-colors
              disable colored output

       --configure
              let the user configure knocker

       -h, --help
              display this help and exit

       -v, --version
              output version information and exit

EXAMPLES
       To run this program the standard way type:

       knocker --host 192.168.0.1

       If you want to specify a port range to scan:

       knocker --host thehost  --start-port 1 --end-port 2600

       or

       knocker -H thehost  -SP 1 -EP 2600

       To scan a single port:

       knocker -H thehost --port 21

       To run this program not using colors (if your terminal does not support colors):

       knocker --host 192.168.0.1 --no-colors

       To run this program run in background and have the results written in a log file:

       knocker --host 192.168.0.1 --quiet &

AVAILABILTY
       The latest version of this program can be found at http://knocker.sourceforge.net

BUGS
       See the BUGS file in the knocker source package for a list of known bugs.  Report bugs to <g.gabriele79@genie.it>

AUTHOR
       knocker is written by Gabriele Giorgetti <g.gabriele79@genie.it>

COPYRIGHT
       Copyright © 2001,2002 Gabriele Giorgetti
       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU‐
       LAR PURPOSE.

                                                                   MAY 24, 2002                                                         KNOCKER(1)
