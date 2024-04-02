qemu-make-debian-root(8)                                              Debian                                              qemu-make-debian-root(8)

NAME
       qemu-make-debian-root - Create a debian root image for qemu

SYNOPSIS
       qemu-make-debian-root [-k] [-s] size-in-MiB distrib deburl image [files-to-copy-in-/root]

DESCRIPTION
       qemu-make-debian-root  is  a  command to ease the creation of a debian root image for qemu.  The generated image is not bootable by itself,
       and an external kernel is needed. It can be run with a command like:

              qemu disk.img -kernel /boot/vmlinuz

OPTIONS
       -k     Keep file system.

       -s     Create a sparse image.

SEE ALSO
       qemu(1), qemu-img(1).

AUTHOR
       This manual page was written by Guillem Jover <guillem@debian.org>.

0.0                                                                 2006-05-28                                            qemu-make-debian-root(8)
