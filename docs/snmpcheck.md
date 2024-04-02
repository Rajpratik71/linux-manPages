snmpcheck(1)                                                         Net-SNMP                                                         snmpcheck(1)

NAME
       snmpcheck - check hosts SNMP access

SYNOPSIS
       snmpcheck [options] [[-a] HOSTS]...

DESCRIPTION
       snmpcheck is a program that checks the SNMP status of the specified hosts

OPTIONS
   Common Options
       -h     Display this message.

       -a     check error log file AND hosts specified on command line.

       -p     Don't try and ping-echo the host first

       -f     Only check for things I can fix

       HOSTS  check these hosts for problems.

   X Options:
       -x     forces ascii base if $DISPLAY set (instead of tk).

       -H     start in hidden mode.  (hides user interface)

       -V NUM sets the initial verbosity level of the command log (def: 1)

       -L     Show the log window at startup

       -d     Don't start by checking anything.  Just bring up the interface.

   Ascii Options:
       -n     Don't ever try and fix the problems found.  Just list.

       -y     Always fix problems found.

V5.7.3                                                              2018-03-30                                                        snmpcheck(1)
