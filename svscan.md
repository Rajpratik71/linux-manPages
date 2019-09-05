svscan(8)                                                     System Manager's Manual                                                    svscan(8)

NAME
       svscan - starts and monitors a collection of services

SYNOPSIS
       svscan [ directory ]

DESCRIPTION
       svscan  starts one supervise(8) process for each subdirectory of the current directory, up to a limit of 1000 subdirectories.  svscan skips
       subdirectory names starting with dots.  supervise(8) must be in svscan's path.

       svscan optionally starts a pair of supervise(8) processes, one for a subdirectory s, one for s/log, with a pipe between them. It does  this
       if the name s is at most 255 bytes long and s/log exists. (In versions 0.70 and below, it does this if s is sticky.)  svscan needs two free
       descriptors for each pipe.

       Every five seconds, svscan checks for subdirectories again. If it sees a new subdirectory, it starts a new supervise(8) process. If it sees
       an  old subdirectory where a supervise(8) process has exited, it restarts the supervise(8) process. In the log case it reuses the same pipe
       so that no data is lost.

       svscan is designed to run forever. If it has trouble creating a pipe or running supervise(8), it prints a message to stderr;  it  will  try
       again five seconds later.

       If svscan is given a command-line argument directory, it switches to that directory when it starts.

SEE ALSO
       supervise(8),  svc(8), svok(8), svstat(8), svscanboot(8), readproctitle(8), fghack(8), pgrphack(8), multilog(8), tai64n(8), tai64nlocal(8),
       setuidgid(8), envuidgid(8), envdir(8), softlimit(8), setlock(8)

       http://cr.yp.to/daemontools.html

                                                                                                                                         svscan(8)
