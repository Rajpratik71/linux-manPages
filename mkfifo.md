MKFIFO(1)                                                                                       User Commands                                                                                       MKFIFO(1)



NAME
       mkfifo - make FIFOs (named pipes)

SYNOPSIS
       mkfifo [OPTION]... NAME...

DESCRIPTION
       Create named pipes (FIFOs) with the given NAMEs.

       Mandatory arguments to long options are mandatory for short options too.

       -m, --mode=MODE
              set file permission bits to MODE, not a=rw - umask

       -Z     set the SELinux security context to default type

       --context[=CTX]
              like -Z, or if CTX is specified then set the SELinux or SMACK security context to CTX

       --help display this help and exit

       --version
              output version information and exit

       GNU coreutils online help: <http://www.gnu.org/software/coreutils/> Report mkfifo translation bugs to <http://translationproject.org/team/>

AUTHOR
       Written by David MacKenzie.

COPYRIGHT
       Copyright © 2013 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       mkfifo(3)

       The full documentation for mkfifo is maintained as a Texinfo manual.  If the info and mkfifo programs are properly installed at your site, the command

              info coreutils 'mkfifo invocation'

       should give you access to the complete manual.



GNU coreutils 8.22                                                                               August 2019                                                                                        MKFIFO(1)
