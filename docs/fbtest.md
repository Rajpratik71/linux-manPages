FBTEST(8)                                                                                   International Support                                                                                   FBTEST(8)



NAME
       fbtest - test if a virtual console is mapped to a frame buffer devive

SYNOPSIS
       fbtest [-f <fb_device>] [-C <vc_device>]
       fbtest --help

DESCRIPTION
       The program fbtest(8) is used to test if a virtual console, e.g.  /dev/tty1 is mapped on a frame buffer device.

OPTIONS
       -f, --fb=<fb_device>
              This option specifies an other frame buffer device than the default /dev/fb0.

       -C, --vc=<vc_device>
              This option specifies an other virtual console than the default /dev/tty1.

EXIT STATUS
       0    The virtual console is mapped onto a frame buffer device.

       1    The virtual console is not mapped onto a frame buffer device.

FILES
       /dev/fb0
       /dev/tty<1...63>

SEE ALSO
       fbset(8).



0.42                                                                                             May 6, 2008                                                                                        FBTEST(8)
