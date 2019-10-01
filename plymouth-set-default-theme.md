PLYMOUTH-SET-DEFAU(1)                                                                           User Commands                                                                           PLYMOUTH-SET-DEFAU(1)



NAME
       plymouth-set-default-theme - Set the plymouth theme

SYNOPSIS
       plymouth-set-default-theme [OPTION...] [THEME]

DESCRIPTION
       When called with a THEME argument, the plymouth-set-default-theme command changes the preferred boot theme and also performs the necessary regeneration of the initial ramdisk (initrd) since plymouth
       is loaded from the boot loader from the initrd prior to the mounting of the root filesystem.

       If plymouth-set-default-theme is invoked with no options or parameters, it shows the currently selected theme by default. This output is used by the helper scripts plymouth-generate-initrd and
       plymouth-update-initrd to set the proper theme in the initial ramdisk.

OPTIONS
       The following options are understood:

       -h, --help
           Show summary of options.

       -l, --list
           List available themes.

       -r, --reset
           Reset to default theme.

       -R, --rebuild-initrd
           Rebuild initrd (necessary after changing theme).

SEE ALSO
       grub(8), plymouth(8), plymouthd(8), plymouth(1), http://www.freedesktop.org/wiki/Software/Plymouth



plymouth                                                                                                                                                                                PLYMOUTH-SET-DEFAU(1)
