SUM(1)                                                                                          User Commands                                                                                          SUM(1)



NAME
       sum - checksum and count the blocks in a file

SYNOPSIS
       sum [OPTION]... [FILE]...

DESCRIPTION
       Print checksum and block counts for each FILE.

       With no FILE, or when FILE is -, read standard input.

       -r     use BSD sum algorithm, use 1K blocks

       -s, --sysv
              use System V sum algorithm, use 512 bytes blocks

       --help display this help and exit

       --version
              output version information and exit

AUTHOR
       Written by Kayvan Aghaiepour and David MacKenzie.

REPORTING BUGS
       GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
       Report sum translation bugs to <http://translationproject.org/team/>

COPYRIGHT
       Copyright © 2016 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       Full documentation at: <http://www.gnu.org/software/coreutils/sum>
       or available locally via: info '(coreutils) sum invocation'



GNU coreutils 8.25                                                                               January 2016                                                                                          SUM(1)
