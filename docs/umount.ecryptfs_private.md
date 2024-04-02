umount.ecryptfs_private(1)                                           eCryptfs                                           umount.ecryptfs_private(1)

NAME
       umount.ecryptfs_private - eCryptfs private unmount helper.

SYNOPSIS
       umount.ecryptfs_private [-f]

       NOTE:  This  program will not clear the relevant keys from the user's keyring.  For this reason, it is recommended that users use ecryptfs-
       umount-private(1) instead!

OPTIONS
       Options available for the umount.ecryptfs_private command:

       -f     Force the unmount, ignoring the value of the mount counter in /tmp/ecryptfs-USERNAME-Private

DESCRIPTION
       umount.ecryptfs_private is a mount helper utility for non-root users to unmount a cryptographically mounted private directory, ~/Private.

       If, and only if:
         - the private mount passphrase is in their kernel keyring, and
         - the current user owns both ~/.Private and ~/Private, and
         - ~/.Private is currently mounted on ~/Private
         - the mount counter is 0 (counter is ignored if -f option is used)

       This program will:
         - unmount ~/Private

       The only setuid operationis in this program are the call to umount and updating /etc/mtab.

       The system administrator can add the pam_ecryptfs.so module to the  PAM  stack  and  automatically  perform  the  unmount  on  logout.  See
       pam_ecryptfs(8).

FILES
       ~/.Private - underlying directory containing encrypted data

       ~/Private - mountpoint containing decrypted data (when mounted)

       ~/.ecryptfs/Private.sig - file containing signature of mountpoint passphrase

       /tmp/ecryptfs-USERNAME-Private - file containing the mount counter, incremented on each mount, decremented on each unmount

SEE ALSO
       ecryptfs(7), ecryptfs-setup-private(1), keyctl(1), mount(8), mount.ecryptfs_private(1), pam_ecryptfs(8)

       /usr/share/doc/ecryptfs-utils/ecryptfs-faq.html

       http://ecryptfs.org/

AUTHOR
       This  manpage  and  the umount.ecryptfs_private utility was written by Dustin Kirkland <kirkland@ubuntu.com> for Ubuntu systems (but may be
       used by others).  Permission is granted to copy, distribute and/or modify this document under the terms of the GNU General Public  License,
       Version 2 or any later version published by the Free Software Foundation.

       On Debian and Ubuntu systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

ecryptfs-utils                                                      2008-07-21                                          umount.ecryptfs_private(1)
