CHECKISOMD5(1)                                                                             General Commands Manual                                                                             CHECKISOMD5(1)



NAME
       checkisomd5 — check an MD5 checksum implanted by implantisomd5

SYNOPSIS
       checkisomd5 [--md5sumonly]  [--verbose]  [--gauge]  [isofilename  | blockdevice ]

DESCRIPTION
       This  manual  page  documents briefly the checkisomd5 command.  checkisomd5 is a program that checks an embedded MD5 checksum in a ISO9660 image (.iso), or block device.  The checksum is embedded by
       the corresponding implantisomd5 command.

       The check can be aborted by pressing Esc key.

EXIT STATUS
       Program returns exit status 0 if the checksum is correct, 1 if the checksum is incorrect or non-existent, or 2 if the check was aborted.

OPTIONS
       --md5sumonly
                 Do not check the target.  Instead, output human-readable information about the target's checksums.

       --verbose Display human-readable progress as the target is checked.  Without this option, nothing is outputted except errors.

       --gauge   Display a series of numbers from 0 to 100, corresponding to check progress.  This output can be piped to dialog --gauge for a user-friendly progress bar.

SEE ALSO
       implantisomd5 (1).



                                                                                                                                                                                               CHECKISOMD5(1)
