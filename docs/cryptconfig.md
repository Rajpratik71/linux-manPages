CRYPTCONFIG(8)                                                                             System Manager's Manual                                                                             CRYPTCONFIG(8)



NAME
       cryptconfig - configure encrytped home directories and LUKS partitions

SYNOPSIS
       cryptconfig [COMMAND] [COMMAND-OPTIONS] [arg1] [arg2] ...

DESCRIPTION
       Cryptconfig is a utility for configuring encrypted home directories.  It also supports creating LUKS disk images, creating LUKS partitions, and enlarging disk images along with their file systems.

COMMANDS
       The following commands are supported:

       make-ehd
              Create a new encrypted home directory image and image key.

       passwd Change the password used to encrypt an image key.

       create-image
              Create an abrbitrary LUKS disk image.

       enlarge-image
               Enlarge a disk image and it's file system.

       format Create a LUKS partition on a device.

       pm-enable
              Enable pam_mount with encrypted home directories.

       pm-disable
              Disable pam_mount with encrypted home directories.

       create-key
              Create a new key that can be added to an image.

       open   Open a LUKS image

       close  Close devices using a LUKS image

SEE ALSO
       cryptsetup(8), pam_mount(8)



                                                                                                                                                                                               CRYPTCONFIG(8)
