WALL(1)                                                                                      Linux User's Manual                                                                                      WALL(1)



NAME
       wall -- send a message to everybody's terminal.


SYNOPSIS
       wall [-n] [ message ]


DESCRIPTION
       Wall  sends  a  message to everybody logged in with their mesg(1) permission set to yes.  The message can be given as an argument to wall, or it can be sent to wall's standard input.  When using the
       standard input from a terminal, the message should be terminated with the EOF key (usually Control-D).

       The length of the message is limited to 20 lines.  For every invocation of wall a notification will be written to syslog, with facility LOG_USER and level LOG_INFO.


OPTIONS
       -n     Suppresses the normal banner printed by wall, changing it to "Remote broadcast message".  This option is  only  available  for  root  if  wall  is  installed  set-group-id,  and  is  used  by
              rpc.walld(8).

ENVIRONMENT
       Wall ignores the TZ variable - the time printed in the banner is based on the system's local time.


SEE ALSO
       mesg(1), rpc.rwalld(8).


AUTHOR
       Miquel van Smoorenburg, miquels@cistron.nl



                                                                                                15 April 2003                                                                                         WALL(1)
