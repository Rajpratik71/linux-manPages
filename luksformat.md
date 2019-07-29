LUKSFORMAT(8)                                                 Administrative commands                                                LUKSFORMAT(8)

NAME
       luksformat - Create and format an encrypted LUKS device

SYNOPSIS
       luksformat [-t fstype] device [ mkfs options ]

DESCRIPTION
       luksformat is a wrapper around cryptsetup and mkfs which provides an easy interface for creating an encrypted device that follows the LUKS
       standard and for putting a file system onto the encrypted device.

       The default file system is vfat since that is most commonly used on removable devices. However, you can specify any available file system
       with the -t option.

SEE ALSO
       cryptsetup(8), mkfs(8)

AUTHOR
       This program was written by Martin Pitt <martin.pitt@ubuntu.com>.

                                                                    2016-04-29                                                       LUKSFORMAT(8)
