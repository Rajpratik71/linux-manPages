Pamstereogram User Manual(0)                                                                                                                                                     Pamstereogram User Manual(0)



<!DOCTYPE html>

       Updated:30 December 2012

       Table Of Contents ⟨#contents⟩



NAME
       pamstereogram - create a single-image stereogram from a PAM depth map


SYNOPSIS
       pamstereogram  [-help]  [-verbose] [-blackandwhite | -grayscale | -color] [-maxval=value] [-patfile=pamfile] [-texfile=pamfile] [-bgcolor=color] [-smoothing=pixels] [-xshift=pixels] [-yshift=pixels]
       [-magnifypat=scale] [-guidetop] [-guidebottom] [-guidesize=pixels] [-dpi=resolution] [-crosseyed] [-makemask] [-eyesep=inches] [-depth=fraction]  [-planes=near_pixels,far_pixels]  [-randomseed=inte-
       ger] [infile]





DESCRIPTION
       This program is part of Netpbm(1)

       pamstereogram  inputs a depth map (a map of the distances from your eye of the points in a scene) and outputs a single-image stereogram (SIS). A SIS is a 2-D image specially designed to appear three
       dimensional when viewed with relaxed, slightly unfocused eyes. What's exciting about single-image stereograms is that they don't require special glasses to view, although it does require  a  bit  of
       practice to train your eyes to unfocus properly.  The pamstereogram program provides a wealth of control over how the stereogram is generated, including the following:



       ·      black and white, grayscale, or color output


       ·      single-image random-dot stereograms (SIRDS), single-image stereograms (SIS) using a tiled image, or mapped-texture stereograms (MTS)


       ·      images targeting a given device resolution and eye separation


       ·      optional guide boxes to assist in focusing


       ·      the ability to trade off depth levels for easier viewing


       ·      choice of wall-eyed or cross-eyed stereograms



       The  output  is a PAM image on standard output.  Options control the exact format of the PAM.  If you want a PNM (PBM, PGM, or PPM) image, use pamtopnm on the output.  There is no need to convert if
       you will use the image as input to a current Netpbm program, but many other programs don't know what a PAM is.

       To make a red/green type of stereogram (that you view with 3-D glasses) instead, see ppm3d.



