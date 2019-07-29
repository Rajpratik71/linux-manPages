ecryptfs-setup-swap(1)                                               eCryptfs                                               ecryptfs-setup-swap(1)

NAME
       ecryptfs-setup-swap - ensure that any swap space is encrypted

SYNOPSIS
       ecryptfs-setup-swap [-f|--force]

DESCRIPTION
       This script will detect existing swap partitions or swap files, and encrypt them, using cryptsetup.

       Encrypted  swap  is essential to securing any system using eCryptfs, since decrypted file contents will exist in the system's memory, which
       may be swapped to disk at any time.  If the system swap space is not also encrypted, it is possible that decrypted files could  be  written
       to disk in clear text.

       Note that most Linux distributions do not yet support resuming from an encrypted swap space, and thus hibernate/resume will not work.  Sus‐
       pend/resume is unaffected.

       Upon running the utility, the user will be informed of the hibernate/resume break, and asked  to  confirm  the  behavior.   The  -f|--force
       option can be used to bypass this interactive prompt.

SEE ALSO
       cryptsetup(8)

       http://ecryptfs.org/

AUTHOR
       This  manpage and the utility was written by Dustin Kirkland <kirkland@ubuntu.com> for Ubuntu systems (but may be used by others).  Permis‐
       sion is granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 2 or  any  later
       version published by the Free Software Foundation.

       On Debian and Ubuntu systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

ecryptfs-utils                                                      2009-08-17                                              ecryptfs-setup-swap(1)
