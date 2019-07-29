mount.ecryptfs_private(1)                                            eCryptfs                                            mount.ecryptfs_private(1)

NAME
       mount.ecryptfs_private - eCryptfs private mount helper.

SYNOPSIS
       mount.ecryptfs_private [ALIAS]

       NOTE:  This  program  will  not  dynamically load the relevant keys.  For this reason, it is recommended that users use ecryptfs-mount-pri‐
       vate(1) instead!

DESCRIPTION
       mount.ecryptfs_private is a mount helper utility for non-root users to cryptographically mount a private directory, ~/Private by default.

       This program optionally takes one argument, ALIAS.  If ALIAS is omitted, the program will default to using "Private" using:
        - $HOME/.Private as the SOURCE
        - $HOME/Private as the DESTINATION
        - $HOME/.ecryptfs/Private.sig for the key signatures.

       If ALIAS is specified, then the program will look for an fstab(5) style configuration in:
        - $HOME/.ecryptfs/ALIAS.conf and for key signature(s) in:
        - $HOME/.ecryptfs/ALIAS.sig

       The mounting will proceed if, and only if:
         - the required passphrase is in their kernel keyring, and
         - the current user owns both the SOURCE and DESTINATION mount points
         - the DESTINATION is not already mounted

       This program will:
         - mount SOURCE onto DESTINATION
         - as an ecryptfs filesystem
         - using the AES cipher
         - with a key length of 16 bytes
         - using the passphrase whose signature is in ~/.ecryptfs/Private.sig

       The only setuid operation in this program is the call to mount(8) or umount(8).

       The ecryptfs-setup-private(1) utility will create the  ~/.Private  and  ~/Private  directories,  generate  a  mount  passphrase,  wrap  the
       passphrase, and write the ~/.ecryptfs/Private.sig.

       The  system  administrator  can add the pam_ecryptfs.so module to the PAM stack which will automatically use the login passphrase to unwrap
       the mount passphrase, add the passphrase to the user's kernel keyring, and automatically perform the mount. See pam_ecryptfs(8).

FILES
       ~/.Private - underlying directory containing encrypted data

       ~/Private - mountpoint containing decrypted data (when mounted)

       ~/.ecryptfs/Private.sig - file containing signature of mountpoint passphrase

       ~/.ecryptfs/wrapped-passphrase - mount passphrase, encrypted with the login passphrase

SEE ALSO
       ecryptfs(7), ecryptfs-rewrap-passphrase(1), ecryptfs-setup-private(1), keyctl(1),  mount(8),  umount.ecryptfs_private(1),  pam_ecryptfs(8),
       fstab(5)

       /usr/share/doc/ecryptfs-utils/ecryptfs-faq.html

       http://ecryptfs.org/

AUTHOR
       This  manpage  and  the  mount.ecryptfs_private utility was written by Dustin Kirkland <kirkland@ubuntu.com> for Ubuntu systems (but may be
       used by others).  Permission is granted to copy, distribute and/or modify this document under the terms of the GNU General Public  License,
       Version 2 or any later version published by the Free Software Foundation.

       On Debian and Ubuntu systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

ecryptfs-utils                                                      2008-07-21                                           mount.ecryptfs_private(1)
