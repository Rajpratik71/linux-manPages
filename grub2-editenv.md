GRUB-EDITENV(1)                                                                            General Commands Manual                                                                            GRUB-EDITENV(1)



NAME
       grub-editenv — Manage the GRUB environment block.


SYNOPSIS
       grub-editenv [-v | --verbose] [FILE]
                     <create | list | set NAME=VALUE | unset NAME>


DESCRIPTION
       grub-editenv is a command line tool to manage GRUB's stored environment.


OPTIONS
       --verbose
              Print verbose messages.


       FILE
              File name to use for grub environment.  Default is /boot/grub/grubenv .


COMMANDS
       create
              Create a blank environment block file.


       list
              List the current variables.


       set [NAME=VALUE ...]
              Set variables.


       unset [NAME ...]
              Delete variables.


SEE ALSO
       info grub



                                                                                               Wed Feb 26 2014                                                                                GRUB-EDITENV(1)
