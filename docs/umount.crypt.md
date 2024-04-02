umount.crypt(8)                                                                                   pam_mount                                                                                   umount.crypt(8)



Name
       umount.crypt - unmount a dm-crypt encrypted volume

Syntax
       umount.crypt [-n] directory

Options
       -f     This option is ignored (originally is "force unmount for NFS").

       -n     Do not update /etc/mtab.

       -r     Try mounting read-only if unmounting fails. This option is currently not implemented and is ignored.

Description
       umount.crypt will unmount directory and disassociates the underlying crypto device, and loop device if such was used.



pam_mount                                                                                         2008-10-09                                                                                  umount.crypt(8)
