BLOGD(8)                                                                                    The SUSE boot concept                                                                                    BLOGD(8)



NAME
       blogd - boot logging on /dev/console

SYNOPSIS
       /sbin/blogd [-f]

DESCRIPTION
       The  blogd daemon determines the real underlying character device of /dev/console.  blogd spawns a pty/tty pair to reconnect the current /dev/console with the slave of the pty/tty pair. During writ-
       ing information from this slave to the real character device a ring buffer is used to hold the information for writing it to an existing logging file.

       To fetch the real tty of /dev/console the program showconsole(8) can be used. This has the advantage that blogd will not hold the real character device of /dev/console as its controlling tty  (would
       hangup any running getty on that character device).

OPTIONS
       -f     This option is used at shutdown, that is reboot, halt, and poweroff but also for kexec.

SIGNALS
       blogd knows a few signal to contol its behavior.

       SIGQUIT, SIGINT, and SIGTERM
              will cause blogd tries to write out the ring buffer and to exit.

       SIGIO  says  blogd that now it is able to write on /var/log/boot.log which means that the file system is mounted read/write and the kernel messages are written to that file.  After a reboot the file
              /var/log/boot.old may exists where the former messages can be found including the messages at shutdown upto the point where the file systems become unmounted.

       SIGSYS says blogd that it should stop writing to disk but continue to repeat messages to the old devices of the system console.

BUGS
       blogd needs a mounted /proc and /dev/pts file system and tries to set the controlling tty to stdin if the real character device of /dev/console is not given.  After  reading  /proc  blogd  tries  to
       restore the status of the controlling tty to avoid problems with getty processes.  This can fail because blogd forks to run in the background as a daemon.

FILES
       /proc/<pid of blogd>/stat
              the stat file of the blogd process.

       /dev/console
              the system console.

       /var/log/boot.log, /var/log/boot.old
              logging file which is created by blogd(8)

SEE ALSO
       showconsole(8), syslogd(8), proc(5).

COPYRIGHT
       2000,2015 Werner Fink, 2000 SuSE GmbH Nuernberg, Germany, 2015 SuSE Linux GmbH.

AUTHOR
       Werner Fink <werner@suse.de>



3rd Berkeley Distribution                                                                        Jan 14, 2016                                                                                        BLOGD(8)
