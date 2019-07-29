PRINTENV(1)                     User Commands                     PRINTENV(1)

NAME
       printenv - print all or part of environment

SYNOPSIS
       printenv [OPTION]... [VARIABLE]...

DESCRIPTION
       Print  the  values  of  the  specified environment VARIABLE(s).  If no
       VARIABLE is specified, print name and value pairs for them all.

       -0, --null
              end each output line with NUL, not newline

       --help display this help and exit

       --version
              output version information and exit

       NOTE: your shell may have its own version of printenv,  which  usually
       supersedes  the  version described here.  Please refer to your shell's
       documentation for details about the options it supports.

AUTHOR
       Written by David MacKenzie and Richard Mlynarik.

REPORTING BUGS
       GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
       Report   printenv   translation   bugs   to    <http://translationpro‐
       ject.org/team/>

COPYRIGHT
       Copyright  ©  2017 Free Software Foundation, Inc.  License GPLv3+: GNU
       GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to  change  and  redistribute  it.
       There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       Full  documentation  at: <http://www.gnu.org/software/coreutils/print‐
       env>
       or available locally via: info '(coreutils) printenv invocation'

GNU coreutils 8.28               January 2018                     PRINTENV(1)
