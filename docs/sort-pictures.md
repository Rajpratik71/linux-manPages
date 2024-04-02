SORT-PICTURES(1)                                                                                                                  SORT-PICTURES(1)

NAME
       sort-pictures - sort pictures according to exif date

SYNOPSIS
       sort-pictures

DESCRIPTION
       Sort-pictures  uses  the exif tags in jpeg pictures recovered by recoverjpeg in directories.  It creates hard links to organize sorted pic‐
       tures.

       Running sort-pictures will scan the current directory for files named after the template image?????*.jpg (image followed by at  least  five
       characters followed by .jpg).  A new hardlink will be created for each file in one of the following directories:

       · invalid The picture is an invalid JFIF file.

       · small The picture size is less than 100,000 bytes.

       · undated Sort-pictures was unable to determine the date of the picture from the exif tags.

       · YYYY-MM-DD A directory representing the date at which the picture was taken.

SEE ALSO
       recoverjpeg(1) remove-duplicates(1)

COPYRIGHT
       Copyright  (c) 2004-2013 Samuel Tardieu <sam@rfc1149.net>.  This is free software; see the source for copying conditions.  There is NO war‐
       ranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

AUTHORS
       Samuel Tardieu <sam@rfc1149.net>.

User Manuals                                                    September 22, 2015                                                SORT-PICTURES(1)
