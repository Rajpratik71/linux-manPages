VHANGUP(8)                                                                                  The SuSE boot concept                                                                                  VHANGUP(8)



NAME
       Vhangup - Cause a virtually hangup on the specified terminals

SYNOPSIS
       vhangup [/dev/<terminal> [/dev/<terminal>]]

DESCRIPTION
       vhangup simulates a hangup on the specified terminals.  Not existing device files or devices will be ignored.

EXAMPLES
       vhangup /dev/tty1 /dev/tty2 /dev/tty3 /dev/tty4 /dev/tty5 /dev/tty6 /dev/ttyS1

       This  will  replace all open file descriptors in the kernel that points to the listed ttys by a dummy that will deny further reading/writing to the device. It also send the signals SIGHUP/SIGCONT to
       the processes which have file descriptors open on the listed ttys.

RETURN VALUE
       On success, zero is returned.  On error, 1 is returned.

SEE ALSO
       vhangup(2), tty(4), ttyS(4), pts(4).

COPYRIGHT
       2008 Werner Fink, 2008 SUSE LINUX Products GmbH, Germany.

AUTHOR
       Werner Fink <werner@suse.de>



3rd Berkeley Distribution                                                                        Jan 31, 2008                                                                                      VHANGUP(8)
