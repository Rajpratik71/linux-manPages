CATCHSEGV(1)                                                                                 Debian GNU/Linux                                                                                CATCHSEGV(1)

NAME
       catchsegv - Catch segmentation faults in programs

SYNOPSIS
       catchsegv program [args]

DESCRIPTION
       Used to debug segmentation faults in programs. The output is the content of registers, plus a backtrace. Basically you call your program and its arguments as the arguments to catchsegv.

AUTHOR
       catchsegv was written by Ulrich Drepper for the GNU C Library

       This man page was written by Ben Collins <bcollins@debian.org> for the Debian GNU/Linux system.

3rd Berkeley Distribution                                                                          etch                                                                                      CATCHSEGV(1)
