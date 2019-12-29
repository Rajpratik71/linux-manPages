LSINITRAMFS(8)                           System Administration                          LSINITRAMFS(8)

NAME
       lsinitramfs - list content of an initramfs image

SYNOPSIS
       lsinitramfs [-l] initramfs-file...
       lsinitramfs -h

DESCRIPTION
       The  lsinitramfs  command lists the content of given initramfs images. It allows one to quickly
       check the content of one (or multiple) specified initramfs files.

OPTIONS
       -h     Display usage information and exit.

       -l     Display long and more verbose listing of initramfs content.

USAGE EXAMPLES
       List initramfs content of current running kernel:

       lsinitramfs /boot/initrd.img-$(uname -r)

       List content of two initramfs files in verbose mode:

       lsinitramfs -l /boot/vmlinuz-2.6.31-grml64 /boot/vmlinuz-2.6.33-grml64

BUGS
       lsinitramfs cannot deal with multiple-segmented initramfs images, except where an early (uncom‐
       pressed) initramfs with system firmware is prepended to the regular compressed initramfs.

AUTHOR
       The initramfs-tools are written by Maximilian Attems <maks@debian.org> and numerous others.

SEE ALSO
        initramfs-tools(7), mkinitramfs(8), unmkinitramfs(8), update-initramfs(8).

initramfs-tools                               2015/12/09                                LSINITRAMFS(8)
