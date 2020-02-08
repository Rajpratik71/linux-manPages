CHEETAH(1)                              General Commands Manual                             CHEETAH(1)

NAME
       cheetah - Python template command-line tool

SYNOPSIS
       cheetah, cheetah-compile

       cheetah COMMAND [options] FILE...
       cheetah-compile [options] FILE...

DESCRIPTION
       This manual page documents briefly the cheetah command-line tool.  This manual page was written
       for the Debian distribution because the original program does not have a manual page.

       cheetah is a Python-powered template engine and code generator. It can be used as a  standalone
       utility or it can be combined with other tools. Cheetah has many potential uses, but web devel‐
       opers looking for a viable alternative to ASP, JSP, PHP and PSP are expected to be its  princi‐
       ple user group.

       The  cheetah  command-line tool is the standalone utility portion of the software suite.  chee‐
       tah-compile is a convenience script that for the "cheetah compile ..." command. The utility ac‐
       cepts  a  single  command  possible options and a list of files.  If FILE is a single "-", read
       standard input and write standard output.

COMMANDS
       The possible cheetah commands are listed below. You may abbreviate the  command  to  the  first
       letter; e.g., 'h' == 'help'.

       compile
              Compile template definitions

       fill   Fill template definitions

       help   Print commands help message

       options
              Print options help message for compile and fill commands

       test   Run regression tests

       version
              Print version number

OPTIONS
       The  options  for  cheetah  apply to the compile and fill commands. A summary of options is in‐
       cluded below.

       --idir DIR
              Input directories(default: current dir)

       --odir ODIR
              Output directories (default: current dir)

       --iext IEXT
              Input extension.  The default input extension for both the compile and fill commands  is
              "tmpl".

       --oext OEXT
              Output  extension.   The  default output extension for the compile command is "py".  The
              default output extension for fill is "html".

       -R     Recurse subdirectories looking for input files

       --debug
              Print lots of diagnostic output to the standard error file descriptor

       --env  Print the environment in the searchList

       --flat No destination subdirectories

       --nobackup
              Do not make backups

       --pickle FILE
              unpickle FILE and put that output in the searchList

       --stdout, -p
              Output to standard output file descriptor (pipe)

SEE ALSO
       pydoc(1)
       The programs  are  documented  fully  on  the  project  website  http://cheetahtemplate.source‐
       forge.net.   You  can  also browse the Python library files and their docstring descriptions by
       using the standard pydoc utility.

AUTHOR
       This manual page was written by Chad C. Walstrom <chewie@debian.org>, for  the  Debian  project
       and is dedicated to the Public Domain.

                                              2005 Apr 04                                   CHEETAH(1)
