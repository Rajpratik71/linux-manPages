DIRCOLORS(1)                    User Commands                    DIRCOLORS(1)

NAME
       dircolors - color setup for ls

SYNOPSIS
       dircolors [OPTION]... [FILE]

DESCRIPTION
       Output commands to set the LS_COLORS environment variable.

   Determine format of output:
       -b, --sh, --bourne-shell
              output Bourne shell code to set LS_COLORS

       -c, --csh, --c-shell
              output C shell code to set LS_COLORS

       -p, --print-database
              output defaults

       --help display this help and exit

       --version
              output version information and exit

       If  FILE  is  specified,  read it to determine which colors to use for
       which file types and extensions.  Otherwise, a precompiled database is
       used.   For  details  on  the  format  of  these files, run 'dircolors
       --print-database'.

AUTHOR
       Written by H. Peter Anvin.

REPORTING BUGS
       GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
       Report   dircolors   translation   bugs   to   <http://translationpro‐
       ject.org/team/>

COPYRIGHT
       Copyright  ©  2017 Free Software Foundation, Inc.  License GPLv3+: GNU
       GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to  change  and  redistribute  it.
       There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       Full  documentation at: <http://www.gnu.org/software/coreutils/dircol‐
       ors>
       or available locally via: info '(coreutils) dircolors invocation'

GNU coreutils 8.28               January 2018                    DIRCOLORS(1)
