GCORE(1)                                 GNU Development Tools                                GCORE(1)

NAME
       gcore - Generate a core file of a running program

SYNOPSIS
       gcore [-a] [-o prefix] pid1 [pid2...pidN]

DESCRIPTION
       Generate core dumps of one or more running programs with process IDs pid1, pid2, etc.  A core
       file produced by gcore is equivalent to one produced by the kernel when the process crashes
       (and when "ulimit -c" was used to set up an appropriate core dump limit).  However, unlike
       after a crash, after gcore finishes its job the program remains running without any change.

OPTIONS
       -a  Dump all memory mappings.  The actual effect of this option depends on the Operating
           System.  On GNU/Linux, it will disable "use-coredump-filter" and enable
           "dump-excluded-mappings".

       -o prefix
           The optional argument prefix specifies the prefix to be used when composing the file names
           of the core dumps.  The file name is composed as prefix.pid, where pid is the process ID of
           the running program being analyzed by gcore.  If not specified, prefix defaults to gcore.

SEE ALSO
       The full documentation for GDB is maintained as a Texinfo manual.  If the "info" and "gdb"
       programs and GDB's Texinfo documentation are properly installed at your site, the command

               info gdb

       should give you access to the complete manual.

       Using GDB: A Guide to the GNU Source-Level Debugger, Richard M. Stallman and Roland H. Pesch,
       July 1991.

COPYRIGHT
       Copyright (c) 1988-2019 Free Software Foundation, Inc.

       Permission is granted to copy, distribute and/or modify this document under the terms of the
       GNU Free Documentation License, Version 1.3 or any later version published by the Free Software
       Foundation; with the Invariant Sections being "Free Software" and "Free Software Needs Free
       Documentation", with the Front-Cover Texts being "A GNU Manual," and with the Back-Cover Texts
       as in (a) below.

       (a) The FSF's Back-Cover Text is: "You are free to copy and modify this GNU Manual.  Buying
       copies from GNU Press supports the FSF in developing GNU and promoting software freedom."

gdb-8.3                                       2019-05-17                                      GCORE(1)
