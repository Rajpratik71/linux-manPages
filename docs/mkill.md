MKILL(8)                                                                                    The SuSE boot concept                                                                                    MKILL(8)



MKILL
       Mkill - Send processes making a active mount point busy a signal

SYNOPSIS
       mkill [-SIG] [-u] /mnt1 [/mnt2...]
       mkill [-l]

DESCRIPTION
       mkill  determines  all active mount points from /proc/mounts and compares this with the specified mount points. Then mkill seeks for processes making this mount points busy. For this search only the
       links found in /proc/<pid>/ are used to avoid hangs on files provided by network file systems like nfs(5).  The default signal is SIGTERM for termination. If a mount point is  not  active,  that  is
       that it is not found in /proc/mounts, mkill will do exactly nothing.

OPTIONS
       -<SIG> Signals  can be specified either by name (e.g. -HUP, -SIGHUP) or by number (e.g. -1).

       -0     The special signal 0 force mkill to list all processes making the specified mount point busy.

       -u     Perform a lazy umount on the specified mount points before sending the signal SIGTERM or SIGKILL.

       -l     List all known signals.

EXAMPLES
       mkill -TERM /var

       This will terminate all processes accessing a seperate /var partition.

       mkill -HUP /dev/pts

       All processes using a pseudo-terminal slave will hangup.

RETURN VALUE
       Always success which is that zero is returned.

SEE ALSO
       fuser(1), proc(5), umount(8).

COPYRIGHT
       2008 Werner Fink, 2008 SUSE LINUX Products GmbH, Germany.

AUTHOR
       Werner Fink <werner@suse.de>



3rd Berkeley Distribution                                                                        Jan 31, 2008                                                                                        MKILL(8)
