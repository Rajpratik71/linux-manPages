UPDATE-BOOTLOADER(1)                                                                 User Contributed Perl Documentation                                                                 UPDATE-BOOTLOADER(1)



NAME
       update-bootloader - update/change bootloader configuration using
           Bootloader::Tools perl module

SYNOPSIS
       update-bootloader [operation] [options]

       operation is one of --add, --remove, --refresh or --reinit.

       valid options are --help, --man, --image <file>, --initrd <file>, --xen-kernel <file>, --xen, --default, --previous, --name <string>, --force, --force-default.

DESCRIPTION
       update-bootloader will let you modify your bootloader configuration using Bootloader::Tools perl module.

OPERATIONS
       --add   add an new image section.  Needs a call to --refresh to take effect.

       --remove
               remove the specified image section.  Needs a call to --refresh to take effect.

       --refresh
               activate the new config and write boot loader to disk if necessary

       --reinit
               reinitize the bootloader by refreshing config and reinstalling it

PARAMETER
       --help  Print a brief help message and exits.

       --man   Prints the manual page and exits.

       --image file
               specify path to kernel image

       --initrd file
               specify path to initrd file

       --xen   specify that you what to add a xen and not a regular image section

       --xen-kernel file
               specify that you what to add a xen section with a specific image.  Implies --xen option.

       --default
               let the new section to be added be the default section if appropriate. Only allowed together with --add operation

       --previous
               set some usuable defaults for image, initrd and name when

       --name string
               specify the name of the section to be added/removed

       --force dont complain, just do the right thing

       --force-default
               force the new section to be added to be the default section. Only allowed together with --add operation



perl v5.18.2                                                                                      2017-05-12                                                                             UPDATE-BOOTLOADER(1)
