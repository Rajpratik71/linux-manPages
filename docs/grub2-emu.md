GRUB-EMU(1)                                                                                     User Commands                                                                                     GRUB-EMU(1)



NAME
       grub-emu - GRUB emulator

SYNOPSIS
       grub-emu [OPTION...]

DESCRIPTION
       GRUB emulator.

       -d, --directory=DIR
              use GRUB files in the directory DIR [default=/boot/grub2]

       -H, --hold[=SECS]
              wait until a debugger will attach

       -m, --device-map=FILE
              use FILE as the device map [default=/boot/grub2/device.map]

       --memdisk=FILE
              use FILE as memdisk

       -r, --root=DEVICE_NAME
              Set root device.

       -v, --verbose
              print verbose messages.

       -X, --kexec
              try the untryable.

       -?, --help
              give this help list

       --usage
              give a short usage message

       -V, --version
              print program version

       Mandatory or optional arguments to long options are also mandatory or optional for any corresponding short options.

REPORTING BUGS
       Report bugs to <bug-grub@gnu.org>.

SEE ALSO
       If you are trying to install GRUB, then you should use grub-install(8) rather than this program.

       The full documentation for grub-emu is maintained as a Texinfo manual.  If the info and grub-emu programs are properly installed at your site, the command

              info grub-emu

       should give you access to the complete manual.



grub-emu (GRUB2) 2.02                                                                             July 2017                                                                                       GRUB-EMU(1)
