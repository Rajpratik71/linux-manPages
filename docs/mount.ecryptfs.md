mount.ecryptfs(8)                                                    eCryptfs                                                    mount.ecryptfs(8)

NAME
       mount.ecryptfs - eCryptfs mount helper.

SYNOPSIS
       mount -t ecryptfs [lower directory] [ecryptfs mount point]

DESCRIPTION
       mount.ecryptfs  is  eCryptfs mount helper. The mount utility will defer to the mount helper to perform various configuration tasks; use the
       -i option to bypass the mount helper if you would rather manually specify your mount options. To mount eCryptfs, specify the  lower  direc‐
       tory (i.e., /root/crypt) for the encrypted files and the eCryptfs mountpoint (i.e., /mnt/crypt) for the decrypted view of the files:

       mount -t ecryptfs /root/crypt /mnt/crypt

SEE ALSO
       ecryptfs(7), ecryptfsd(8), ecryptfs-manager(8), mount(8)

       /usr/share/doc/ecryptfs-utils/ecryptfs-faq.html

       http://ecryptfs.org/

AUTHOR
       This  manpage  was  written  by  William  Lima  <wlima.amadeus@gmail.com> for the Ubuntu system (but may be used by others).  Permission is
       granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 2 or any  later  version
       published by the Free Software Foundation.

       On Debian and Ubuntu systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

ecryptfs-utils                                                       May 2007                                                    mount.ecryptfs(8)
