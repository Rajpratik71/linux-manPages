Pnmhisteq User Manual(0)                                                                                                                                                             Pnmhisteq User Manual(0)



NAME
       pnmhisteq - histogram equalize a PNM image


SYNOPSIS
       pnmhisteq

       [-gray]

       [-rmap pgmfile]

       [-wmap pgmfile]

       [-verbose]

       [pnmfile]



DESCRIPTION
       This program is part of Netpbm(1)

       pnmhisteq increases the contrast of a PGM or PPM image through the technique of 'histogram equalization.'[1]

       pnmhisteq  computes  a  histogram  of  the luminosity of the pixels in the image.  It then calculates a mapping between each luminosity and a new luminosity such that it spreads out intensity levels
       around histogram peaks and compresses them at troughs.  I.e.  it moves pixels around in the histogram so as to make it flat.  It applies that mapping to the input image to produce the output  image.
       The effect of this is that the image has equal numbers of pixels at each possible intensity level, which means it uses the available levels of intensity more efficiently and thereby has more visible
       detail.

       Mathematically, the luminosity mapping is this: Assume the pixels are sorted by luminosity into B buckets numbered from 0 (lowest luminosity) to B-1.  N[i] is the number of pixels in bucket i.  T is
       the total number of pixels (sum of N[i] over all i).  W is the luminosity of white.

       pnmhisteq replaces an input pixel whose luminosity falls into bucket j with one whose luminosity is:


             j
            ---
            \
             > (N[i] / T) * W
            /
            ---
            i=0

       Considering a grayscale image for simplicity, this means that pixels in the most luminous bucket become white.  Pixels in the 10th per centile of luminosity become 10% of white.

       pnmhisteq maps a single luminosity in the input to a single luminosity in the output.  That means if pixels A and B both have luminosity .2 in the input, and pixel A has luminosity .4 in the output,
       pixel B also has luminosity .4 in the output.  And since the luminosities in the input are not continuous, the luminosities in the output aren't either and pnmhisteq doesn't meet the ideal of having
       exactly the same number of pixels of each luminosity in the output.

       If  you're  processing  a  related  set of images, for example frames of an animation, it's generally best to apply the same luminosity mapping to every frame, since otherwise you'll get distracting
       frame-to-frame changes in the brightness of objects.  pnmhisteq's -wmap option allows you to save, as a PGM image, the luminosity map it computes from an image.  The -rmap option causes pnmisteq  to
       use such an image as its luminosity map.

       So  you  can  run  pnmhisteq with -wmap on a composite you created with pnmcat of the images you intend to process.  Then, you can run pnmisteq with -rmap on each of the individual images, using the
       luminosity map you generated from the composite.

       Use pnmhistmap to see the result.  Run a color image through ppmtopgm first so that you see a histogram of the luminosity instead of histograms of the three color components.   It  should  generally
       show a flat histogram.  But because of the quantization effects described above, you might see high bars interleaved with low bars, with the local average being flat.  To see local averages, use the
       -width option of pnmhistmap.



OPTIONS
       You can abbreviate any option to its shortest unique prefix.



       -gray  When processing a color image, only gray pixels (those with identical red, green, and blue values) are included in the histogram and modified in the output image.  This is a  special  purpose
              option  intended for images where the actual data are gray scale, with color annotations you don't want modified.  Weather satellite images that show continent outlines in color are best pro-
              cessed using this option.  The option has no effect when the input is a graymap.


       -rmap mapfile
              Process the image using the luminosity map specified by the PGM file mapfile.

              The PGM image, usually created by an earlier run of pnmhisteq with the -wmap option, contains a single row with number of columns equal to the maxval (greatest intensity value) of  the  image
              plus  one.   Each pixel in the image is transformed by looking up its luminosity in the corresponding column in the map file (column number = luminosity) and changing it to the value given by
              that column.


       -wmap mapfile
              Creates a PGM file mapfile, containing the luminosity map computed from the histogram of the input image.  This map file can be read on subsequent runs of pnmhisteq  with  the  -rmap  option,
              allowing a group of images to be processed with an identical map.


       -verbose
              Prints the histogram and luminosity map on Standard Error.




LIMITATIONS
       Histogram  equalization  is  effective  for  increasing the visible detail in scientific imagery and in some continuous-tone pictures.  It is often too drastic, however, for scanned halftone images,
       where it does an excellent job of making halftone artifacts apparent.  You might want to experiment with pnmnorm and pnmgamma for more subtle contrast enhancement.

       The luminosity map file supplied by the -rmap option must have the same maxval as the input image.  This is always the case when the map file was created by the -wmap option of pnmhisteq.   If  this
       restriction causes a problem, simply adjust the maxval of the map with pamdepth to agree with the input image.

       If the input is a PBM file (on which histogram equalization is an identity operation), the only effect of passing the file through pnmhisteq will be the passage of time.


SEE ALSO
       pnmnorm(1) , pnmcat(1) , pamdepth(1) , pnmgamma(1) , pnm(5) ,



       [1]    Russ, John C.  The Image Processing Handbook.  Boca Raton: CRC Press, 1992.  Pages 105-110.



netpbm documentation                                                                           02 February 2010                                                                      Pnmhisteq User Manual(0)
