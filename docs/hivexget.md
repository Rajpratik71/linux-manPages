hivexget(1)                                                      Windows Registry                                                      hivexget(1)

NAME
       hivexget - Get subkey from a Windows Registry binary "hive" file

SYNOPSIS
        hivexget hivefile '\Path\To\SubKey'

        hivexget hivefile '\Path\To\SubKey' name

NOTE
       This is a low-level tool.  For a more convenient way to navigate the Windows Registry in Windows virtual machines, see virt-win-reg(1).
       For proper regedit formatting, use hivexregedit(1).

DESCRIPTION
       This program navigates through a Windows Registry binary "hive" file and extracts either all the (key, value) data pairs stored in that
       subkey or just the single named data item.

       In the first form:

        hivexget hivefile '\Path\To\SubKey'

       "hivefile" is some Windows Registry binary hive, and "\Path\To\Subkey" is a path within that hive.  NB the path is relative to the top of
       this hive, and is not the full path as you would use in Windows (eg. "HKEY_LOCAL_MACHINE\SYSTEM" is not a valid path).

       If the subkey exists, then the output lists all data pairs under this subkey, in a format similar to "regedit" in Windows.

       In the second form:

        hivexget hivefile '\Path\To\SubKey' name

       "hivefile" and path are as above.  "name" is the name of the value of interest (use "@" for the default value).

       The corresponding data item is printed "raw" (ie. no processing or escaping) except:

       1.  If it's a string we will convert it from Windows UTF-16 to UTF-8, if this conversion is possible.  The string is printed with a single
           trailing newline.

       2.  If it's a multiple-string value, each string is printed on a separate line.

       3.  If it's a numeric value, it is printed as a decimal number.

SEE ALSO
       hivex(3), hivexml(1), hivexsh(1), hivexregedit(1), virt-win-reg(1), guestfs(3), <http://libguestfs.org/>, virt-cat(1), virt-edit(1).

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

hivex-1.3.13                                                        2016-08-09                                                         hivexget(1)
