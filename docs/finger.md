FINGER(1)                                                                                BSD General Commands Manual                                                                                FINGER(1)

NAME
     finger — user information lookup program

SYNOPSIS
     finger [-hlMmops] [user ...]
     finger [-l] [user@host ...]

DESCRIPTION
     The finger utility displays information about local and remote system users.  By default, the following information is displayed about each user currently logged-in to the local host:

           ·   login name
           ·   user's full name
           ·   associated terminal name
           ·   idle time
           ·   login time
           ·   from where

     Idle time is in minutes if it is a single integer, hours and minutes if a ‘:’ is present, or days if a ‘d’ is present.  Login time is displayed as the day name if less than six days, else month, day,
     hours and minutes, unless more than six months ago, in which case the year is displayed rather than the hours and minutes.

     The names of terminals for which write permission is denied (see mesg(1)) are prepended with an asterisk (‘*’).  Unknown devices as well as nonexistent idle and login times are displayed as single
     asterisks.

     The options are as follows:

     -h      If the -s option is also specified, the name of the remote host is displayed instead of the office location and office phone.

     -l      Long format.  Produces a multi-line format displaying all of the information available from the -s option as well as the user's home directory, home phone number, login shell, mail status, and
             the contents of the “.plan” and “.project” files from the user's home directory.

             If idle time is at least a minute and less than a day, it is presented in the form “hh:mm”.  Idle times greater than a day are presented as “d day[s]hh:mm”.

             Phone numbers specified as eleven digits are printed as “+N-NNN-NNN-NNNN”.  Numbers specified as ten or seven digits are printed as the appropriate subset of that string.  Numbers specified as
             five digits are printed as “xN-NNNN”.  Numbers specified as four digits are printed as “xNNNN”.

             If write permission is denied to the device, the phrase “(messages off)” is appended to the line containing the device name.  One entry per user is displayed with the -l option; if a user is
             logged on multiple times, terminal information is repeated once per login.

             Mail status is shown as “No Mail.” if there is no mail at all, “Mail last read DDD MMM ## HH:MM YYYY (TZ)” if the person has looked at their mailbox since new mail arriving, or “New mail
             received ...”, “Unread since ...” if they have new mail.

     -M      Enable matching of user names.  This is disabled by default on systems running YP or with large password databases.

     -m      Prevent matching of user names.  User is usually a login name; however, matching will also be done on the users' real names, unless the -m option is supplied.  All name matching performed by
             finger is case insensitive.

     -o      If the -s option is also specified, the office location and office phone is displayed instead of the name of the remote host.

     -p      Prevents the -l option of finger from displaying the contents of the “.plan” and “.project” files.

     -s      Short format (default).  The information as described above is displayed in a columnar fashion.

     If no options are specified, finger defaults to the -l style output if operands are provided, otherwise to the -s style.  Note that some fields may be missing, in either format, if information is not
     available for them.

     finger may be used to look up users on a remote machine.  The format is to specify a user as “user@host”, or “@host”, where the default output format for the former is the -l style, and the default
     output format for the latter is the -s style.  The -l option is the only option that may be passed to a remote machine.

SEE ALSO
     chfn(1), w(1), who(1), fingerd(8)

HISTORY
     The finger command appeared in 3.0BSD.

BSD                                                                                             July 27, 1991                                                                                             BSD
