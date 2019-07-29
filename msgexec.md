MSGEXEC(1)                           GNU                           MSGEXEC(1)

NAME
       msgexec - process translations of message catalog

SYNOPSIS
       msgexec [OPTION] COMMAND [COMMAND-OPTION]

DESCRIPTION
       Applies  a  command to all translations of a translation catalog.  The
       COMMAND can be any program that  reads  a  translation  from  standard
       input.   It  is invoked once for each translation.  Its output becomes
       msgexec's output.  msgexec's return code is the  maximum  return  code
       across all invocations.

       A special builtin command called '0' outputs the translation, followed
       by a null byte.  The output of "msgexec 0" is suitable  as  input  for
       "xargs -0".

   Command input:
       --newline
              add newline at the end of input

       Mandatory  arguments  to  long options are mandatory for short options
       too.

   Input file location:
       -i, --input=INPUTFILE
              input PO file

       -D, --directory=DIRECTORY
              add DIRECTORY to list for input files search

       If no input file is given or if it is -, standard input is read.

   Input file syntax:
       -P, --properties-input
              input file is in Java .properties syntax

       --stringtable-input
              input file is in NeXTstep/GNUstep .strings syntax

   Informative output:
       -h, --help
              display this help and exit

       -V, --version
              output version information and exit

AUTHOR
       Written by Bruno Haible.

REPORTING BUGS
       Report bugs to <bug-gnu-gettext@gnu.org>.

COPYRIGHT
       Copyright © 2001-2016 Free Software Foundation, Inc.  License  GPLv3+:
       GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
       This  is  free  software:  you are free to change and redistribute it.
       There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for msgexec is maintained as a Texinfo  manual.
       If  the info and msgexec programs are properly installed at your site,
       the command

              info msgexec

       should give you access to the complete manual.

GNU gettext-tools 0.19.8.1        June 2016                        MSGEXEC(1)
