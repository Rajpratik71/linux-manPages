UL(1)                                                                                           User Commands                                                                                           UL(1)



NAME
       ul - do underlining

SYNOPSIS
       ul [options] [file ...]

DESCRIPTION
       ul  reads  the  named  files  (or standard input if none are given) and translates occurrences of underscores to the sequence which indicates underlining for the terminal in use, as specified by the
       environment variable TERM.  The terminfo database is read to determine the appropriate sequences for underlining.  If the terminal is incapable of underlining but is capable of a standout mode, then
       that is used instead.  If the terminal can overstrike, or handles underlining automatically, ul degenerates to cat(1).  If the terminal cannot underline, underlining is ignored.

OPTIONS
       -i, --indicated
              Underlining is indicated by a separate line containing appropriate dashes `-'; this is useful when you want to look at the underlining which is present in an nroff output stream on a crt-ter‐
              minal.

       -t, -T, --terminal terminal
              Overrides the terminal type specified in the environment with TERM.

       -V, --version
              Display version information and exit.

       -h, --help
              Display a help text and exit.

ENVIRONMENT
       The following environment variable is used:

       TERM   The TERM variable is used to relate a tty device with its device capability description (see terminfo(5)).  TERM is set at login time,  either  by  the  default  terminal  type  specified  in
              /etc/ttys or as set during the login process by the user in their login file (see setenv(1)).

SEE ALSO
       colcrt(1), login(1), man(1), nroff(1), setenv(1), terminfo(5)

BUGS
       Nroff usually outputs a series of backspaces and underlines intermixed with the text to indicate underlining.  No attempt is made to optimize the backward motion.

HISTORY
       The ul command appeared in 3.0BSD.

AVAILABILITY
       The ul command is part of the util-linux package and is available from Linux Kernel Archive ⟨ftp://ftp.kernel.org/pub/linux/utils/util-linux/⟩.



util-linux                                                                                      September 2011                                                                                          UL(1)
