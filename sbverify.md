SBVERIFY(1)                                                                                  User Commands                                                                                 SBVERIFY(1)

NAME
       sbverify - UEFI secure boot verification tool

SYNOPSIS
       sbverify [options] --cert <certfile> <efi-boot-image>

DESCRIPTION
       Verify a UEFI secure boot image.

OPTIONS
       --cert <certfile>
              certificate (x509 certificate)

       --no-verify
              don't perform certificate verification

       --detached <file>
              read signature from <file>, instead of looking for an embedded signature

sbverify 0.6                                                                                 February 2018                                                                                 SBVERIFY(1)
