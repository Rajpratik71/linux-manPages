SUM(1)                                                                                          User Commands                                                                                          SUM(1)



NAME
       sum - checksum and count the blocks in a file

SYNOPSIS
       sum [OPTION]... [FILE]...

DESCRIPTION
       Print checksum and block counts for each FILE.

       -r     use BSD sum algorithm, use 1K blocks

       -s, --sysv
              use System V sum algorithm, use 512 bytes blocks

       --help display this help and exit

       --version
              output version information and exit

       With no FILE, or when FILE is -, read standard input.

       GNU coreutils online help: <http://www.gnu.org/software/coreutils/> Report sum translation bugs to <http://translationproject.org/team/>

AUTHOR
       Written by Kayvan Aghaiepour and David MacKenzie.

COPYRIGHT
       Copyright © 2013 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for sum is maintained as a Texinfo manual.  If the info and sum programs are properly installed at your site, the command

              info coreutils 'sum invocation'

       should give you access to the complete manual.



GNU coreutils 8.22                                                                               August 2019                                                                                           SUM(1)
