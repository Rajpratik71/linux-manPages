linux-boot-prober(1)                                                                       General Commands Manual                                                                       linux-boot-prober(1)



NAME
       linux-boot-prober — Determine boot characteristics of a specified device.

SYNOPSIS
       linux-boot-prober <partition>

DESCRIPTION
       The linux-boot-prober utility will try to work out how to boot the linux root partition specified by <partition>.  If successful, it will outoput one or more lines of the form:

       <root partition>:<boot partition>:<label>:<kernel path>:<initrd path>:<kernel parameters>

       For example, for a system with a kernel at /boot/vmlinuz and an initramfs at /boot/initrd.gz, and with / on /dev/sda2 and /boot on /dev/sda1, the command "linux-boot-prober /dev/sda1" will display:

       /dev/sda2:/dev/sda1:Linux:/vmlinuz:/initrd.gz:root=/dev/sda1

       Some partitions will not be displayed by linux-boot-prober.  If a partition is mounted on /, /target, or /target/boot, it will be skipped.

SEE ALSO
       os-prober(1)



linux-boot-prober                                                                                20 Jan 2014                                                                             linux-boot-prober(1)
