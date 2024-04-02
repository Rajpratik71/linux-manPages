readproctitle(8)                                              System Manager's Manual                                             readproctitle(8)

NAME
       readproctitle - maintains an automatically rotated log in memory for inspection by ps(1).

       readproctitle is available in daemontools 0.75 and above.

SYNOPSIS
       readproctitle L D

DESCRIPTION
       L consists of any number of arguments.  D is one argument consisting of at least five dots.

       readproctitle  reads  data  into  the  end  of  D,  shifting D to the left to make room. This means that the most recent data is visible to
       process-listing tools such as ps(1).  readproctitle always leaves three dots at the left of D.

       For example, if

        readproctitle io errors: ....................

       reads the data

        fatal error xyz
        warning abc

       then its command-line arguments change to

        readproctitle io errors: ... xyz!warning abc!

       with a newline character in place of each !. Process-listing tools typically show the newline character as ? or \n.

       readproctitle exits when it reaches the end of input.

       Beware that most implementations of ps(1) have small argument-length limits. These limits apply to the total length of readproctitle  L  D.
       I have not seen a system with a limit below 512 bytes.

SEE ALSO
       supervise(8),  svc(8),  svok(8), svstat(8), svscanboot(8), svscan(8), fghack(8), pgrphack(8), multilog(8), tai64n(8), tai64nlocal(8), setu‐
       idgid(8), envuidgid(8), envdir(8), softlimit(8), setlock(8), ps(1)

        http://cr.yp.to/daemontools.html
        http://cr.yp.to/slashcommand.html

                                                                                                                                  readproctitle(8)
