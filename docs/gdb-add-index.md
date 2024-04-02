GDB-ADD-INDEX(1)                                                                            GNU Development Tools                                                                            GDB-ADD-INDEX(1)



NAME
       gdb-add-index - Add index files to speed up GDB

SYNOPSIS
       gdb-add-index filename

DESCRIPTION
       When GDB finds a symbol file, it scans the symbols in the file in order to construct an internal symbol table.  This lets most GDB operations work quickly--at the cost of a delay early on.  For
       large programs, this delay can be quite lengthy, so GDB provides a way to build an index, which speeds up startup.

       To determine whether a file contains such an index, use the command readelf -S filename: the index is stored in a section named ".gdb_index".  Note that the index is never generated for files that
       do not contain DWARF debug information (sections named ".debug_*").

       See more in the GDB manual in node "Index Files" -- shell command "info -f gdb -n 'Index Files'".

OPTIONS
SEE ALSO
       The full documentation for GDB is maintained as a Texinfo manual.  If the "info" and "gdb" programs and GDB's Texinfo documentation are properly installed at your site, the command

               info gdb

       should give you access to the complete manual.

       Using GDB: A Guide to the GNU Source-Level Debugger, Richard M. Stallman and Roland H. Pesch, July 1991.

COPYRIGHT
       Copyright (c) 1988-2017 Free Software Foundation, Inc.

       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.3 or any later version published by the Free Software
       Foundation; with the Invariant Sections being "Free Software" and "Free Software Needs Free Documentation", with the Front-Cover Texts being "A GNU Manual," and with the Back-Cover Texts as in (a)
       below.

       (a) The FSF's Back-Cover Text is: "You are free to copy and modify this GNU Manual.  Buying copies from GNU Press supports the FSF in developing GNU and promoting software freedom."



gdb-8.0                                                                                           2017-07-04                                                                                 GDB-ADD-INDEX(1)
