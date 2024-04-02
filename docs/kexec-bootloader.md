KEXEC-BOOTLOADER(8)                                                                              User Manuals                                                                             KEXEC-BOOTLOADER(8)



NAME
       kexec-bootloader - Load kexec kernel from bootloader configuration

SYNOPSIS
       kexec-bootloader [-D]

DESCRIPTION
       kexec-bootloader takes the default section of bootloader configuration and loads that kernel, initrd with kexec -l and the respective command line.

       Under systemd kexec-bootloader may be invoked by kexec-load.service (/usr/bin/systemctl kexec) to perform a kexec. To emulate previous SLE configurable behaviour where kexec occurs automatically at
       system reboot the systemd reboot target should be altered via 'ln -s /usr/lib/systemd/system/kexec.target /etc/systemd/system/reboot.target

OPTIONS
       -h | --help
           Shows a short usage message.

       -D | --debug
           Prints debugging output.

RETURN VALUE
       The program returns 0 on success and 1 on failure.

BUGS
       Please report bugs and enhancement requests at https://bugzilla.novell.com.

COPYING
       Copyright (c) 2008 Bernhard Walle <bwalle@suse.de>. Free use of this software is granted under the terms of the GNU General Public License (GPL), version 2 or later.

SEE ALSO
       kexec(8)

AUTHOR
       Bernhard Walle <bwalle@suse.de>
           Author.



SUSE                                                                                              07/08/2017                                                                              KEXEC-BOOTLOADER(8)
