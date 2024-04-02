TAILF(1)                                                                                        User Commands                                                                                        TAILF(1)



NAME
       tailf - follow the growth of a log file

SYNOPSIS
       tailf [option] file

DESCRIPTION
       tailf  is deprecated.  It may have unfixed bugs and will be removed from util-linux in March 2017.  Nowadays it's safe to use tail -f (from coreutils), in contrast to what the original documentation
       below says.

       tailf will print out the last 10 lines of the given file and then wait for this file to grow.  It is similar to tail -f but does not access the file when it is not growing.  This has the side effect
       of not updating the access time for the file, so a filesystem flush does not occur periodically when no log activity is happening.

       tailf is extremely useful for monitoring log files on a laptop when logging is infrequent and the user wishes the hard disk to spin down to conserve battery life.

       -n, --lines=number, -number
              Output the last number lines, instead of the last 10.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.


AUTHOR
       This program was originally written by Rik Faith (faith@acm.org) and may be freely distributed under the terms of the X11/MIT License.  There is ABSOLUTELY NO WARRANTY for this program.

       The latest inotify-based implementation was written by Karel Zak (kzak@redhat.com).

SEE ALSO
       less(1), tail(1)

AVAILABILITY
       The tailf command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.



util-linux                                                                                        March 2015                                                                                         TAILF(1)
