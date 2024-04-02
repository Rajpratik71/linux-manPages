SNMPPS(1)                                                            Net-SNMP                                                            SNMPPS(1)

NAME
       snmpps - display process table on a network entity via SNMP

SYNOPSIS
       snmpps [COMMON OPTIONS] [-Cp] [-Ca] [-C n | m | t ] AGENT

       snmptop [COMMON OPTIONS] [-Cp] [-Ca] [-C n | m | t ] AGENT

DESCRIPTION
       snmpps  is  a networked version of a simple ps command. It checks the processes on the remote machine by examining the HOST-RESOURCES-MIB's
       hrSWRunTable and the hrSWRunPerfTable.

       AGENT identifies a target SNMP agent, which is instrumented to monitor the given objects.  At its simplest, the  AGENT  specification  will
       consist of a hostname or an IPv4 address.  In this situation, the command will attempt communication with the agent, using UDP/IPv4 to port
       161 of the given target host. See the snmpcmd(1) manual page for a full list of the possible formats for AGENT.

       snmptop emulates the top command using SNMP. While running, the keyboard inputs of 'c', 'n', 'm', 't' switches sorting  between  cpu,  pid,
       memory,  or total runtime.  Typing 'i' toggles hiding idle processes, while 'o' toggles hiding Os processes.  Typing 'a' toggles display of
       hrSWRunParameters, 'p' toggles display of hrSWRunPath.

OPTIONS
       COMMON OPTIONS
               Please see snmpcmd(1) for a list of possible values for COMMON OPTIONS as well as their descriptions.

       -Cp     Show hrSWRunPath in addition to hrSWRunName

       -Ca     Show hrSWRunParameters in addition to hrSWRunName

       -Ct     Sort display by total CPU usage

       -Cm     Sort display by memory usage

       -Cn     Sort display numeric by PID

EXAMPLES
       % snmpps -v 2c -c public localhost

       Index Type Status     Memory         CPU Command
           1 Appl   Wait     1.00MB        1.29 init
         554 Appl   Wait   364.00kB        0.03 udevd
        1813 Appl    Run     6.73MB        0.41 snmpd
        1833 Appl   Wait     1.27MB        3.49 rsyslogd
        1871 Appl   Wait   496.00kB       47.92 irqbalance
        1890 Appl   Wait   648.00kB        0.62 rpcbind
        2121 Appl   Wait     1.89MB        0.00 bash
        2150 Appl   Wait     3.49MB        0.16 vim
        2185 Appl   Wait   556.00kB        0.00 sleep

SEE ALSO
       snmpcmd(1), snmp.conf(5)

V5.8                                                                04 Nov 2013                                                          SNMPPS(1)
