LSINITRD(1)                                                                                         dracut                                                                                        LSINITRD(1)



NAME
       lsinitrd - tool to show the contents of an initramfs image

SYNOPSIS
       lsinitrd [OPTION...] [<image> [<filename> [<filename> [...] ]]]

       lsinitrd [OPTION...] -k <kernel-version>

DESCRIPTION
       lsinitrd shows the contents of an initramfs image. if <image> is omitted, then lsinitrd uses the default image /boot/<machine-id>/<kernel-version>/initrd or /boot/initramfs-<kernel-version>.img.

OPTIONS
       -h, --help
           print a help message and exit.

       -s, --size
           sort the contents of the initramfs by size.

       -f, --file <filename>
           print the contents of <filename>.

       -k, --kver <kernel version>
           inspect the initramfs of <kernel version>.

AVAILABILITY
       The lsinitrd command is part of the dracut package and is available from https://dracut.wiki.kernel.org

AUTHORS
       Harald Hoyer

       Amerigo Wang

       Nikoli

SEE ALSO
       dracut(8)



dracut                                                                                            09/12/2013                                                                                      LSINITRD(1)
