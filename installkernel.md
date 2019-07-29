INSTALLKERNEL(8)                                              System Manager's Manual                                             INSTALLKERNEL(8)

NAME
       installkernel - install a new kernel image

SYNOPSIS
       installkernel version zImage System.map [directory]

DESCRIPTION
       installkernel installs a new kernel image onto the system from the Linux source tree.  It is called by the Linux kernel makefiles when make
       install is invoked there.

       The new kernel is installed into {directory}/vmlinuz-{version}.  If a symbolic link {directory}/vmlinuz already exists, it is refreshed  by
       making a link from {directory}/vmlinuz to the new kernel, and the previously installed kernel is available as {directory}/vmlinuz.old.

BUGS
       installkernel  resides  in  /sbin  only because the Linux kernel makefiles call it from there.  It should really be in /usr/sbin.  It isn't
       needed to boot a system.

Debian Linux                                                        7 Jan 2001                                                    INSTALLKERNEL(8)
