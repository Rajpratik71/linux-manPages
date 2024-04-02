BRAA(1)                                                       General Commands Manual                                                      BRAA(1)

NAME
       braa - Mass SNMP scanner

SYNOPSIS
       braa [-2] [-v] [-t <s>] [-f <file>] [-a <time>] [-r <retries>] [-d <delay>] [querylist1] [querylist2] ...

DESCRIPTION
         Braa  is  a  mass  snmp scanner. The intended usage of such a tool is of course making SNMP queries - but unlike snmpget or snmpwalk from
       net-snmp, it is able to query dozens or hundreds of hosts simultaneously, and in a single process.   Thus,  it  consumes  very  few  system
       resources and does the scanning VERY fast.
         Braa implements its OWN snmp stack, so it does NOT need any SNMP libraries like net-snmp. The implementation is very dirty, supports only
       several data types, and in any case cannot be stated 'standard-conforming'! It was designed to be fast, and it is  fast.  For  this  reason
       (well,  and also because of my laziness ;), there is no ASN.1 parser in braa - you HAVE to know the numerical values of OID's (for instance
       .1.3.6.1.2.1.1.5.0 instead of system.sysName.0).

OPTIONS
       -h     Show help.

       -2     Claim to be a SNMP2C agent.

       -v     Show short summary after doing all queries.

       -x     Hexdump octet-strings

       -t <s> Wait <s> seconds for responses.

       -d <s> Wait <s> microseconds after sending each packet.

       -p <s> Wait <s> milliseconds between subsequent passes.

       -f <file>
              Load queries from file <file> (one by line).

       -a <time>
              Quit after <time> seconds, independent on what happens.

       -r <rc>
              Retry count (default: 3).

QUERY FORMATS
       GET: [community@]iprange[:port]:oid[/id]

       WALK: [community@]iprange[:port]:oid.*[/id]

       SET: [community@]iprange[:port]:oid=value[/id]

EXAMPLES
       $braa public@10.253.101.1:161:.1.3.6.*
              Walk the SNMP tree of host 10.253.101.1 with public string querying all OIDs under .1.3.6:

       $braa 10.253.101.1-10.253.101.254:.1.3.6.1.2.1.1.6.0
              Query the whole subnet 10.53.101/24 of for system.sysLocation.0

       $braa private@10.253.101.1:.1.3.6.1.2.1.1.6.0=sMy network
              Tries to set the value of system.sysLocation.0 to "My network" at host 10.253.101.1

                                                                                                                                           BRAA(1)
