RWHO(1)                                                     BSD General Commands Manual                                                    RWHO(1)

NAME
     rwho — who is logged in on local machines

SYNOPSIS
     rwho [-a]

DESCRIPTION
     The rwho command produces output similar to who, but for all machines on the local network.  If no report has been received from a machine
     for 11 minutes then rwho assumes the machine is down, and does not report users last known to be logged into that machine.

     If a users hasn't typed to the system for a minute or more, then rwho reports this idle time.  If a user hasn't typed to the system for an
     hour or more, then the user will be omitted from the output of rwho unless the -a flag is given.

FILES
     /var/spool/rwho/whod.*   information about other machines

SEE ALSO
     finger(1), rup(1), ruptime(1), rusers(1), who(1), rwhod(8)

HISTORY
     The rwho command appeared in 4.3BSD.

BUGS
     This is unwieldy when the number of machines on the local net is large.

Linux NetKit (0.17)                                               August 15, 1999                                              Linux NetKit (0.17)
