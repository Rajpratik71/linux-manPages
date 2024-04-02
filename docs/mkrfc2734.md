MKRFC2734(1)                                                                               General Commands Manual                                                                               MKRFC2734(1)



NAME
       mkrfc2734 - Make Linux 2.4 IP over IEEE 1394 capable.

SYNOPSIS
       mkrfc2734

DESCRIPTION
       mkrfc2734  adds  entries to the Linux IEEE 1394 Configuration ROM to describe itself to other nodes on the bus as being capable of performing IP over IEEE 1394 (RFC 2734) duties. This utility is not
       necessary for Linux 2.6 as there is a kernel configuration option to enable this. This command takes no arguments and requires raw1394 kernel module,  libraw1394  library,  and  /dev/raw1394  device
       file. Also, it makes absolutely no sense to run this unless you have also loaded the eth1394 kernel module--the bits that do the real work!

AUTHORS
       mkrfc2734 and this man page was written by Dan Dennedy <dan@dennedy.org>.




                                                                                                February 2005                                                                                    MKRFC2734(1)
