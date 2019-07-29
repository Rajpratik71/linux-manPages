SETCTSID(8)                                                                               Linux Programmer's Manual                                                                               SETCTSID(8)



NAME
       setctsid - run a program in a new session and tty

SYNOPSIS
       setctsid [-f] /dev/<tty> program [args...]

DESCRIPTION
       setctsid runs a program in a new session with a new controlling terminal /dev/<tty>.  The -f option causes setctsid to run the program in a new process.

SEE ALSO
       setsid(2)

AUTHORS
       Rick Sladkey <jrs@world.std.com>, Werner Fink <werner@suse.de>



Linux 2.2                                                                                       12 April 1999                                                                                     SETCTSID(8)
