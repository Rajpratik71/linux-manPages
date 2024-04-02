hivexml(1)                                                       Windows Registry                                                       hivexml(1)

NAME
       hivexml - Convert Windows Registry binary "hive" into XML

SYNOPSIS
        hivexml [-dk] hivefile > output.xml

DESCRIPTION
       This program converts a single Windows Registry binary "hive" file into a self-describing XML format.

OPTIONS
       -d  Enable lots of debug messages.  If you find a Registry file that this program cannot parse, please enable this option and post the
           complete output and the Registry file in your bug report.

       -k  Keep going even if we find errors in the Registry file.  This skips over any parts of the Registry that we cannot read.

SEE ALSO
       hivex(3), hivexget(1), hivexsh(1), hivexregedit(1), virt-win-reg(1), guestfs(3), <http://libguestfs.org/>, virt-cat(1), virt-edit(1).

AUTHORS
       Richard W.M. Jones ("rjones at redhat dot com")

COPYRIGHT
       Copyright (C) 2009 Red Hat Inc.

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation,
       Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

hivex-1.3.13                                                        2016-08-09                                                          hivexml(1)
