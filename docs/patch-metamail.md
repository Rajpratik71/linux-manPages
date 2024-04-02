patch-metamail(1)                                                                          General Commands Manual                                                                          patch-metamail(1)



NAME
       patch-metamail - Install a patch to the latest metamail release

SYNOPSIS
       patch-metamail   source-tree-root patch-number [hostname [dirname [prefix]]]

DESCRIPTION
       The patch-metamail program will attempt to retreive a patch file for the metamail distribution, using anonymous ftp to a trusted server, and then install that patch in your local copy of the distri-
       bution.

       The first two arguments, which are required, are the root directory of your local copy of the metamail source directory, and the patch number.  The former is site-dependent,  the  latter  is  patch-
       dependent.

       In general, patch-metamail is intended to be called via metamail, with a mailcap entry like the following:

       application/x-metamail-patch;patch-metamail source-tree-root %{patchnumber}; needsterminal

       The  default  values for the host to ftp to, the directory name to retrieve the file from, and the patch file name prefix are hard-wired to thumper.bellcore.com, pub/nsb, and "mm.patch.".  While you
       can override these on the command line, it would be a big mistake to make these parameterized based on the contents of a mail message, because then someone could spoof you into retrieving a new ver-
       sion of metamail with a Trojan horse from their site!  However, as long as you retain control over what host and directory the patches are retrieved from, this program is reasonably safe (as safe as
       the host you're depending on, anyway).


SEE ALSO
       metamail(1)

COPYRIGHT
       Copyright (c) 1991 Bell Communications Research, Inc. (Bellcore)

       Permission to use, copy, modify, and distribute this material for any purpose and without fee is hereby granted, provided that the above copyright notice and this permission  notice  appear  in  all
       copies,  and that the name of Bellcore not be used in advertising or publicity pertaining to this material without the specific, prior written permission of an authorized representative of Bellcore.
       BELLCORE MAKES NO REPRESENTATIONS ABOUT THE ACCURACY OR SUITABILITY OF THIS MATERIAL FOR ANY PURPOSE.  IT IS PROVIDED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.

AUTHOR
       Nathaniel S. Borenstein, Bellcore



                                                                                                  Release 1                                                                                 patch-metamail(1)
