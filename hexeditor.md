HEXEDITOR(1)                                                  General Commands Manual                                                 HEXEDITOR(1)

NAME
       hexeditor - Full screen curses Hex editor

SYNOPSIS
       hexeditor [ -8abdfgqrv ] [ filename ]

DESCRIPTION
       Hexeditor  is  an  editor  to edit binary (or any) files or disks.  The Display consists of the current offset from 0 (the first byte), the
       next sixteen bytes (aligned by bytes or 32-bit words), and its ASCII or EBCDIC text representation.

OPTIONS
       -h, --help
              Display help

       -8, --highbit
              Display 8-bit text

       -a, --alltext
              Display all text regardless that you know better

       -b, --buffer
              Buffer the entire file into memory.  Faster, and enables insert and delete.

       -d, --disk
              File editing is a disk.  OpenBSD and Linux only.

       -f, --force
              Force editing of a disk.  Need this option to enable writing to disks.

       -q, --quiet
              Quiet Mode; Turn off all beeping.

       -r, --readonly
              Do not allow modifying the file

       -v, --version
              Display version number

Commands and keys
       ^A     Insert byte

       Insert Insert byte

       ^D     Delete byte

       Delete Delete byte

       ^E     viEw as text dump

       ^F     Page down

       ^V     Page down

       Page Down
              Page down

       ^B     Page Up

       ^Y     Page Up

       Alt-V  Page Up

       Page Up
              Page Up

       Tab    Switch from hex to text representation

       ^I     Switch from hex to text representation

       ^T     goTo offset

       ^G     Get help

       ^L     Redraw screen

       ^C     Quit without saving

       ^O     Save

       ^X     Save and Quit

       ^W     Search (text/hex)

       ^N     find Next

       ^U     Undo

       ^R     ASCII <=> EBCDIC

       ^P     Switch Spacings

       ^+     Binary Calculator

Author
       Adam Rogoyski <apoc@laker.net>

See Also
       od (1)

BUGS
       Editing disks is only supported in Linux and OpenBSD.

       Please email Adam Rogoyski <apoc@laker.net> with any bugs you might find.  This man page is intentionally brief.  Please Read the  included
       documentation in Texinfo format for additional information

                                                                                                                                      HEXEDITOR(1)
