Ppmtowinicon User Manual(0)                                                                                                                                                       Ppmtowinicon User Manual(0)



NAME
       ppmtowinicon - convert PPM image into a Windows .ico file


SYNOPSIS
       ppmtowinicon

       [-andpgms]

       [-output=output.ico]

       [ppmfile [andfile] ...]


DESCRIPTION
       This program is part of Netpbm(1)

       This program is essentially obsolete; The newer pamtowinicon is better.

       ppmtowinicon reads one or more PPM images as input and produces a Microsoft Windows .ico file as output.

       A  Windows  icon  contains  1 or more images, at different resolutions and color depths.  When Windows wants to display the icon, it searches through the images to find the one that best matches the
       number of colors and resolution of the display.

       Microsoft recommends including at least the following formats in each icon.



       ·      16 x 16 - 4 bpp

       ·      32 x 32 - 4 bpp

       ·      48 x 48 - 8 bpp


       If you don't specify any input files, input is from Standard Input.

       Output is to Standard Output unless you specify -output.


   Transparency
       If you specify the -andmask option, you get (partly) transparent icons.  In that case, your arguments are pairs of file names, with the first file name being that of the image and  the  second  file
       name being that of a standard Netpbm PGM transparency mask (see the pgmformatspecification(5) ).

       In  a  .ico  file, there is no such thing as partial transparency (translucency).  Where the PGM mask says completely opaque, the icon will be opaque.  Everywhere else, the icon will be transparent.
       Note that as with any Netpbm program, you can use a PBM image for the transparency mask and ppmtowinicon will treat it like a PGM.

       The and mask is like an alpha mask, except for what it signifies in the "not opaque" areas.  In the usual case, the foreground image is black in those areas, and in that case  the  areas  are  fully
       transparent  -- the background shows through the icon.  But in general, a not opaque pixel signifies that the background and foreground should be merged as follows: The intensities of the color com-
       ponents in the foreground and background are represented as binary numbers, then corresponding bits of the background and foreground intensities are exclusive-or'ed together.  So there is a sort  of
       reverse video effect.

       If  you  don't  want this special effect and instead want straightforward transparency, use the -truetransparent option.  This causes ppmtowinicon to make the base image black everywhere your trans-
       parency mask says transparent, regardless of what color your input image is at that location.

       If you don't specify -andmask, ppmtowinicon puts all-opaque and masks into the .ico file.


OPTIONS
       -andpgms
              Include transparency information in the icons.  See the transparency section ⟨#transparency⟩ .


       -output=output.ico
              Name of output file.  By default, ppmtowinicon writes the icon to Standard Output.


       -truetransparent
              Make transparency in the icon normal instead of the special reverse video effect.  See the transparency section ⟨#transparency⟩ .




SEE ALSO
       pamtowinicon(1) , winicontoppm(1) , ppm(5)

       pgm(5)



AUTHOR
       Copyright (C) 2000 by Lee Benfield.



netpbm documentation                                                                             01 May 2004                                                                      Ppmtowinicon User Manual(0)
