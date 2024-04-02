SHOWCONSOLE(8)                                                                              The SUSE boot concept                                                                              SHOWCONSOLE(8)



NAME
       Isserial - determines if the underlying tty of stdin is a serial line

SYNOPSIS
       isserial [< /dev/console]

DESCRIPTION
       iserial determines if the underlying character device of the current stdin is a serial line.  This can be used on /dev/console as current character device to check if the console is a serial line.

       The exit status of iserial is 0 if stdin is a serial line otherwise not.

FILES
       /dev/console
              the system console.

SEE ALSO
       console(4), tty(4),

COPYRIGHT
       2003 Werner Fink, 2003 SuSE GmbH Nuernberg, Germany.

AUTHOR
       Werner Fink <werner@suse.de>



3rd Berkeley Distribution                                                                        Jan 14, 2016                                                                                  SHOWCONSOLE(8)
