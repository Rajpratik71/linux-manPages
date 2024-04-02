dcfujigreen(1)                                                General Commands Manual                                               dcfujigreen(1)

NAME
       dcfujigreen - Alternative processing for Fuji RAW images

SYNOPSIS
       dcfujigreen file1 file2

DESCRIPTION
       Fuji RAW green channel output alternative to dcraw.
       Fuji digital cameras use a sum/difference encoding for the colour data.  This means that the green channel is roughly equivalent to a black
       and white image.
       This utility can be used in place of dcraw(1) to retrieve a black and white image. It is much quicker than dcraw, but is doing a lot less.

SEE ALSO
       dcraw(1), dcfujiturn(1)

AUTHOR
       Written by Steve King for debian.

                                                                   Jun 27, 2006                                                     dcfujigreen(1)
