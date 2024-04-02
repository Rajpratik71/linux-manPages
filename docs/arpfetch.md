ARPFETCH(8)                                                   System Manager's Manual                                                  ARPFETCH(8)

NAME
       arpfetch - obtain ethernet/ip address pairings via snmp

SYNOPSIS
       arpfetch host cname

DESCRIPTION
       arpfetch gets pairings between ip addresses and the ethernet address of the corresponding network card. These pairings are retrieved from
       other network entities, like routers, by the SNMP protocol using snmpwalk(1).  Mostly, this program is an agent that is used to get data
       for arpsnmp(8).  This fetching of address mappings can be further automated by use of bihourly(8).

       Both command arguments must be present for proper operation.  The host argument is the hostname of the network entity being queried and the
       cname argument is the SNMP community name of the network entity.

       The information is presented on stdout in a format compatible with arpsnmp(8) and arpwatch(8).

       Further information about SNMP can be found in snmpcmd(1) and variables(5).

SEE ALSO
       arpsnmp(8), arpwatch(8), bihourly(8), snmpwalk(1), snmpcmd(1), variables(5)

BUGS
       Please send bug reports to arpwatch@ee.lbl.gov.

AUTHORS
       Craig Leres of the Lawrence Berkeley National Laboratory Network Research Group, University of California, Berkeley, CA.

       The current version is available via anonymous ftp:

              ftp://ftp.ee.lbl.gov/arpwatch.tar.gz

       This manual page was contributed by Hugo Graumann.

                                                                                                                                       ARPFETCH(8)
