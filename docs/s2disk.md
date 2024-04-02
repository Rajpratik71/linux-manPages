S2DISK(8)                                       s2disk                                       S2DISK(8)

NAME
       s2disk - program to suspend to disk (hibernate)

SYNOPSIS
       s2disk [-h, --help] [-V, --version] [-f, --config config_file] [-r, --resume_device device]
              [-o, --resume_offset offset] [-s, --image_size size] [-P, --parameter parameter]

DESCRIPTION
       This manual page documents briefly the s2disk, s2both and resume commands.

       s2disk is a program that will save the state of the whole system to disk and power off your
       system. After restarting your system it will be put back in the exact system state you left it
       (this is sometimes called hibernation).

       s2both will do precisly the same as s2disk except that it will not power off the system, but
       will suspend it to ram (put the system in S3 mode). This has the advantage that resume will be
       faster, with the disadvantage that you still use batteries. If they batteries do deplete, you
       still have the system state saved to disk and can resume without data loss. The s2both command
       also inherits all command line arguments from s2ram.

       You will need to set up an initramfs which calls the resume program for this to work. If you
       use a package distributed with your Linux distribution, the kernel package which was made with
       the --initrd option and you use mkinitramfs-tools, this package should include the necessary
       parts on your initramfs.

       The uswsusp system supports encrypting the image written to disk and features a splash system,
       see uswsusp.conf(5) for more information.

OPTIONS
       -f, --config [file]
           Specify alternate configuration file.

       -h, --help
           Display help.

       -r, --resume_device [device]
           Device that contains swap area.

       -o, --resume_offset [offset]
           Offset of swap file in resume device.

       -s, --image_size [size]
           Desired size of the image.

       -P, --parameter [key=value]
           Override any config file parameter (see uswsusp.conf(5)).

       For the meaning and use of the resume_size, resume_offset and image_size options see
       uswsusp.conf(5).

SEE ALSO
       uswsusp.conf(5), suspend-keygen(8), s2ram(8)

       For more information see the README file.

AUTHOR
       This manual page was written by Tim Dijkstra <tim@famdijkstra>.org for the Debian(TM) system
       (but may be used by others). Was updated by Rodolfo García <kix@kix.es>. Permission is granted
       to copy, distribute and/or modify this document under the terms of the GNU General Public
       License, Version 2 any later version published by the Free Software Foundation.

COPYRIGHT
       Copyright © 2006 Tim Dijkstra Copyright © 2012 Rodolfo García (kix)

uswsusp                                      Feb 29, 2012                                    S2DISK(8)
