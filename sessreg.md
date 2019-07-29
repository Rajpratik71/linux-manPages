SESSREG(1)                                                    General Commands Manual                                                   SESSREG(1)

NAME
       sessreg - manage utmpx/wtmpx entries for non-init clients

SYNOPSIS
       sessreg  [-w wtmpx-file] [-u utmpx-file] [-L lastlog-file] [-l line-name] [-h host-name] [-s slot-number] [-x Xservers-file] [-t ttys-file]
       [-V] [-a] [-d] user-name

DESCRIPTION
       Sessreg is a simple program for managing utmpx/wtmpx and lastlog entries for xdm sessions.

       This version of sessreg is built using the modern POSIX pututxline(3c) interfaces, which no longer require the slot-number,  ttys-file,  or
       Xservers-file  mappings.   For  compatibility  with  older versions and other operating systems, the -s, -t, and -x flags are accepted, but
       ignored.

USAGE
       In Xstartup, place a call like:

              sessreg -a -l $DISPLAY -x /etc/X11/xdm/Xservers $USER

       and in Xreset:

              sessreg -d -l $DISPLAY -x /etc/X11/xdm/Xservers $USER

OPTIONS
       -w wtmpx-file
              This specifies an alternate wtmpx file, instead of /var/log/wtmp.  The special name "none" disables writing  records  to  the  wtmpx
              file.

       -u utmpx-file
              This  specifies  an  alternate  utmpx file, instead of /var/run/utmp.  The special name "none" disables writing records to the utmpx
              file.

       -L lastlog-file
              This specifies an alternate lastlog file, instead of /var/log/lastlog, if the platform supports lastlog  files.   The  special  name
              "none" disables writing records to the lastlog file.

       -l line-name
              This describes the "line" name of the entry.  For terminal sessions, this is the final pathname segment of the terminal device file‐
              name (e.g. ttyd0).  For X sessions, it should probably be the local display name given to the users session (e.g. :0).  If  none  is
              specified, the terminal name will be determined with ttyname(3) and stripped of leading components.

       -h host-name
              This is set to indicate that the session was initiated from a remote host.  In typical xdm usage, this options is not used.

       -s slot-number
              This option is accepted for compatibility, but does nothing in this version of sessreg.

       -x Xservers-file
              This option is accepted for compatibility, but does nothing in this version of sessreg.

       -t ttys-file
              This option is accepted for compatibility, but does nothing in this version of sessreg.

       -V     This option causes the command to print its version and exit.

       -a     This session should be added to utmpx/wtmpx.

       -d     This session should be deleted from utmpx/wtmpx.  One of -a/-d must be specified.

SEE ALSO
       xdm(1), utmpx(5), wtmpx(5)

AUTHOR
       Keith Packard, MIT X Consortium

X Version 11                                                       sessreg 1.1.0                                                        SESSREG(1)
