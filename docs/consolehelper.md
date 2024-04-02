CONSOLEHELPER(8)                                              System Manager's Manual                                             CONSOLEHELPER(8)

NAME
       consolehelper - A wrapper that helps console users run system programs

SYNOPSIS
       progname [ options ]

DESCRIPTION
       consolehelper  is  a tool that makes it easy for console users to run system programs, doing authentication via PAM (which can be set up to
       trust all console users or to ask for a password at the system administrator's discretion).  When  possible,  the  authentication  is  done
       graphically; otherwise, it is done within the text console from which consolehelper was started.

       It  is  intended  to be completely transparent.  This means that the user will never run the consolehelper program directly.  Instead, pro‐
       grams like /sbin/shutdown are paired with a link from /usr/bin/shutdown to /usr/bin/consolehelper.  Then when non-root users (specifically,
       users  without /sbin in their path, or /sbin after /usr/bin) call the "shutdown" program, consolehelper will be invoked to authenticate the
       action and then invoke /sbin/shutdown.  (consolehelper itself has no priviledges; it calls the userhelper(8) program do the real work.)

       consolehelper requires that a PAM configuration for every managed program exist.  So to make /sbin/foo or /usr/sbin/foo managed,  you  need
       to create a link from /usr/bin/foo to /usr/bin/consolehelper and create the file /etc/pam.d/foo, normally using the pam_console(8) PAM mod‐
       ule.

OPTIONS
       This program has no command line options of its own; it passes all command line options on to the program it is calling.

SEE ALSO
       userhelper(8)

AUTHOR
       Michael K. Johnson <johnsonm@redhat.com>

Red Hat Software                                                   18 March 1999                                                  CONSOLEHELPER(8)
