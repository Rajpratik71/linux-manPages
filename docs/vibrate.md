VIBRATE(1)                                                   NCBI Tools User's Manual                                                   VIBRATE(1)

NAME
       vibrate - run a program with the Vibrant library preloaded

SYNOPSIS
       vibrate [--help]

       vibrate program [arguments]

DESCRIPTION
       vibrate  runs the specified program, which presumably uses the NCBI C toolkit, with the Vibrant library preloaded.  The main effect of this
       preloading is that omitting arguments produces a dialog box for setting parameters rather than a usage message.

OPTIONS
       --help Print usage message and exit.

AUTHOR
       Aaron M. Ucko <ucko@debian.org>

Debian                                                              2001-10-05                                                          VIBRATE(1)
