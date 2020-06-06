GCORE(1)                                                                                  GNU Development Tools                                                                                  GCORE(1)

NAME
       gcore - Generate a core file of a running program

SYNOPSIS
       gcore [-o filename] pid

DESCRIPTION
       Generate a core dump of a running program with process ID pid.  Produced file is equivalent to a kernel produced core file as if the process crashed (and if "ulimit -c" were used to set up an
       appropriate core dump limit).  Unlike after a crash, after gcore the program remains running without any change.

OPTIONS
       -o filename
           The optional argument filename specifies the file name where to put the core dump.  If not specified, the file name defaults to core.pid, where pid is the running program process ID.

SEE ALSO
       The full documentation for GDB is maintained as a Texinfo manual.  If the "info" and "gdb" programs and GDB's Texinfo documentation are properly installed at your site, the command

               info gdb

       should give you access to the complete manual.

       Using GDB: A Guide to the GNU Source-Level Debugger, Richard M. Stallman and Roland H. Pesch, July 1991.

COPYRIGHT
       Copyright (c) 1988-2016 Free Software Foundation, Inc.

       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.3 or any later version published by the Free Software
       Foundation; with the Invariant Sections being "Free Software" and "Free Software Needs Free Documentation", with the Front-Cover Texts being "A GNU Manual," and with the Back-Cover Texts as in
       (a) below.

       (a) The FSF's Back-Cover Text is: "You are free to copy and modify this GNU Manual.  Buying copies from GNU Press supports the FSF in developing GNU and promoting software freedom."

gdb-7.11.1                                                                                      2017-06-09                                                                                       GCORE(1)
