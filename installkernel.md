INSTALLKERNEL(8)                                                                           System Manager's Manual                                                                           INSTALLKERNEL(8)



NAME
       installkernel - tool to script kernel installation


SYNOPSIS
       installkernel <kernel-version> <bootimage> <mapfile>


DESCRIPTION
       installkernel installs a new kernel image onto the system from the Linux source tree. It is called by the Linux kernel makefiles when make install is invoked there.

       The  new  kernel  is installed into {directory}/vmlinuz-{version}. If a symbolic link {directory}/vmlinuz already exists, it is refreshed by making a link from {directory}/vmlinuz to the new kernel,
       and the previously installed kernel is available as {directory}/vmlinuz.old.


SEE ALSO
       grubby(8) new-kernel-pkg(8)


AUTHORS
       Erik Troan
       Jeremy Katz
       Peter Jones



                                                                                               Wed Apr 14 2010                                                                               INSTALLKERNEL(8)
