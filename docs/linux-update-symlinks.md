LINUX-UPDATE-SYMLINKS(1)                                                                General Commands Manual                                                               LINUX-UPDATE-SYMLINKS(1)

NAME
       linux-update-symlinks - maintain symlinks to default kernel and initramfs

SYNOPSIS
       linux-update-symlinks {install|upgrade|remove} VERSION IMAGE-PATH

DESCRIPTION
       linux-update-symlinks  is  intended to be called from the postinst and postrm maintainer scripts of Linux kernel packages.  The postinst script must pass the first argument install or upgrade
       depending on whether a fresh installation or an upgrade has taken place.

       The VERSION argument must be the kernel version string as shown by uname -r and used in filenames.

       The IMAGE-PATH argument must be the absolute filename of the kernel image.

       By default, this command maintains symlinks in the root directory.  This behaviour can be modified by settings in /etc/kernel-img.conf:

       image_dest
              Specifies the directory in which to maintain symlinks
       link_in_boot
              If set to a true value, specifies that the directory is /boot
       no_symlinks
              If set to a false value, disables maintenance of symlinks

       The symlinks for the primary default kernel version are named vmlinuz or vmlinux (depending on whether the architecture normally uses compressed kernel images) and initrd.img (if it  uses  an
       initramfs).  The symlinks for the secondary default have the same names with the suffix .old.

       If symlink maintenance is disabled, linux-update-symlinks does nothing, successfully.  Otherwise it makes a list of kernel versions in decreasing order of priority:

       · The given VERSION, if the first argument is install

       · The current primary default version, if it exists and is not already listed

       · The current secondary default version, if it exists and is not already listed

       · All other versions whose files are installed, excluding the specified VERSION if the first argument is remove, in decreasing version order

       The  top  two  entries  on the list are the new primary and secondary default versions, and it updates the symlinks accordingly.  In case there is only one entry, this is both the primary and
       secondary default version.  If there are no entries, there are no default versions and it removes the default symlinks.

ENVIRONMENT VARIABLES
       INITRD When the first argument is install or upgrade, linux-update-symlinks assumes that the given VERSION will use an initramfs unless this variable is set to No.

FILES
       /boot/initrd.img-*
              Installed initramfs images
       /boot/vmlinuz-* | /boot/vmlinux-*
              Installed kernel images
       /etc/kernel-img.conf
              Configuration file specifying whether and where to create symlinks
       /initrd.img
              Symlink to the initramfs image for the primary default version
       /initrd.img.old
              Symlink to the initramfs image for the secondary default version
       /vmlinuz | /vmlinux
              Symlink to the kernel image for the primary default version
       /vmlinuz.old | /vmlinux.old
              Symlink to the kernel image for the secondary default version

AUTHOR
       linux-update-symlinks and this manual page were written by Ben Hutchings as part of the Debian linux-base package.

SEE ALSO
       kernel-img.conf(5), linux-version(1).

                                                                                              5 June 2016                                                                     LINUX-UPDATE-SYMLINKS(1)
