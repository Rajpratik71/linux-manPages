GRUB-SET-DEFAULT(8)                                                                 System Administration Utilities                                                                GRUB-SET-DEFAULT(8)

NAME
       grub-set-default - set the saved default boot entry for GRUB

SYNOPSIS
       grub-set-default [OPTION] MENU_ENTRY

DESCRIPTION
       Set the default boot menu entry for GRUB.  This requires setting GRUB_DEFAULT=saved in /etc/default/grub.

       -h, --help
              print this message and exit

       -V, --version
              print the version information and exit

       --boot-directory=DIR
              expect GRUB images under the directory DIR/grub instead of the /boot/grub directory

       MENU_ENTRY is a number, a menu item title or a menu item identifier.

REPORTING BUGS
       Report bugs to <bug-grub@gnu.org>.

SEE ALSO
       grub-reboot(8), grub-editenv(1)

       The full documentation for grub-set-default is maintained as a Texinfo manual.  If the info and grub-set-default programs are properly installed at your site, the command

              info grub-set-default

       should give you access to the complete manual.

grub-set-default (GRUB) 2.02-2ubuntu8.12                                                     February 2019                                                                         GRUB-SET-DEFAULT(8)
