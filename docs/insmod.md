INSMOD(8)                                                                                       insmod                                                                                       INSMOD(8)

NAME
       insmod - Simple program to insert a module into the Linux Kernel

SYNOPSIS
       insmod [filename] [module options...]

DESCRIPTION
       insmod is a trivial program to insert a module into the kernel. Most users will want to use modprobe(8) instead, which is more clever and can handle module dependencies.

       Only the most general of error messages are reported: as the work of trying to link the module is now done inside the kernel, the dmesg usually gives more information about errors.

COPYRIGHT
       This manual page originally Copyright 2002, Rusty Russell, IBM Corporation. Maintained by Jon Masters and others.

SEE ALSO
       modprobe(8), rmmod(8), lsmod(8), modinfo(8)

AUTHORS
       Jon Masters <jcm@jonmasters.org>
           Developer

       Lucas De Marchi <lucas.de.marchi@gmail.com>
           Developer

kmod                                                                                          11/12/2018                                                                                     INSMOD(8)
