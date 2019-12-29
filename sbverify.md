SBVERIFY(1)                                  User Commands                                 SBVERIFY(1)

NAME
       sbverify - UEFI secure boot verification tool

SYNOPSIS
       sbverify [options] --cert <certfile> <efi-boot-image>

DESCRIPTION
       Verify a UEFI secure boot image.

OPTIONS
       --cert <certfile>
              certificate (x509 certificate)

       --list list all signatures (but don't verify)

       --detached <file>
              read signature from <file>, instead of looking for an embedded signature

sbverify 0.9.2                                 May 2019                                    SBVERIFY(1)
