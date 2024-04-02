GRUB-EDITENV(1)                                                                              User Commands                                                                             GRUB-EDITENV(1)

NAME
       grub-editenv - edit GRUB environment block

SYNOPSIS
       grub-editenv [OPTION...] FILENAME COMMAND

DESCRIPTION
       Tool to edit environment block.

              Commands:

       create Create a blank environment block file.

       list   List the current variables.

       set [NAME=VALUE ...]
              Set variables.

       unset [NAME ...]
              Delete variables.

       -?, --help
              give this help list

       --usage
              give a short usage message

       -v, --verbose
              print verbose messages.

       -V, --version
              print program version

              Options:

       If FILENAME is `-', the default value /boot/grub/grubenv is used.

       There is no `delete' command; if you want to delete the whole environment block, use `rm /boot/grub/grubenv'.

REPORTING BUGS
       Report bugs to <bug-grub@gnu.org>.

SEE ALSO
       grub-reboot(8), grub-set-default(8)

       The full documentation for grub-editenv is maintained as a Texinfo manual.  If the info and grub-editenv programs are properly installed at your site, the command

              info grub-editenv

       should give you access to the complete manual.

grub-editenv (GRUB) 2.02-2ubuntu8.12                                                         February 2019                                                                             GRUB-EDITENV(1)
