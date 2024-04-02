S2RAM(8)                                         s2ram                                        S2RAM(8)

NAME
       s2ram - program to suspend to ram (suspend)

SYNOPSIS

DESCRIPTION
       This manual page documents briefly the s2ram command.

       s2ram is a program that will suspend your system to ram (put it in S3 mode). Which means that
       the system is in a lower power mode. It asked to do so it will wake up farely quickly. However,
       if the system will run out of energy entirely you will lose data. That is why it is recommended
       to use s2both(8) s2ram is only provided to find out any work around needed to make suspend to
       both work. See README.s2ram-whitelist and README.Debian for more information.

OPTIONS
       -V, --version
           Version information.

       -a, --acpi_sleep nr
           set the acpi_sleep parameter before suspend. 1=s3_bios, 2=s3_mode, 3=both. Only for Intel
           platform (x86/amd64).

       -f, --force
           force suspending, even on unknown machines. the following options are only available with
           --force.

       -h, --help
           Short help text.

       -i, --identify
           prints a string that identifies the machine.

       -k, --kmstest
           test if the kernel supports KMS (Kernel Mode Set). Returns 0 if KMS is supported.

       -m, --vbe_mode
           get VBE mode before suspend and set it after resume. Only for Intel platform (x86/amd64).

       -n, --test
           test if the machine is in the database. Returns 0 if known and supported.

       -p, --vbe_post
           VBE POST the graphics card after resume. Only for Intel platform (x86/amd64).

       -r, --radeontool
           turn off the backlight on radeons before suspending. Only for Intel platform (x86/amd64).

       -s, --vbe_save
           save VBE state before suspending and restore after resume. Only for Intel platform
           (x86/amd64).

       -v, --pci_save
           Save the PCI config space of the VGA card before suspend and restore it after resume. Only
           for Intel platform (x86/amd64).

       --nofbsuspend
           do not suspend the framebuffer (for debugging purposes). Only for Intel platform
           (x86/amd64).

SEE ALSO
       s2both (8).

       For more information see the README.s2ram-whitelist.

AUTHOR
       This manual page was written by Tim Dijkstra <tim@famdijkstra>.org for the Debian(TM) system
       (but may be used by others). Was updated by Rodolfo García <kix@kix.es>. Permission is granted
       to copy, distribute and/or modify this document under the terms of the GNU General Public
       License, Version 2 any later version published by the Free Software Foundation.

COPYRIGHT
       Copyright © 2006 Tim Dijkstra Copyright © 2012 Rodolfo García (kix)

uswsusp                                      Feb 29, 2012                                     S2RAM(8)
