GRUB-REBOOT(8)                                                                      System Administration Utilities                                                                     GRUB-REBOOT(8)

NAME
       grub-reboot - set the default boot entry for GRUB, for the next boot only

SYNOPSIS
       grub-reboot [OPTION] MENU_ENTRY

DESCRIPTION
       Set the default boot menu entry for GRUB, for the next boot only.

       -h, --help
              print this message and exit

       -V, --version
              print the version information and exit

       --boot-directory=DIR
              expect GRUB images under the directory DIR/grub instead of the /boot/grub directory

       MENU_ENTRY  is  a number, a menu item title or a menu item identifier. Please note that menu items in submenus or sub-submenus require specifying the submenu components and then the menu item
       component. The titles should be separated using the greater-than character (>) with no extra spaces. Depending on your shell some characters including > may need  escaping.  More  information
       about this is available in the GRUB Manual in the section about the 'default' command.

       NOTE: In cases where GRUB cannot write to the environment block, such as when it is stored on an MDRAID or LVM device, the chosen boot menu entry will remain the default even after reboot.

REPORTING BUGS
       Report bugs to <bug-grub@gnu.org>.

SEE ALSO
       grub-set-default(8), grub-editenv(1)

       The full documentation for grub-reboot is maintained as a Texinfo manual.  If the info and grub-reboot programs are properly installed at your site, the command

              info grub-reboot

       should give you access to the complete manual.

grub-reboot (GRUB) 2.02-2ubuntu8.12                                                          February 2019                                                                              GRUB-REBOOT(8)
