DIRCOLORS(1)                                                                                    User Commands                                                                                    DIRCOLORS(1)



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

       If  FILE  is specified, read it to determine which colors to use for which file types and extensions.  Otherwise, a precompiled database is used.  For details on the format of these files, run 'dir‐
       colors --print-database'.

       GNU coreutils online help: <http://www.gnu.org/software/coreutils/> Report dircolors translation bugs to <http://translationproject.org/team/>

AUTHOR
       Written by H. Peter Anvin.

COPYRIGHT
       Copyright © 2013 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for dircolors is maintained as a Texinfo manual.  If the info and dircolors programs are properly installed at your site, the command

              info coreutils 'dircolors invocation'

       should give you access to the complete manual.



GNU coreutils 8.22                                                                               August 2019                                                                                     DIRCOLORS(1)
