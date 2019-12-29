VOLNAME(1)                                   User Commands                                  VOLNAME(1)

NAME
       volname - return volume name

SYNOPSIS
       volname [<device-file>]

DESCRIPTION
       Volname  returns the volume name for a device formatted with an ISO-9660 file system, typically
       a CD-ROM. It also works with normal files that contain a ISO-9660 file system.

       The file name can be specified on the command line.  If omitted, it defaults to /dev/cdrom.

AUTHOR
       Volname was written by Jeff Tranter (tranter@pobox.com) and is released under the conditions of
       the GNU General Public License. See the file COPYING and notes in the source code for details.

SEE ALSO
       eject(1)

Linux                                         13 Nov 2004                                   VOLNAME(1)
