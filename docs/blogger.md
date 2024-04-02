BLOGGER(8)                                                                                  The SUSE boot concept                                                                                  BLOGGER(8)



NAME
       Blogger - writes messages to a running blogd process

SYNOPSIS
       blogger [-n|-d|-f|-s|-u] "a message here"

DESCRIPTION
       blogger is used to send messages to the blogd process during boot phase.  These messages will only appear in the boot logging file /var/log/boot.log and not on /dev/console.

OPTIONS
       -n     Declare the following message as a <notice>.  This is the default.

       -d     Use thist to add the leading string <done> to the message.

       -f     Use thist to add the leading string <failed> to the message.

       -s     Use thist to add the leading string <skipped> to the message.

       -u     Use thist to add the leading string <unused> to the message.

FILES
       /dev/blog
              the named pipe (FIFO) used as message channel to the blogd process.

SEE ALSO
       blogd(8), console(4), tty(4), proc(5).

COPYRIGHT
       2001 Werner Fink, 2001 SuSE GmbH Nuernberg, Germany.

AUTHOR
       Werner Fink <werner@suse.de>



3rd Berkeley Distribution                                                                        Jan 14, 2016                                                                                      BLOGGER(8)
