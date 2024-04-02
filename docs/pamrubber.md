PamRubber User Manual(0)                                                                                                                                                             PamRubber User Manual(0)



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">




NAME
       pamrubber - a rubber-sheeting utility that stretches an image based on control points


SYNOPSIS
       pamrubber {-tri | -quad} [-linear] [-frame] [-randomseed=N] cp1x cp1y [cp2x cp2y [cp3x cp3y [cp4x cp4y]]] cp1x cp1y [cp2x cp2y [cp3x cp3y [cp4x cp4y]]] [filename]

       Minimum unique abbreviation of options is acceptable.  You may use double hyphens instead of single hyphen to denote options.


DESCRIPTION
       This program is part of Netpbm(1)

       The  pamrubber  utility  converts  a  pam image into a new image with the contents moved around.  The transformation is often called 'rubber sheeting': you identify control points (CP) on the source
       image and specify new positions for those points in the new image.  pamrubber moves all the pixels around, stretching and compressing as necessary, as if the original image were on a sheet of rubber
       and you pulled on the sheet to make the control points move to their new locations.

       The new image has the same dimensions and format as the original.

       The  transformation  can happen in two very different ways, called 'quad' and 'tri.' With the former, you must specify four control points (for both source and target).  These are the corners of two
       quadrilaterals that will act as the coordinate system for both source and target images.  Consider them as non-orthogonal (0,0), (0,1), (1,0) and (1,1) points.  This transformation  comes  close  to
       the one pamperspective does, however that program does other corrections as well.

       When  you  specify  less than four control points, the program adds control points in the following way.  With three control points, pamrubber chooses the fourth one such that the four points form a
       parallelogram.  With two points, pamrubber considers them the opposite corners of a rectangle.  When you specify only one control point, pamrubber uses a rectangle from the top left  corner  of  the
       image to the single control point.

       In  'tri'  mode,  pamrubber conceptually cuts up the source and target image into triangles.  It Transforms within each corresponding pair of triangles in a stretching fashion.  It's like pulling on
       the three corners of the triangle.  In this mode, each pixel in the source image gets mapped to a position in the target image. No pixels are lost.

       When, in 'tri' mode, you specify only a single control point in the source and target image, pamrubber creates four triangles from this point to the four corners of the image. With two  points,  the
       program creates six triangles from the two endpoints of the line connecting the two points, again to the four corners of the image. Three control points is in a way the core of this utility in 'tri'
       mode.  Between the three edges of the central triangle and the four edges of the image, pamrubber constructs another seven triangles.  Four control points define two central connected triangles.  In
       total this results in cutting the source and target image up into ten triangles.

       In this case clearly a picture says more than a thousand words.  There is a graphical illustration of these various modes at
        www.schaik.com/netpbm/rubber ⟨http://www.schaik.com/netpbm/rubber⟩ .  An example of how to use this type of rubber sheeting in cartography is in the article
        Visualizing the Landscape of Old-Time Tokyo ⟨http://www.isprs.org/proceedings/XXXVI/5-W1/papers/21.pdf⟩ .



PARAMETERS
       The  parameters  are control points (cp) in pairs of x and y.  The source and target image must have the same number of control points.  The minimum number of values specified here is 4 for a single
       control point in the source and target image.  The maximum is 16 for four control points in each image.


       filename is the name of the input file. If you don't specify this, pamrubber reads the image from Standard Input.



OPTIONS
       <dl compact="compact">


       -tri | -quad

              This selects the type of rubber sheeting done.  You must specify exactly one of these options.



       -linear

              This determines whether pamrubber uses nearest neighbor interpolation or bilinear interpolation of four source pixels.




       -frame

              This option causes pamrubber to overlay the target image with the edges of the quadrilaterals, respectively the triangles used for the rubber sheeting.  To get the same overlay for the source
              image, use a pamrubber transformation with identical control points for source and target.



       -randomseed=N

              pamrubber randomizes some of its output.  So that you can produce repeatable results, you can choose the seed of the random number generator with this option.  If you use the same input image
              and the same random number generator seed, you should always get the exact same output.  By default, pamrubber uses the time of day as the seed, so you get slightly different output when  you
              run the program twice on the same input.

              Before Netpbm 10.61 (December 2012), this was called -randseed, and that still works.







SEE ALSO
       pam(1)
        and pamperspective(1)




HISTORY
       pamrubber was new in Netpbm 10.54 (March 2011).



AUTHORS
       Willem van Schaik wrote this program in February 2011 and contributed it to Netpbm.



netpbm documentation                                                                            February 2011                                                                        PamRubber User Manual(0)
