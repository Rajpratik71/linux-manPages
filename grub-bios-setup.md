GRUB-BIOS-SETUP(8)                  System Administration Utilities                 GRUB-BIOS-SETUP(8)

NAME
       grub-bios-setup - set up a device to boot using GRUB

SYNOPSIS
       grub-bios-setup [OPTION...] DEVICE

DESCRIPTION
       Set up images to boot from DEVICE.

       You should not normally run this program directly.  Use grub-install instead.

       -a, --allow-floppy
              make  the  drive  also  bootable  as floppy (default for fdX devices). May break on some
              BIOSes.

       -b, --boot-image=FILE
              use FILE as the boot image [default=boot.img]

       -c, --core-image=FILE
              use FILE as the core image [default=core.img]

       -d, --directory=DIR
              use GRUB files in the directory DIR [default=/boot/grub]

       -f, --force
              install even if problems are detected

       -m, --device-map=FILE
              use FILE as the device map [default=/boot/grub/device.map]

       --no-rs-codes
              Do not apply any reed-solomon codes when embedding core.img. This option is only  avail‐
              able on x86 BIOS targets.

       -s, --skip-fs-probe
              do not probe for filesystems in DEVICE

       -v, --verbose
              print verbose messages.

       -?, --help
              give this help list

       --usage
              give a short usage message

       -V, --version
              print program version

       Mandatory  or  optional arguments to long options are also mandatory or optional for any corre‐
       sponding short options.

       DEVICE must be an OS device (e.g. /dev/sda).

REPORTING BUGS
       Report bugs to <bug-grub@gnu.org>.

SEE ALSO
       grub-install(8), grub-mkimage(1), grub-mkrescue(1)

       The full documentation for grub-bios-setup is maintained as a Texinfo manual.  If the info  and
       grub-bios-setup programs are properly installed at your site, the command

              info grub-bios-setup

       should give you access to the complete manual.

grub-bios-setup (GRUB) 2.04-1ubuntu12.1      November 2019                          GRUB-BIOS-SETUP(8)
