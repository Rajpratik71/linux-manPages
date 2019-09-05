SC_IPIDDUMP(1)                                              BSD General Commands Manual                                             SC_IPIDDUMP(1)

NAME
     sc_ipiddump — utility to dump IP-ID values embedded in ping, traceroute, and dealias objects in warts files.

SYNOPSIS
     sc_ipiddump [-i ips] [-O options] [-U userid] [file ...]

DESCRIPTION
     The sc_ipiddump utility dumps the IP-ID values embedded in IPv4 and IPv6 responses to ping, traceroute, and dealias objects.  The output con‐
     tains the transit and receive timestamps, the source address used by scamper when probing, the interface address which replied, and the IPID
     value (in hexadecimal).  The objects are sorted by transmit time.  The supported options to sc_ipiddump are as follows:

     -i ip   restricts the selection of source addresses to those with the given IP address(es).

     -O options
             allows the behavior of sc_ipiddump to be further tailored.  The current choice for this option is:
               -  notrace: do not parse traceroutes for IPID values.

     -U userid
             restricts the selection of warts objects to those with the given userid(s).

EXAMPLES
     Given an input file foo.warts, the following command dumps IP-ID values found in objects with userid values 3 and 4:

           sc_ipiddump -U 3,4 foo.warts

     Given an input file foo.warts.gz, the following command dumps IP-ID values found in responses from IP address 192.0.2.1

           zcat foo.warts.gz | sc_ipiddump -i 192.0.2.1 -

SEE ALSO
     scamper(1), sc_wartsdump(1), sc_warts2text(1), sc_warts2json(1)

AUTHORS
     sc_ipiddump was written by Matthew Luckie <mjl@luckie.org.nz>.

BSD                                                              October 21, 2015                                                              BSD
