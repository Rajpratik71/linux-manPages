MKDUMPRD(8)                                                                                      User Manuals                                                                                     MKDUMPRD(8)



NAME
       mkdumprd - (Re)build the initramfs for kdump

SYNOPSIS
       mkdumprd [-h] [-q] [-f] [-k kernelver] [-i opts]

DESCRIPTION
       mkdumprd (re-)builds the kdump initrd. For kdump, a special initrd is used because

       ·   the kdump initrd should include network modules and network configuration (and therefore is larger as the normal initrd used for booting),

       ·   the kdump initrd should use no splash screen,

       ·   the kdump initrd includes kdumptool(8) and all required libraries.

       This script calls mkinitrd(8) with all required parameters. If the initrd already exists, it checks first if the configuration file or the kernel are newer, and only rebuilds the initrd if
       necessary.

OPTIONS
       All option parsing is done via the getopt(3) function, and therefore follows all standard command line parsing rules.

       -h | --help
           Shows help output and exits.

       -k kernelversion
           Specifies the kernel version. If no version is specified and also no kernel or initrd are specified, then mkdumprd uses kdumptool(8) to find out the correct kernel and initrd.

       -K kernel
           Specifies the kernel binary. If you specify that option, also specify -I.

       -I initrd
           Specifies the resulting initrd. If you specify that option, also specify -K.

       -q
           Be quiet. Don’t output status messages. Used to call mkdumprd(8) from /etc/init.d/kdump init script.

       -i parameters
           Append the specified parameters to mkinitrd(8) call.

FILES
       /etc/sysconfig/kdump
           Kdump configuration. See kdump(5).

BUGS
       Please report bugs and enhancement requests at https://bugzilla.novell.com.

COPYING
       Copyright (c) 2008 Bernhard Walle <bwalle@suse.de>. Free use of this software is granted under the terms of the GNU General Public License (GPL), version 2 or later.

SEE ALSO
       kdumptool(8), mkinitrd(8), http://en.opensuse.org/Kdump

AUTHOR
       Bernhard Walle <bwalle@suse.de>
           Author.



kdump 0.8.16                                                                                      07/04/2017                                                                                      MKDUMPRD(8)
