SBATTACH(1)                                  User Commands                                 SBATTACH(1)

NAME
       sbattach - UEFI secure boot detached signature tool

SYNOPSIS
       sbattach --attach <sigfile> <efi-boot-image>
       sbattach --detach <sigfile> [--remove] <efi-boot-image>
       sbattach --remove <efi-boot-image>

DESCRIPTION
       Attach or detach a signature file to/from a boot image

OPTIONS
       --attach <sigfile>
              set <sigfile> as the boot image's signature table

       --detach <sigfile>
              copy the boot image's signature table to <sigfile>

       --remove
              remove the boot image's signature table from the original file

       --signum
              signature to operate on (defaults to first)

sbattach 0.9.2                                 May 2019                                    SBATTACH(1)
