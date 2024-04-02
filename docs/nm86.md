objdump86(1)                                                  General Commands Manual                                                 objdump86(1)

NAME
       objdump86, size86, nm86 - Examine object, archive or executable files

SYNOPSIS
       objdump86 [file...]

       size86 [file...]

       nm86 [file...]

DESCRIPTION
       These commands are used to examine the contents of object files. They may also be used to examine archive or executable files. When archive
       files are examined each module in the archive will be processed in sequence.

       nm86 prints the symbol table in each of the specified files.

       size86 displays a summary of the sizes of the segments in each of the files.

       objdump86 decodes and displays the contents of the object files specified. This includes  the  section  headers,  symbols  tables,  segment
       sizes, and segment contents.

OPTIONS
       The programs are not designed to accept any options.

       It  should be noted that all three of objdump86, size86, and nm86 are implemented as links to the same executable file (called objdump86 in
       the source distribution). The result of running this executable is determined by the file name actually used to execute it.

       It is possible to force a specific behavior irrespective of the invocation file name using one of the options below

       -s     Behave like size86.

       -n     Behave like nm86.

RESTRICTIONS
       These commands are intended for use only with the Dev86/ELKS toolchain.

SEE ALSO
       as86(1), bcc(1), ld86(1)

AUTHORS
       objdump86, size86, and nm86 © 1999 Greg Haerr <greg@censoft.com>.

COPYRIGHT
       The manual page was written for Debian GNU/Linux, © 2006 Shyamal Prasad <shyamal@member.fsf.org>. It is distributed under the terms of  the
       GNU General Public License version 2 (or any later version released by the Free Software Foundation).

                                                                     May, 2006                                                        objdump86(1)
