GRUB-SYSLINUX2CFG(1)                                                                       General Commands Manual                                                                       GRUB-SYSLINUX2CFG(1)



NAME
       grub-syslinux2cfg — Transform a syslinux config file into a GRUB config.


SYNOPSIS
       grub-syslinux2cfg [-c | --cwd=DIR] [-r | --root=DIR] [-v | --verbose]
                         [-t | --target-root=DIR] [-T | --target-cwd=DIR]
                         [-o | --output=FILE] [[-i | --isolinux] |
                                               [-s | --syslinux] |
                                               [-p | --pxelinux]] FILE


DESCRIPTION
       grub-syslinux2cfg builds a GRUB configuration file out of an existing syslinux configuration file.


OPTIONS
       --cwd=DIR
              Set DIR as syslinux's working directory.  The default is to use the parent directory of the input file.


       --root=DIR
              Set DIR as the root directory of the syslinux disk.  The default value is "/".


       --verbose
              Print verbose messages.


       --target-root=DIR
              Root directory as it will be seen at runtime.  The default value is "/".


       --target-cwd=DIR
              Working directory of syslinux as it will be seen at runtime.  The default value is the parent directory of the input file.


       --output=FILE
              Write the new config file to FILE.  The default value is standard output.


       --isolinux
              Assume that the input file is an isolinux configuration file.


       --pxelinux
              Assume that the input file is a pxelinux configuration file.


       --syslinux
              Assume that the input file is a syslinux configuration file.


SEE ALSO
       info grub



                                                                                               Wed Feb 26 2014                                                                           GRUB-SYSLINUX2CFG(1)
