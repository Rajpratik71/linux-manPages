BLOGCTL(8)                                                                                  The SUSE boot concept                                                                                  BLOGCTL(8)



NAME
       blogctl - Control the boot loggind daemon blogd

SYNOPSIS
       /sbin/blogctl [ping|quit|root=<path>|ready|close]

DESCRIPTION
       blogctl may be used to check if a blogd daemon is active as well as to send comands to such a daemon.

COMANDS
       The following commands are known:

       ping   Send a simply ping request if blogd daemon is up and running.

       quit   Cause the blogd daemon to finish its logging and then gracefully quits.

       root=<path>
              This command take a path as further value of the new root file system which is mounted e.g. in initrd.

       ready  Tells the blogd daemon that the file systems had becomes writable.

       close  Cause the blogd daemon to finish its logging only to allow systemd(8) to unmount the file systems finally.

SEE ALSO
       blogd(8), systemd(1),

COPYRIGHT
       2015 Werner Fink, 2015 SuSE Linux GmbH.

AUTHOR
       Werner Fink <werner@suse.de>



3rd Berkeley Distribution                                                                        Jan 14, 2016                                                                                      BLOGCTL(8)
