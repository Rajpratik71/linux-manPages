IMPLANTISOMD5(1)                                                                           General Commands Manual                                                                           IMPLANTISOMD5(1)



NAME
       implantisomd5 — implant an MD5 checksum in an ISO9660 image

SYNOPSIS
       implantisomd5 [--force]  [--supported-iso]  [isofilename]

DESCRIPTION
       This  manual  page  documents  briefly the implantisomd5 command. implantisomd5 is a program that embeds an MD5 checksum in an unused section of and ISO9660 (.iso) image.  This checksum can later be
       compared to the .iso, or a block device, using the corresponding checkisomd5 command.

OPTIONS
       --force   Force an existing checksum to be overwritten.

       --supported-iso
                 Indicate that the image will be written to a "supported" media, such as pressed CD.  On Red Hat-based Anaconda installers, this bypasses the prompt to check the CD.

SEE ALSO
       checkisomd5 (1).



                                                                                                                                                                                             IMPLANTISOMD5(1)
