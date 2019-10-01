GRUB-SET-DEFAULT(1)                                                                        General Commands Manual                                                                        GRUB-SET-DEFAULT(1)



NAME
       grub-set-default — Set the default boot menu entry for GRUB.


SYNOPSIS
       grub-set-default [--boot-directory=DIR] MENU_ENTRY


DESCRIPTION
       grub-set-default sets the default boot menu entry for all subsequent boots.  This command only works for GRUB configuration files created with GRUB_DEFAULT=saved in /etc/default/grub.


OPTIONS
       --boot-directory=DIR
              Find GRUB images under DIR/grub.  The default value is /boot, resulting in grub images being search for at /boot/grub.


       MENU_ENTRY
              A number, a menu item title or a menu item identifier.


SEE ALSO
       info grub



                                                                                               Wed Feb 26 2014                                                                            GRUB-SET-DEFAULT(1)
