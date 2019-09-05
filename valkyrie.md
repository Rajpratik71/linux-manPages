VALKYRIE(1)                                                   General Commands Manual                                                  VALKYRIE(1)

NAME
       valkyrie - graphical front-end to the Valgrind suite of tools for debugging and profiling Linux executables

SYNOPSIS
       valkyrie [valkyrie-opts] [valgrind-opts] [prog-and-args]

DESCRIPTION
       Valkyrie  is  a  graphical front-end to the Valgrind suite of tools for debugging and profiling Linux executables. The current version sup‐
       ports Valgrind from version 3.4.0. Currently, the only supported Valgrind tool is Memcheck.  Valkyrie  uses  the  Qt  widget  library,  and
       should  run  on  most  reasonably recent Linux setups. The only sine qua non is that you must have: Qt v.3.2.0 or higher (but not Qt v.4 as
       yet), and Valgrind v.3.4.0 or higher.

OPTIONS
       These programs follow the usual GNU command line syntax, with long options starting with  two  dashes  (`-').   A  summary  of  options  is
       included below. For more help please see HTML documentation.

       -h, --help

       -v, --version
              Show version of program.

       -V, --valgrind-opts
              Show valgrind options as well

       --working-dir
              Dir under which to run valgrind. Defaults to [./]

       --view-log <file>
              Parse and view a valgrind logfile

       --merge <loglist>
              Merge multiple logfiles, discarding duplicate errors

SEE ALSO
       valgrind(1), vk_logmerge(1).

AUTHOR
       valkyrie was written by Donna Robinson, Cerion Armour-Brown and others.

       This manual page was written by Hai Zaar <haizaar@haizaar.com>, for the Debian project (but may be used by others).

                                                                    2009-05-03                                                         VALKYRIE(1)
