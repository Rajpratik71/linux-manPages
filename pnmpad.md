Pnmpad User Manual(0)                                                                                                                                                                   Pnmpad User Manual(0)



NAME
       pnmpad - add borders to a PNM image


SYNOPSIS
       pnmpad [-verbose] [-white|-black] [-width=pixels] [-halign=ratio] [-left=pixels] [-right=pixels] [-height=pixels] [-valign=ratio] [-top=pixels] [-bottom=pixels] [pnmfile]



DESCRIPTION
       This program is part of Netpbm(1)

       pnmpad reads a PNM image as input and outputs a PNM image that is the input image plus black or white borders of the sizes specified.

       If you just need to convert an image to a certain size regardless of the original dimensions, pamcut with the -pad option may be a better choice.

       pnmmargin does essentially the same thing, but allows you to add borders of any color and requires all four borders to be the same size.



OPTIONS
       All  options  can  be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one to designate an option.  You may use either white space or an equals sign between an option
       name and its value.



       -verbose
              Verbose output.


       -white

       -black Set pad color.  Default is -black.



       -left=pixels

       -right=pixels

       -width=width

       -halign=ratio
              Specify amount of left and right padding in pixels.

              -left and -right directly specify the amount of padding added to the left and right sides, respectively, of the image.

              Alternatively, you can specify -width and just one of -left and -right and pnmpad calculates the required padding on the other side based on the width of the input image.  If the -width value
              is less than the width of the image plus the specified padding, the -width values is ignored.

              If  you  specify  all  three of -width, -left, and -right, you must ensure that the -left and -right padding are sufficient to make the image at least as wide as -width specifies.  Otherwise,
              pnmpad fails.

              When you specify -width without -left or -right, and -width is larger than the input image, pnmpad chooses left and right padding amounts in a certain ratio.  That ratio defaults to half, but
              you can set it to anything (from 0 to 1) with the -halign option.  If the input image is already at least as wide as -width specifies, pnmpad adds no padding.

              Common values for -halign are:


       0.0    left aligned


       0.5    center aligned (default)


       1.0    right aligned


              Before Netpbm 10.23 (July 2004), pnmpad did not allow the -left or -right option together with -width.


       -top=pixels

       -bottom=pixels

       -height=height

       -valign=ratio
              These options determine the vertical padding.  They are analogous to the horizontal padding options above.





HISTORY
       Before February 2002, pnmpad had a different option syntax which was less expressive and not like conventional Netpbm programs.  That syntax is still understood by pnmpad for backward compatibility,
       but not documented or supported for future use.



SEE ALSO
       pbmmake(1) , pnmpaste(1) , pamcut(1) , pnmcrop(1) , pamcomp(1) , pnmmargin(1) , pbm(5)




AUTHOR
       Copyright (C) 2002 by Martin van Beilen

       Copyright (C) 1990 by Angus Duggan

       Copyright (C) 1989 by Jef Poskanzer.

       Permission to use, copy, modify, and distribute this software and its documentation for any purpose and without fee is hereby granted, provided that the above copyright notice appear in  all  copies
       and that both that copyright notice and this permission notice appear in supporting documentation.  This software is provided 'as is' without express or implied warranty.



netpbm documentation                                                                            20 March 2009                                                                           Pnmpad User Manual(0)
