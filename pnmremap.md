Pnmremap User Manual(0)                                                                                                                                                               Pnmremap User Manual(0)



NAME
       pnmremap - replace colors in a PNM image with colors from another set


SYNOPSIS
       pnmremap

       -mapfile=palettefile

       [-floyd|-fs|-nfloyd|-nofs]

       [-norandom]

       [-firstisdefault]

       [-verbose]

       [-missingcolor=color]

       [pnmfile]

       All  options  can  be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one to designate an option.  You may use either white space or an equals sign between an option
       name and its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pnmremap replaces the colors in an input image with those from a palette you specify.  Where colors in the input are present in the palette, they just stay the same in the  output.   But  where  the
       input contains a color that is not in the palette, pnmremap gives you these choices:



       ·      Choose the closest color from the palette.


       ·      Choose the first color from the palette.


       ·      Use a color specified by a command option (-missing).


       ·      Dither.   This  means  rather than mapping pixel by pixel, pnmremap uses colors from the palette to try to make multi-pixel regions of the output have the same average color as the input (for
              another kind of dithering, see ppmdither).



       Two reasons to use this program are: 1) you want to reduce the number of colors in the input image; and 2) you need to feed the image to something that can handle only certain colors.

       To reduce colors, you can generate the palette with pnmcolormap.

       By default, pnmremap maps an input color that is not in the palette to the closest color that is in the palette.  Closest means with the smallest Cartesian distance in the red, green,  blue  bright-
       ness space (smallest sum of the squares of the differences in red, green, and blue ITU-R Recommendation BT.709 gamma-adjusted intensities).

       You can instead specify a single default color for pnmremap to use for any color in the input image that is not in the palette.  Use the -missing option for this.

       You can also specify that the first color in the palette image is the default.  Use the -firstisdefault option for this.

       The palette is simply a PNM image.  The colors of the pixels in the image are the colors in the palette.  Where the pixels appear in the image, and the dimensions of the image, are irrelevant.  Mul-
       tiple pixels of the same color are fine.  However, a palette image is typically a single row with one pixel per color.

       If you specify -missing, the color you so specify is in the palette in addition to whatever is in the palette image.

       For historical reasons, Netpbm sometimes calls the palette a 'colormap.' But it doesn't really map anything.  pnmremap creates its own map, based on the palette, to map colors from the  input  image
       to output colors.


   Palette/Image Type Mismatch
       In  the  simple case, the palette image is of the same depth (number of planes, i.e. number of components in each tuple (pixel)) as the input image and pnmremap just does a straightforward search of
       the palette for each input tuple (pixel).  In fact, pnmremap doesn't even care if the image is a visual image.

       But what about when the depths differ?  In that case, pnmremap converts the input image (in its own memory) to match the palette and then proceeds as above.

       There are only two such cases in which pnmremap knows how to do the conversion:  when one of them is tuple type RGB, depth 3, and the other is tuple type GRAYSCALE or  BLACKANDWHITE,  depth  1;  and
       vice versa.

       In any other case, pnmremap issues and error message and fails.

       Note that as long as your input and palette images are PNM, they'll always fall into one of the cases pnmremap can handle.  There's an issue only if you're using some exotic PAM image.

       Before  Netpbm  10.27 (March 2005), pnmremap could not handle the case of a palette of greater depth than the input image.  (It would issue an error message and fail in that case).  You can use ppm-
       toppm to increase the depth of the input image to work around this limitation.

       In any case, the output image has the same tuple type and depth as the palette image.


   Multiple Image Stream
       pnmremap handles a multiple image input stream, producing a multiple image output stream.  The input images need not be similar in any way.

       Before Netpbm 10.30 (October 2005), pnmremap ignored any image after the first.



   Examples
       pnmcolormap testimg.ppm 256 >palette.ppm

       pnmremap -map=palette.ppm testimg.ppm >reduced_testimg.ppm

       To limit colors to a certain set, a typical example is to create an image for posting on the World Wide Web, where different browsers know different colors.  But all browsers are  supposed  to  know
       the 216 'web safe' colors which are essentially all the colors you can represent in a PPM image with a maxval of 5.  So you can do this:

       pamseq 3 5 >websafe.pam

       pnmremap -map=websafe.pam testimg.ppm >websafe_testimg.ppm

       Another useful palette is one for the 8 color IBM TTL color set, which you can create with
       pamseq 3 1 >ibmttl.pam

       If you want to quantize one image to use the colors in another one, just use the second one as the palette.  You don't have to reduce it down to only one pixel of each color, just use it as is.

       The output image has the same type and maxval as the palette image.