OPTIONS
       You may use either single or double hyphens to denote options.  You may use either whitespace or an equals sign to separate an option name from its value.




       -verbose
              Display messages about image sizes and formats and properties of the stereogram being generated.


       -blackandwhite
              Produce a single-image random-dot black-and-white stereogram.  This is the default.


       -grayscale
              Produce a single-image random-dot grayscale stereogram.


       -color Produce a single-image random-dot color stereogram.


       -maxval=value
              Designate the maximum value of each gray/color component, i.e.  the color resolution. Smaller values make the output image have smaller numbers of unique grays/colors. If  you  don't  specify
              -maxval, pamstereogram uses the maxval of the input image. This option has no effect with -blackandwhite.


       -patfile=pamfile
              Specify  an  image to use as a repeated background pattern for the stereogram instead of a random-dot pattern. Intricate images generally produce a crisper 3-D effect that simpler images. The
              output file will have the same maxval and format (black and white, grayscale or color) as the pattern file. You cannot specify the  -patfile  option  along  with  -blackandwhite,  -grayscale,
              -color, or -maxval.


       -texfile=pamfile
              Specify  an  image  to use as the texture for a mapped-texture stereogram.  The idea is that the depth-map image provides the depth values of the 3-D object/scene while the texture image pro-
              vides the true-color values.  Consequently, the texture image should align with the depth-map image.  (Note that it's required to have the same dimensions.)  The  texture  image's  background
              color is ignored when blending colors.

              This option was new in Netpbm 10.53 (December 2010).



       -bgcolor=color
              Use color as the texture image's background color instead of letting pamstereogram determine it automatically.  Specify the color as described for the argument of the ppm_parsecolor() library
              routine ⟨libppm.html#colorname⟩ .  The -bgcolor option is meaningful only in conjunction with -texfile.

              This option was new in Netpbm 10.53 (December 2010).



       -smoothing=pixels
              When used without -texfile, attempt to eliminate artifacts introduced by edges in the depth map if pixels is greater than zero.

              When used with -texfile, horizontally blur non-background colors into background pixels up to a distance of pixels pixels.  This helps smooth  over  distracting  glitches  introduced  by  the
              stereogram's  color  constraints  when producing a mapped-texture stereogram.  In this case, the -smoothing option is helpful when the texture image includes smooth color transitions (as in a
              photograph) but makes crisp texture images (as in a line drawing) appear blurry.

              This option was new in Netpbm 10.53 (December 2010).  Before Netpbm 10.61 (December 2012), it has no effect without -texfile.



       -xshift=pixels
              Shift the pattern image (designated by -patfile) to the right by pixels pixels (default: 0).

              This option is valid only along with -patfile.


       -yshift pixels
              Shift the pattern image (designated by -patfile) downwards by pixels pixels (default: 0). This option is valid only along with -patfile.


       -magnifypat=scale
              Magnify each pixel in the pattern file or each random dot by integral scaling factor scale. Note that pamstereogram applies the pattern  magnification  after  pattern  shifting  (-xshift  and
              -yshift).


       -guidebottom
              Draw  a  pair  of  black squares on a white background underneath the stereogram proper. These squares help you guide your eyes into proper focus to view the 3-D image.  The trick is to focus
              your eyes some distance behind the image, causing you to see four black squares, then continue altering your focus distance until the middle two black squares fuse into a single black square.
              At that point, a crisp, 3-D image will appear.

              This option was new in Netpbm 10.61 (December 2012).  Before that, the presence of -guidesize, with a positive value, has the same effect.



       -guidetop
              Same as -guidebottom, except the guides go at the top of the image.

              This option was new in Netpbm 10.61 (December 2012).  Before that, the presence of -guidesize, with a negative value, has the same effect.


       -guidesize=pixels
              The size (width and height) of each guide box.

              This is valid only with -guidetop or -guidebottom.

              Default is 20.

              Before  Netpbm  10.61  (December  2012),  if  you don't specify this option, pamstereogram draws no guides.  If you specify it with a positive value, pamstereogram behaves as if you specified
              -guidebottom too, and if you specify it with a negative value, it behaves as if you specified -guidetop and specified guidesize with the absolute value of that negative value.


       -dpi=resolution
              Specify the resolution of the output device in dots per inch.  The default is 100 DPI, which represents a fairly crisp screen resolution.

              Before Netpbm 10.53 (December 2010), the default was 96 DPI.



       -crosseyed
              Invert the gray levels in the depth map (input image) so that the 3-D image pops out of the page where it would otherwise sink into the page and vice versa. Some people are unable to  diverge
              their  eyes  and can only cross them. The -crosseyed option enables such people to see the 3-D image as intended.  You can also specify the -crosseyed option if you prefer using depth maps in
              which darker colors are closer to the eye and lighter colors are farther from the eye.

              Before Netpbm 10.53 (December 2010), pamstereogram used higher (lighter) numbers for things closer to the eye without -crosseyed and vice versa.



       -makemask
              Instead of a stereogram, output a PAM mask image showing coloring constraints. New pixels will be taken from the pattern file where the mask is black. Copies of existing pixels will be  taken
              from the pattern file where the mask is white. The -makemask option can be used to help create more sophisticated pattern files (to use with -patfile) Note that -makemask ignores -magnifypat;
              it always produces masks that assume a pattern magnification of 1.


       -eyesep=inches
              Specify the separation in inches between your eyes. The default, 2.5 inches (6.4 cm), should be sufficient for most people and probably doesn't need to be changed.


       -depth=fraction
              Specify the output image's depth of field. That is, fraction represents the fractional distance of the near plane from the far plane. Smaller numbers make the 3-D image easier to perceive but
              flatter. Larger numbers make the 3-D image more difficult to perceive but deeper. The default, 0.3333, generally works fairly well.


       -planes=near_pixels,far_pixels
              Explicitly specify the distance between repeated pixels in the near plane and in the far plane.  This is an alternative to -eyesep and -depth.  The following equalities hold:



       ·      eyesep = 2 * far

       ·      depth = 2 * (far &minus; near) /
                    (2 * far &minus; near)


              The  number  of distinct 3-D depths is far &minus; near + 1.  One might say that -eyesep and -depth are a more human-friendly way to specify stereoscopic parameters (distance between eyes and
              tradeoff between perceptibility and depth) while -planes is a more computer-centric way (pixel distances in the resulting stereogram).

              This option was new in Netpbm 10.59 (June 2012).



       -randomseed=integer
              Specify a seed to be used for the random number generator.  The default is to use a seed based on the time of day, to one second granularity.

              It is useful to specify the seed if you want to create reproducible results.  With the same random seed, you should get identical results every time you run pamstereogram.

              This is irrelevant if you use a pattern file (-patfile option), because there is no random element to pamstereogram's behavior.

              This option was new in Netpbm 10.32 (February 2006).






