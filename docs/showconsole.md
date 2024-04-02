SHOWCONSOLE(8)                                                                              The SUSE boot concept                                                                              SHOWCONSOLE(8)



NAME
       Showconsole - determines the real tty of stdin
       Setconsole - redirect system console output to a tty

SYNOPSIS
       showconsole [-n]

       setconsole [-r|/dev/tty<xy>]

DESCRIPTION
       showconsole determines the real character device of the current system console.  This can be used on /dev/console as current character device to get the real character device back.

       With  an  terminal device as argument setconsole redirects the output that would have gone to /dev/console or /dev/tty0 to the given terminal.  Without any argument or the option the setconsole undo
       any redirection.

OPTIONS
       -n     Return the major and minor device numbers instead of the device file name.  This can be used to asked the kernel for the major and minor device numbers of a not existing device file in /dev.

BUGS
       showconsole needs a mounted /proc file system and tries to set the controlling tty to stdin if no controlling tty is found.  After reading /proc the status of the  controlling  tty  is  restored  to
       avoid problems with getty processes.

FILES
       /proc/<pid of showconsole>/stat
              the stat file of the showconsole process.

       /dev/console
              the system console.

SEE ALSO
       blogd(8), console(4), tty(4), proc(5).

COPYRIGHT
       2000 Werner Fink, 2000 SuSE GmbH Nuernberg, Germany.

AUTHOR
       Werner Fink <werner@suse.de>



3rd Berkeley Distribution                                                                        Jan 14, 2016                                                                                  SHOWCONSOLE(8)
