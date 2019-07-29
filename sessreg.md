SESSREG(1)                                                                                 General Commands Manual                                                                                 SESSREG(1)



NAME
       sessreg - manage utmp/wtmp entries for non-init clients

SYNOPSIS
       sessreg [-w wtmp-file] [-u utmp-file] [-L lastlog-file] [-l line-name] [-h host-name] [-s slot-number] [-x Xservers-file] [-t ttys-file] [-V] [-a] [-d] user-name

DESCRIPTION
       Sessreg is a simple program for managing utmp/wtmp and lastlog entries for xdm sessions.

       System V has a better interface to utmp than BSD; it dynamically allocates entries in the file, instead of writing them at fixed positions indexed by position in /etc/ttys.

       To  manage  BSD-style  utmp  files,  sessreg  has  two strategies.  In conjunction with xdm, the -x option counts the number of lines in /etc/ttys and then adds to that the number of the line in the
       Xservers file which specifies the display.  The display name must be specified as the "line-name" using the -l option.  This sum is used as the "slot-number" in the utmp file that this entry will be
       written  at.   In  the more general case, the -s option specifies the slot-number directly.  If for some strange reason your system uses a file other than /etc/ttys to manage init, the -t option can
       direct sessreg to look elsewhere for a count of terminal sessions.

       Conversely, System V managers will not ever need to use these options (-x, -s and -t).  To make the program easier to document and explain, sessreg accepts the BSD-specific flags  in  the  System  V
       environment and ignores them.

       BSD and Linux also have a host-name field in the utmp file which doesn't exist in System V.  This option is also ignored by the System V version of sessreg.

USAGE
       In Xstartup, place a call like:

              sessreg -a -l $DISPLAY -x /etc/X11/xdm/Xservers $USER

       and in Xreset:

              sessreg -d -l $DISPLAY -x /etc/X11/xdm/Xservers $USER

OPTIONS
       -w wtmp-file
              This specifies an alternate wtmp file, instead of /var/log/wtmp.  The special name "none" disables writing records to the wtmp file.

       -u utmp-file
              This specifies an alternate utmp file, instead of /var/run/utmp.  The special name "none" disables writing records to the utmp file.

       -L lastlog-file
              This specifies an alternate lastlog file, instead of /var/log/lastlog, if the platform supports lastlog files.  The special name "none" disables writing records to the lastlog file.

       -l line-name
              This  describes  the  "line" name of the entry.  For terminal sessions, this is the final pathname segment of the terminal device filename (e.g. ttyd0).  For X sessions, it should probably be
              the local display name given to the users session (e.g. :0).  If none is specified, the terminal name will be determined with ttyname(3) and stripped of leading components.

       -h host-name
              This is set for BSD hosts to indicate that the session was initiated from a remote host.  In typical xdm usage, this options is not used.

       -s slot-number
              Each potential session has a unique slot number in BSD systems, most are identified by the position of the line-name in the /etc/ttysfile.  This option overrides the default  position  deter-
              mined with ttyslot(3).  This option is inappropriate for use with xdm, the -x option is more useful.

       -x Xservers-file
              As  X  sessions  are one-per-display, and each display is entered in this file, this options sets the slot-number to be the number of lines in the ttys-file plus the index into this file that
              the line-name is found.

       -t ttys-file
              This specifies an alternate file which the -x option will use to count the number of terminal sessions on a host.

       -V     This option causes the command to print its version and exit.

       -a     This session should be added to utmp/wtmp.

       -d     This session should be deleted from utmp/wtmp.  One of -a/-d must be specified.

SEE ALSO
       xdm(1), utmpx(5)

AUTHOR
       Keith Packard, MIT X Consortium



X Version 11                                                                                    sessreg 1.0.8                                                                                      SESSREG(1)
