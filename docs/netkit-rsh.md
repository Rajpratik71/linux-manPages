RSH(1)                                                      BSD General Commands Manual                                                     RSH(1)

NAME
     rsh — remote shell

SYNOPSIS
     rsh [-Kdnx] [-k realm] [-l username] host [command]

DESCRIPTION
     Rsh executes command on host.

     Rsh copies its standard input to the remote command, the standard output of the remote command to its standard output, and the standard error
     of the remote command to its standard error.  Interrupt, quit and terminate signals are propagated to the remote command; rsh normally termi‐
     nates when the remote command does.  The options are as follows:

     -K    The -K option turns off all Kerberos authentication.

     -d    The -d option turns on socket debugging (using setsockopt(2)) on the TCP sockets used for communication with the remote host.

     -l    By default, the remote username is the same as the local username.  The -l option allows the remote name to be specified.  Kerberos
           authentication is used, and authorization is determined as in rlogin(1).

     -n    The -n option redirects input from the special device /dev/null (see the BUGS section of this manual page).

     If no command is specified, you will be logged in on the remote host using rlogin(1).

     Shell metacharacters which are not quoted are interpreted on local machine, while quoted metacharacters are interpreted on the remote
     machine.  For example, the command

           rsh otherhost cat remotefile >> localfile

     appends the remote file remotefile to the local file localfile, while

           rsh otherhost cat remotefile ">>" other_remotefile

     appends remotefile to other_remotefile.

FILES
     /etc/hosts

SEE ALSO
     rlogin(1), kerberos(3), krb_sendauth(3), krb_realmofhost(3)

HISTORY
     The rsh command appeared in 4.2BSD.

BUGS
     If you are using csh(1) and put a rsh in the background without redirecting its input away from the terminal, it will block even if no reads
     are posted by the remote command.  If no input is desired you should redirect the input of rsh to /dev/null using the -n option.

     You cannot run an interactive command (like rogue(6) or vi(1)) using rsh; use rlogin(1) instead.

     Stop signals stop the local rsh process only; this is arguably wrong, but currently hard to fix for reasons too complicated to explain here.

Linux NetKit (0.17)                                               August 15, 1999                                              Linux NetKit (0.17)
