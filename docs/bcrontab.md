bcrontab(1)                                                   General Commands Manual                                                  bcrontab(1)

NAME
       bcrontab - Manage users crontab files

SYNOPSIS
       bcrontab [ -u user ] file

       bcrontab [ -u user ] { -l | -r | -e }

DESCRIPTION
       bcrontab interfaces with the bcron-spool daemon to manage crontab files in the privileged spool directory.

OPTIONS
       -u user
              Tell  bcron-spool  that we are acting on behalf of the named user.  bcron-spool will only accept the username if bcrontab is running
              as either root or the same user ID as the named user.

       -l     List the cronab crontab to standard output.

       -r     Remove the user's crontab.

       -e     Edit the current crontab.

ENVIRONMENT
       VISUAL If this is set, it is used as the editor to invoke to edit a crontab.

       EDITOR If $VISUAL is not set and this is, it is used as the editor to invoke to edit a crontab.  If neither are set, /bin/vi is used.

       BCRON_SOCKET
              The path to the named socket used to communicate with bcron-spool.  Defaults to /var/run/bcron-spool.

       LOGNAME

       USER   These two variables are used, in order, to determine the user name invoking the program.  One must be set if the -u  option  is  not
              used.

FILES
       bcrontab  tries  to  writes  a  temporary  file  into the current directory, and then into /tmp if that fails, in order to edit the current
       crontab.

SEE ALSO
       bcron-spool(8), crontab(5)

AUTHOR
       Bruce Guenter <bruce@untroubled.org>

                                                                                                                                       bcrontab(1)