PARAMETERS
       The only parameter, infile, is the name of an input file that is a depth map image. If you don't specify infile, the input is from standard input.

       The input is a PAM image of depth 1. Each sample represents the distance from the eye that the 3-D image at that location should be.  Lower (darker) numbers mean further from the eye.


NOTES
   Input Images
       pamstereogram pays no attention to the image's tuple type and ignores all planes other than plane 0.

       Like any Netpbm program, pamstereogram will accept PNM input as if it were the PAM equivalent.


   Mapped-texture Stereograms
       In a mapped-texture stereogram (MTS), the 3-D image can be drawn with true colors.  Unlike a SIRDS or tiled-image SIS, however, the image portrayed by an MTS is apparent in normal 2-D  viewing.   It
       appears repeated multiple times and overlapped with itself, but it is not hidden.

       You  create an MTS with pamstereogram by passing the filename of a PAM <q>texture image</q> with a -texfile option.  A texture image portrays the same 3-D object as the depth-map image but indicates
       the colors that the program should apply to the object.

       pamstereogram ignores the texture image's background color when it overlaps copies of the 3-D object.  This prevents, for example, a bright-red object on a black background from  being  drawn  as  a
       dark-red object (a blend of 50% bright red and 50% black); instead, the program ignores the black and the object remains bright red.  A consequence of this feature is that an MTS looks best when the
       objects in the texture image have a crisp outline.  Smooth transitions to the background color result in unwanted color artifacts around edges because the program ignores only exact matches with the
       background color.

       You  should  specify a larger-than-normal value for -eyesep (and/or -dpi) when producing an MTS.  Otherwise, the 3-D object will repeat so many times that most colored pixels will overlap other col-
       ored pixels, reducing the number of true-colored pixels that remain.

       An MTS can employ a background pattern (-patfile).  In this case, pamstereogram replaces background pixels with pattern pixels in the final step of generating the image.



   Miscellaneous
       A good initial test is to input an image consisting of a solid shape of distance 0 within a large field of maximum distance (e.g., a white square on a black background).

       With the default values for -dpi and -eyesep, pattern images that are 128 pixels wide can tile seamlessly.



EXAMPLES
       Generate a SIRDS out of small, brightly colored squares and prepare it for display on an 87 DPI monitor:

           pamstereogram depthmap.pam \
               -dpi 87 -verbose -color -maxval 1 -magnifypat 3 \
               >3d.pam

       Generate a SIS by tiling a PPM file (a prior run with -verbose indicates how wide the pattern file should be for seamless tiling, although any width is acceptable for producing SISes):

           pamstereogram depthmap.pam -patfile mypattern.ppm >3d.pam

       Generate an MTS by associating colors with a depth-mapped object (using a large eye separation to reduce the number of repetitions of the texture image) and twice smoothing  over  background-colored
       speckles:

           pamstereogram depthmap.pam \
               -texfile colormap.pam -smoothing 2 -eyesep 3.5 \
               >3d.pam



SEE ALSO
       ·

              pam(5)



       ·

              pamsistoaglyph(1)



       ·

              ppm3d(1)




       ·      Harold  W.  Thimbleby,  Stuart  Inglis,  and  Ian  H.  Witten.   Displaying  3D  Images: Algorithms for Single Image Random Dot Stereograms. In IEEE Computer, 27(10):38-48, October 1994.  DOI
              10.1109/2.318576 ⟨http://dx.doi.org/10.1109/2.318576⟩ .





HISTORY
       pamstereogram was new in Netpbm 10.22 (April 2004), but probably broken beyond usability until Netpbm 10.32 (February 2006) and Netpbm 10.26.23 (January 2006).

       A backward incompatible change to the way you request guide boxes (-guidetop, -guidebottom, -guidesize happened in Netpbm 10.61 (December 2012).



AUTHOR
       Copyright (C) 2006, 2010 Scott Pakin, scott+pbm@pakin.org.


Table Of Contents
       ·

              SYNOPSIS ⟨#synopsis⟩

       ·

              DESCRIPTION ⟨#description⟩

       ·

              OPTIONS ⟨#options⟩

       ·

              PARAMETERS ⟨#parameters⟩

       ·

              NOTES ⟨#notes⟩


       ·

              Input Images ⟨inputimages⟩

       ·

              Mapped-texture Stereograms ⟨mappedtexture⟩

       ·

              Miscellaneous ⟨notes_misc⟩



       ·

              EXAMPLES ⟨#examples⟩

       ·

              SEE ALSO ⟨#seealso⟩

       ·

              HISTORY ⟨#history⟩

       ·

              AUTHOR ⟨#author⟩



netpbm documentation                                                                                                                                                             Pamstereogram User Manual(0)
