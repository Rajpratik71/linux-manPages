os-prober(1)                                                                               General Commands Manual                                                                               os-prober(1)



NAME
       os-prober — Discover bootable partitions on the local system.

SYNOPSIS
       os-prober

DESCRIPTION
       The os-prober utility will scan all disks available on the system for other operating systems.  For each discovered OS, it will output a line of the form:

       <partition>:<descriptive name>:<short name>:<kind of loader>

       For example, on system with Windows XP installed on /dev/sda1, os-prober will display:

       /dev/sda1:Windows NT/2000/XP:WinNT:chain

       Note that for Linux systems that are discovered, a call to linux-boot-prober may be required in order to fully discover the necessary information to boot the system.

SEE ALSO
       linux-boot-prober(1)



os-prober                                                                                        20 Jan 2014                                                                                     os-prober(1)