PARAMETERS
       There is one parameter, which is required: The file specification of the input PNM file.



OPTIONS
       -mapfile=palettefilename
              This names the file that contains the palette image.

              This option is mandatory.


       -floyd

       -fs

       -nofloyd

       -nofs  These  options  determine  whether pnmremap does Floyd-Steinberg dithering.  Without Floyd-Steinberg, pnmremap selects the output color of a pixel based on the color of only the corresponding
              input pixel.  With Floyd-Steinberg, pnmremap considers regions of pixels such that the average color of a region is the same in the output as in the input.  The dithering effect appears as  a
              dot pattern up close, but from a distance, the dots blend so that you see more colors than are present in the color map.

              As  an  example,  if  your color map contains only black and white, and the input image has 4 adjacent pixels of gray, pnmremap with Floyd-Steinberg would generate output pixels black, white,
              black, white, which from a distance looks gray.  But without Floyd-Steinberg, pnmremap would generate 4 white pixels, white being the single-pixel approximation of gray.

              Floyd-Steinberg gives vastly better results on images where unmodified quantization has banding or other artifacts, especially when going to a small number of colors such  as  the  above  IBM
              set.  However, it does take substantially more CPU time.

              -fs is a synonym for -floyd.  -nofs is a synonym for -nofloyd.

              The default is -nofloyd.

              Before Netpbm 10.46 (March 2009), dithering doesn't work quite as you expect if the color map has a lower maxval than the input.  pnmremap reduces the color resolution to the color map's max-
              val before doing any dithering, so the dithering does not have the effect of making the image, at a distance, appear to have the original maxval.  In current Netpbm, it does.


       -norandom
              This option affects a detail of the Floyd-Steinberg dithering process.  It has no effect if you aren't doing Floyd-Steinberg dithering.

              By default, pnmremap initializes the error propagation accumulator to random values to avoid the appearance of unwanted patterns.  This is an extension of the original  Floyd-Steinberg  algo-
              rithm.

              A drawback of this is that the same pnmremap on the same input produces slightly different output every time, which makes comparison difficult.

              With -norandom, pnmremap initializes the error accumulators to zero and the output is completely predictable.

              -norandom was new in Netpbm 10.39 (June 2007).



       -firstisdefault
              This tells pnmremap to map any input color that is not in the palette to the first color in the palette (the color of the pixel in the top left corner of the palette image)

              See DESCRIPTION ⟨#description⟩ .

              If you specify -firstisdefault, the maxval of your input must match the maxval of your palette image.


       -missingcolor=color
              This  specifies the default color for pnmremap to map to a color in the input image that isn't in the palette.  color may or may not be in the palette image; it is part of the palette regard-
              less.

              If you specify -missingcolor, the maxval of your input must match the maxval of your palette image.


       -verbose
              Display helpful messages about the mapping process.





SEE ALSO
       pnmcolormap(1) , pamseq(1) , pnmquant(1) , ppmquantall(1) , pamdepth(1) , ppmdither(1) , ppmquant(1) , ppm(5)



HISTORY
       pnmremap first appeared in Netpbm 9.23 (January 2002).  Before that, its function was available only as part of the function of pnmquant (which was derived from  the  much  older  ppmquant).   Color
       quantization  really  has  two  main  subfunctions, so Netpbm 9.23 split it out into two separate programs: pnmcolormap and pnmremap and then Netpbm 9.24 replaced pnmquant with a program that simply
       calls pnmcolormap and pnmremap.


AUTHOR
       Copyright (C) 1989, 1991 by Jef Poskanzer.



netpbm documentation                                                                             03 June 2009                                                                         Pnmremap User Manual(0)
