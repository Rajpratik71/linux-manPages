MKELFIMAGE(8)                                                 System Manager's Manual                                                MKELFIMAGE(8)

NAME
       mkelfImage - make an elf network bootable image for linux

SYNOPSIS
       mkelfImage [--command-line=command line] [--kernel=path to vmlinux] [--ramdisk=path to ramdisk] [--output=file] [--ramdisk-base=<start
       addr>]

DESCRIPTION
       mkelfImage is a program that makes a elf boot image for linux kernel images.  The image should work with any i386 multiboot compliant boot
       loader, an ELF bootloader that passes no options, a loader compliant with the linuxBIOS elf booting spec or with the linux kexec kernel
       patch.  A key feature here is that nothing relies upon BIOS calls, but they are made when necessary.  This is useful for systems running
       linuxbios.

BUGS
       Not all kernel parameters can be passed with the multiboot image format.  ip configuration is not automatically passed to a node.  The
       ramdisk base is hard coded to 8MB by default.  This man page need to be updated.

SEE ALSO
       The kexec kernel patch.  LinuxBIOS.  Etherboot.  The multiboot standard.

COPYRIGHT
       mkelfImage is under the GNU Public License version 2

AUTHOR
       Eric Biederman <ebiederman@lnxi.com>

3rd Berkeley Distribution                                          RELEASE_DATE                                                      MKELFIMAGE(8)
