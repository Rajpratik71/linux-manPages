DIFFIMG(1)                                                    General Commands Manual                                                   DIFFIMG(1)

NAME
       diffimg - Calculates intersection between two images

SYNOPSIS
       diffimg image1 image2 [outimage]

DESCRIPTION
       diffimg  generates  an image where each pixel is the difference between the corresponding pixel in each of the two source images.  Thus, if
       the source images are the same the resulting image will be black, otherwise it will have regions of non-black where the images differ.

       Currently supports: .png, .gif, .jpg, and .ps by using ghostscript

AUTHOR
       diffimg was written by John Ellson <ellson@research.att.com>

       This manual page was written by David Claughton <dave@eclecticdave.com>, for the Debian project (but may be used by others).

                                                                   Jan 31, 2010                                                         DIFFIMG(1)
