SNMP-CHECK(1)                                                     SNMP Enumerator                                                    SNMP-CHECK(1)

NAME
       snmp-check - SNMP device enumerator

SYNOPSIS
       snmp-check [options] [target IP address]

OPTIONS
       -p, --port : SNMP port; default port is 161;
       -c, --community: SNMP community; default is public;
       -v, --version : SNMP version (1,2c); default is 1;
       -w, --write : detect write access (separate action by enumeration);
       -d, --disable_tcp : disable 'TCP connections' enumeration!
       -t, --timeout : timeout in seconds; default is 5;
       -r, --retries : request retries; default is 1;
       -i, --info : show script version;
       -h, --help : show help menu;

DESCRIPTION
       snmp-check  allows you to enumerate the SNMP devices and places the output in a very human readable friendly format. It could be useful for
       penetration testing or systems monitoring.

EXAMPLE
       Query private community string
              snmp-check -c private 192.168.1.1

       Query SNMPv2
              snmp-check -v 2c 192.168.1.1

       Query changing timeout
              snmp-check -t 40 -c private 192.168.1.1

SEE ALSO
       snmpcmd(1), snmpbulkwalk(1), snmpwalk(1), snmptest(1)

AUTHOR
       Matteo Cantoni

NOTES
       Homepage
       http://www.nothink.org/codes/snmpcheck/

COPYRIGHT
       Copyright (c) 2005-2015 by Matteo Cantoni
       Distributed under GPL license.
       http://www.gnu.org/licenses/

1.9                                                                July 22, 2016                                                     SNMP-CHECK(1)
