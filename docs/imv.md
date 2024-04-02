ICMD(1)                                General Commands Manual                                ICMD(1)

NAME
       imv, icp - Rename or copy a file by editing the destination name using GNU readline.

SYNOPSIS
       imv [OPTION] FILE...

       icp [OPTION] FILE...

DESCRIPTION
       This manual page document describes the icmd, imv, and icp commands.

       imv  is  a  program  to interactively rename a single file.  It does this by allowing the file
       name to be edited inline with GNU readline. This is very similar to using  mv(1)  and  editing
       the  filename on the shell command-line, with one exception - the filename does not have to be
       typed twice.

       The imv program normally executes mv(1) to do  the  actual  renaming.   This  can  however  be
       changed with the --command option.

       icp  is  identical to imv except that a file is copied with cp(1) instead. Both these commands
       are symbolic links to the icmd command.

OPTIONS
       These programs follow the usual GNU command line syntax, with long options starting  with  two
       dashes (`-').

       All  options except those listed below are passed to either mv, cp or the command specified by
       --command.

       --command=FILE
              Specify command to run instead of the default `mv' or `cp'.  You do not need to specify
              the  directory  name  of FILE if FILE is found in the current path (as set by the $PATH
              environment variable).

              It is assumed that the command specified accepts the same set of long and short options
              that  require  an  argument as mv or cp.  If not, you should specify those options with
              --arg-options (see below). Also note that --arg-options is not needed as  long  as  you
              specify  option  and  option  value  in  a  single word, like `--suffix=bak' instead of
              `--suffix bak' when passing extra options to mv via imv.

       --arg-options=OPTION[,OPTION...]
              Specify what comma-separated options for mv, cp, or the command specified  with  --com‐
              mand  require  an argument. Options may be short (e.g. -S) as well as long (e.g. --suf‐
              fix).  The default list for mv is `t,S,reply,suffix,target-directory', and the list for
              cp  is  `t,S,Z,no-preserve,sparse,suffix,context,target-directory'.   (These  lists are
              complete and correct for GNU Coreutils 5.97.)

              This list is necessary because icmd needs to know what arguments specified on the  com‐
              mand line are files to move/copy, or option values (following an option).

       --pass-through
              Run mv/cp (or the command specified with --command) if two or more arguments are speci‐
              fied. This way imv/icp can be used as an alias for mv/cp (see below).

       --help Show summary of options.

       --version
              Output version information and exit.

EXAMPLES
       Using imv as a Bash alias for mv:
            alias mv=imv --pass-through -i

REPORTING BUGS
       Report bugs to <oskar@osk.mine.nu>.

SEE ALSO
       mv(1), cp(1)

AUTHOR
       The author of renameutils and this manual page is Oskar Liljeblad <oskar@osk.mine.nu>.

COPYRIGHT
       Copyright © 2001, 2002, 2004, 2005, 2007, 2008 Oskar Liljeblad

       This is free software; see the source for copying conditions.  There is NO warranty; not  even
       for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

icmd (renameutils)                         December 1, 2007                                   ICMD(1)
