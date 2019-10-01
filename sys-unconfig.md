SYS-UNCONFIG(8)                                                                            System Manager's Manual                                                                            SYS-UNCONFIG(8)



NAME
       sys-unconfig - shell script to reconfigure the system upon next boot

SYNOPSIS
       sys-unconfig

DESCRIPTION
       sys-unconfig provides a simple method of reconfiguring a system in a new environment. Upon executing sys-unconfig will poweroff your system, and run firstboot at next boot.


FILES
       /.unconfigured      The presence of this file will trigger firsboot.

NOTES
       This utility should not be used for creating cloud or virtual machine images.  For that use please see virt-sysprep.


SEE ALSO
       virt-sysprep(1)


AUTHORS
       H.J. Lu <hjl@valinux.com>



                                                                                               Wed Jul 28 1999                                                                                SYS-UNCONFIG(8)
