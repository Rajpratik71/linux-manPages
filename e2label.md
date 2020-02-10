E2LABEL(8)                                                                               System Manager's Manual                                                                               E2LABEL(8)

NAME
       e2label - Change the label on an ext2/ext3/ext4 filesystem

SYNOPSIS
       e2label device [ new-label ]

DESCRIPTION
       e2label will display or change the filesystem label on the ext2, ext3, or ext4 filesystem located on device.

       If the optional argument new-label is not present, e2label will simply display the current filesystem label.

       If  the optional argument new-label is present, then e2label will set the filesystem label to be new-label.  Ext2 filesystem labels can be at most 16 characters long; if new-label is longer than
       16 characters, e2label will truncate it and print a warning message.

       It is also possible to set the filesystem label using the -L option of tune2fs(8).

AUTHOR
       e2label was written by Theodore Ts'o (tytso@mit.edu).

AVAILABILITY
       e2label is part of the e2fsprogs package and is available from http://e2fsprogs.sourceforge.net.

SEE ALSO
       mke2fs(8), tune2fs(8)

E2fsprogs version 1.42.13                                                                        May 2015                                                                                      E2LABEL(8)
