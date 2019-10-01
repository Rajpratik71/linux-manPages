MKNOD(1)                                                                                        User Commands                                                                                        MKNOD(1)



NAME
       mknod - make block or character special files

SYNOPSIS
       mknod [OPTION]... NAME TYPE [MAJOR MINOR]

DESCRIPTION
       Create the special file NAME of the given TYPE.

       Mandatory arguments to long options are mandatory for short options too.

       -m, --mode=MODE
              set file permission bits to MODE, not a=rw - umask

       -Z     set the SELinux security context to default type

       --context[=CTX]
              like -Z, or if CTX is specified then set the SELinux or SMACK security context to CTX

       --help display this help and exit

       --version
              output version information and exit

       Both  MAJOR  and MINOR must be specified when TYPE is b, c, or u, and they must be omitted when TYPE is p.  If MAJOR or MINOR begins with 0x or 0X, it is interpreted as hexadecimal; otherwise, if it
       begins with 0, as octal; otherwise, as decimal.  TYPE may be:

       b      create a block (buffered) special file

       c, u   create a character (unbuffered) special file

       p      create a FIFO

       NOTE: your shell may have its own version of mknod, which usually supersedes the version described here.  Please refer to your shell's documentation for details about the options it supports.

       GNU coreutils online help: <http://www.gnu.org/software/coreutils/> Report mknod translation bugs to <http://translationproject.org/team/>

AUTHOR
       Written by David MacKenzie.

COPYRIGHT
       Copyright © 2013 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       mknod(2)

       The full documentation for mknod is maintained as a Texinfo manual.  If the info and mknod programs are properly installed at your site, the command

              info coreutils 'mknod invocation'

       should give you access to the complete manual.



GNU coreutils 8.22                                                                               August 2019                                                                                         MKNOD(1)
