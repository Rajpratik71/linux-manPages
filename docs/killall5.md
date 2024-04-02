KILLALL5(8)                                                                       Linux System Administrator's Manual                                                                      KILLALL5(8)

NAME
       killall5 -- send a signal to all processes.

SYNOPSIS
       killall5 -signalnumber [-o omitpid[,omitpid..]]  [-o omitpid[,omitpid..]..]

DESCRIPTION
       killall5  is  the SystemV killall command. It sends a signal to all processes except kernel threads and the processes in its own session, so it won't kill the shell that is running the script
       it was called from. Its primary (only) use is in the rc scripts found in the /etc/init.d directory.

OPTIONS
       -o omitpid
              Tells killall5 to omit processes with that process id.

NOTES
       killall5 can also be invoked as pidof, which is simply a (symbolic) link to the killall5 program.

EXIT STATUS
       The program return zero if it killed processes.  It return 2 if no process were killed, and 1 if it was unable to find any processes (/proc/ is missing).

SEE ALSO
       halt(8), reboot(8), pidof(8)

AUTHOR
       Miquel van Smoorenburg, miquels@cistron.nl

                                                                                              04 Nov 2003                                                                                  KILLALL5(8)
