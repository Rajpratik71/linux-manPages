UNMKINITRAMFS(8)                         System Administration                        UNMKINITRAMFS(8)

NAME
       unmkinitramfs - extract content from an initramfs image

SYNOPSIS
       unmkinitramfs [-v] initramfs-file directory
       unmkinitramfs -h

DESCRIPTION
       The  unmkinitramfs  command extracts the content of a given initramfs image using cpio.  If the
       image contains multiple segments, each are passed to cpio in order.

OPTIONS
       -h     Display usage information and exit.

       -v     Display verbose messages about extraction.

USAGE EXAMPLES
       Extract initramfs content of current running kernel:

       unmkinitramfs /boot/initrd.img-$(uname -r) initramfs/

BUGS
       unmkinitramfs cannot deal with multiple-segmented initramfs images, except where an early  (un‐
       compressed) initramfs with system firmware is prepended to the regular compressed initramfs.

AUTHOR
       The initramfs-tools are written by Maximilian Attems <maks@debian.org> and numerous others.

SEE ALSO
        initramfs-tools(7), lsinitramfs(8), mkinitramfs(8), update-initramfs(8).

initramfs-tools                               2016/12/15                              UNMKINITRAMFS(8)
