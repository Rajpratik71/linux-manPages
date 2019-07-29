gcore(1)                                                             GNU Tools                                                            gcore(1)

NAME
       gcore - Generate a core file for a running process

SYNOPSIS
       gcore [-o filename] pid

DESCRIPTION
       gcore generates a core file for the process specified by its process ID, pid. By default, the core file is written to core.pid, in the cur‐
       rent directory.

       -o filename
              write core file to filename instead of core.pid

COPYING
       Copyright © 2003, 2005, 2007, 2008 Free Software Foundation, Inc.

       Permission is granted to make and distribute verbatim copies of this manual provided the copyright notice and this  permission  notice  are
       preserved on all copies.

       Permission is granted to copy and distribute modified versions of  this manual under the conditions for verbatim copying, provided that the
       entire resulting derived work is distributed under the terms of a permission notice identical to this one.

       Permission is granted to copy and distribute translations of this manual into another language, under the  above  conditions  for  modified
       versions,  except  that  this  permission notice may be included in translations approved by the Free Software Foundation instead of in the
       original English.

SEE ALSO
       gdb(1), core(5)

gdb 6.8                                                              May 2007                                                             gcore(1)
