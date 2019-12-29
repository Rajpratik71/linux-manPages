SYSLINUX2ANSI(1)                        General Commands Manual                       SYSLINUX2ANSI(1)

NAME
       syslinux2ansi - converts a syslinux-format screen to pc-ansi

SYNOPSIS
       syslinux2ansi < filename.input > filename.output

DESCRIPTION
       Syslinux2ansi is a filter which converts a screen formatted for syslinux to one compatible with
       PC ANSI.  It will only read from standard in, and has no command line options.

BUGS
       Help and version command line options would be useful.

       The ability to put input and output filenames on the command line might be good as well.

   Bug reports
       I would appreciate hearing of any problems you have with SYSLINUX.  I would also like  to  hear
       from you if you have successfully used SYSLINUX, especially if you are using it for a distribu‐
       tion.

       If you are reporting problems, please include all possible information about  your  system  and
       your BIOS; the vast majority of all problems reported turn out to be BIOD or hardware bugs, and
       I need as much information as possible in order to diagnose the problems.

       There is a mailing list for discussion among SYSLINUX users and for announcements  of  new  and
       test versions.   To join, send a message to majordomo@linux.kernel.org with the line:

       subscribe syslinux

       in the body of the message.  The submission address is syslinux@linux.kernel.org.

SEE ALSO
       syslinux(1), perl(1)

AUTHOR
       This manual page is a quick write-up for Debian done by Kevin Kreamer <kkreamer@etherhogz.org>,
       by looking over the 1 screenful of Perl that is syslinux2ansi.

                                                                                      SYSLINUX2ANSI(1)
