EXPAND(1)                       User Commands                       EXPAND(1)

NAME
       expand - convert tabs to spaces

SYNOPSIS
       expand [OPTION]... [FILE]...

DESCRIPTION
       Convert tabs in each FILE to spaces, writing to standard output.

       With no FILE, or when FILE is -, read standard input.

       Mandatory  arguments  to  long options are mandatory for short options
       too.

       -i, --initial
              do not convert tabs after non blanks

       -t, --tabs=N
              have tabs N characters apart, not 8

       -t, --tabs=LIST
              use comma separated list of tab positions  The  last  specified
              position  can be prefixed with '/' to specify a tab size to use
              after the last explicitly specified tab stop.  Also a prefix of
              '+'  can  be  used to align remaining tab stops relative to the
              last specified tab stop instead of the first column

       --help display this help and exit

       --version
              output version information and exit

AUTHOR
       Written by David MacKenzie.

REPORTING BUGS
       GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
       Report   expand   translation    bugs    to    <http://translationpro‐
       ject.org/team/>

COPYRIGHT
       Copyright  ©  2017 Free Software Foundation, Inc.  License GPLv3+: GNU
       GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to  change  and  redistribute  it.
       There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       unexpand(1)

       Full documentation at: <http://www.gnu.org/software/coreutils/expand>
       or available locally via: info '(coreutils) expand invocation'

GNU coreutils 8.28               January 2018                       EXPAND(1)
