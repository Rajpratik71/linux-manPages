SNMPPING(1)                                                   General Commands Manual                                                  SNMPPING(1)

NAME
       snmpping - command an agent to ping a remote host

SYNOPSIS
       snmpget [COMMON OPTIONS] AGENT DESTINATION

DESCRIPTION
       snmping is an SNMP application that uses the DISMAN-PING-MIB to perform remote pings from the specified AGENT to the remote DESTINATION.

       The local host will send SNMPSET commands to the AGENT which, if accepted will then ping the DESTINATION.

       snmpping will then poll the AGENT to obtain the ping results.

OPTIONS
       -Ccpings
              The AGENT will send pings pings to the DESTINATION.

       -Cssize
              The AGENT will send pings that are size bytes.

       In addition to these options, snmpping takes the common options described in the snmpcmd(1) manual page.  Note that snmpping

EXAMPLES
       The command:

           snmpping -c private zeus hera

       will get host zeus to ping host hera. Host zeus would need to have private as a read-write community.

SEE ALSO
       snmpcmd(1),variables(5).

Net-SNMP                                                            2019-08-29                                                         SNMPPING(1)
