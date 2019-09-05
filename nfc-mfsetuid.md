nfc-mfsetuid(1)                                                    NFC Utilities                                                   nfc-mfsetuid(1)

NAME
       nfc-mfsetuid - MIFARE 1K special card UID setting and recovery tool

SYNOPSIS
       nfc-mfsetuid [ UID ]

DESCRIPTION
       nfc-mfsetuid is a MIFARE tool that allows setting of UID on special versions (Chinese clones) of Mifare 1K cards. It will also recover dam‐
       aged cards that have had invalid data written to block 0 (e.g. wrong BCC). Currently only 4 Byte UID is supported.  Specify  an  eight  hex
       character UID or leave blank for the default '01234567'.

OPTIONS
       -f Format. Wipe all data (set to 0xFF) and reset ACLs to defaults.

       -q Quiet. Suppress output of commands and responses.

BUGS
       Please report any bugs on the libnfc issue tracker at:
       http://code.google.com/p/libnfc/issues

LICENCE
       libnfc is licensed under the GNU Lesser General Public License (LGPL), version 3.
       libnfc-utils and libnfc-examples are covered by the the BSD 2-Clause license.

AUTHORS
       Adam Laurie <adam@algroup.co.uk>

       This manual page was written by Adam Laurie <adam@algroup.co.uk>.  It is licensed under the terms of the GNU GPL (version 2 or later).

libnfc                                                             Sep 05, 2011                                                    nfc-mfsetuid(1)
