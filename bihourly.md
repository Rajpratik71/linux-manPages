BIHOURLY(8)                                                   System Manager's Manual                                                  BIHOURLY(8)

NAME
       bihourly - track ethernet/ip address pairs

SYNOPSIS
       bihourly

DESCRIPTION
       bihourly is a script that automates the operation of arpsnmp(8) by executing arpfetch(8) on a series of hostnames and then sending the
       results to arpsnmp(8) for analysis.

       The result is a report of the current pairings between ip addresses and the corresponding ethernet address of the network hardware as
       reported by snmpwalk(8).  Activity is logged and noted changes are reported by email.

       In its working directory bihourly expects a file named list which contains a space separated list of hostnames to be queried and a file
       named cname which holds the SNMP community name by which to query these hosts.

       Contrary to the name, bihourly does not run twice every hour. It runs once each time it is invoked. For repeated operation bihourly must be
       invoked on a periodic basis by a program like cron(1).

FILES
       /var/lib/arpwatch - default working directory
       list - file containing names of hosts to query
       cname - file containing the SNMP community name by which to query

SEE ALSO
       arpsnmp(8), arpfetch(8), snmpwalk(8), cron(8)

BUGS
       Please send bug reports to arpwatch@ee.lbl.gov.

AUTHORS
       Craig Leres of the Lawrence Berkeley National Laboratory Network Research Group, University of California, Berkeley, CA.

       The current version is available via anonymous ftp:

              ftp://ftp.ee.lbl.gov/arpwatch.tar.gz

       This manual page was contributed by Hugo Graumann.

                                                                                                                                       BIHOURLY(8)
