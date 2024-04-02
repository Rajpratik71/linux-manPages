LOADNDISDRIVER(8)                                             System Manager's Manual                                            LOADNDISDRIVER(8)

NAME
       loadndisdriver - Userspace ndis driver loader for the ndiswrapper Linux kernel module

SYNOPSIS
       loadndisdriver

DESCRIPTION
       loadndisdriver  is  a  support  program for the ndiswrapper Linux kernel module. The ndiswrapper kernel module uses it to load ndis drivers
       that have been installed via the ndiswrapper(8) tool.

       loadndisdriver should not be used directly, only the kernel module should use it. Therefore, it's options  are  volatile,  and  subject  to
       change during the development of the ndiswrapper kernel module.

       The /etc/ndiswrapper directory is expected to contain the ndis files that loadndisdriver requires.

SEE ALSO
       ndiswrapper(8)

AUTHOR
       This manual page was written by Kel Modderman <kelrin@tpg.com.au>, for the Debian project (but may be used by others).

                                                                September 17, 2006                                               LOADNDISDRIVER(8)
