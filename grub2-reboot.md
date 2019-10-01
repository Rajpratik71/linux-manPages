GRUB-REBOOT(3)                                                                             Library Functions Manual                                                                            GRUB-REBOOT(3)



NAME
       grub-reboot — Set the default boot menu entry for the next boot only.


SYNOPSIS
       grub-reboot [--boot-directory=DIR] MENU_ENTRY


DESCRIPTION
       grub-reboot  sets  the  default  boot  menu  entry  for  the  next  boot,  but  not further boots after that.  This command only works for GRUB configuration files created with GRUB_DEFAULT=saved in
       /etc/default/grub.


OPTIONS
       --boot-directory=DIR
              Find GRUB images under DIR/grub.  The default value is /boot, resulting in grub images being search for at /boot/grub.


       MENU_ENTRY
              A number, a menu item title or a menu item identifier.


SEE ALSO
       info grub



                                                                                               Wed Feb 26 2014                                                                                 GRUB-REBOOT(3)
