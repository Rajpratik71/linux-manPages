GRUB-PROBE(8)                                                                          System Administration Utilities                                                                          GRUB-PROBE(8)



NAME
       grub-probe - probe device information for GRUB

SYNOPSIS
       grub-probe [OPTION...] [OPTION]... [PATH|DEVICE]

DESCRIPTION
       Probe device information for a given path (or device, if the -d option is given).

       -0     separate items in output using ASCII NUL characters

       -d, --device
              given argument is a system device, not a path

       -m, --device-map=FILE
              use FILE as the device map [default=/boot/grub2/device.map]

       -t, --target=TARGET
              print  TARGET available targets: abstraction, arc_hints, baremetal_hints, bios_hints, compatibility_hint, cryptodisk_uuid, device, disk, drive, efi_hints, fs, fs_label, fs_uuid, gpt_parttype,
              hints_string, ieee1275_hints, msdos_parttype, partmap, zero_check [default=fs]

       -v, --verbose
              print verbose messages.

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
       grub-fstest(1)

       The full documentation for grub-probe is maintained as a Texinfo manual.  If the info and grub-probe programs are properly installed at your site, the command

              info grub-probe

       should give you access to the complete manual.



grub-probe (GRUB2) 2.02                                                                           July 2017                                                                                     GRUB-PROBE(8)
