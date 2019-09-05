y4munsharp(1)                                                   MJPEG tools manual                                                   y4munsharp(1)

NAME
       y4munsharp - Unsharp filter for YUV4MPEG2 streams

SYNOPSIS
       y4munsharp [options]

DESCRIPTION
       y4munsharp  is  an  implementation  of  the   GIMP unsharp filter for YUV4MPEG2 streams.  The usual 3 parameters for unshap mask processing
       (radius, amount and threshold) are specified on the command line.  By default only the Y' (luma) component is processed although processing
       of  the  CbCr  (chroma)  may be requested by a commandline option.  Output must be either to a pipe or a file, leaving stdout as a terminal
       will elicit an error and the program will exit.

OPTIONS
       y4munsharp accepts the following options:

       -v num
            Set verbosity level (0 = quiet, 1 = normal, 2 = debug) (default: 1)

       -h   Print a suage summary and exit

       -L radius,amount,threshold
            Y' (luma) unsharp parameters.  The radius and amount" arguments are floating point numbers.  The threshold  argument  is  an  integer.
            (default:  3.0,0.3,4)  -C radius,amount,threshold CbCr (chroma) unsharp parameters.  The chroma is not processed unless this option is
            given.  Arguments are the same type as for the -L option above.  (default: none)

       -N   Filtering can produce output outside the 16 to 240 range for Y' and 16 to 235 for CbCr.  By default values outside the legal range are
            clipped/cored (values over 240 for Y' are set to 240 for example).  Using -N the limits 0 and 255 are used instead.

EXAMPLES
       A mild setting:
       y4munsharp -L 2.0,0.3,0

       An aggressive setting:
       y4munsharp -L 5.0,0.5,0

NOTES
       The  radius,  amount, threshold parameters have the same meaning as the GIMP's unsharp plugin.  This means you can use the GIMP on selected
       frame still images to determine suitable settings for y4munsharp.  The key thing to remember is to be subtle -  you  just  barely  want  to
       notice the sharpening effect.  If the effect is obvious ("jumps out at you") then the parameters are set too aggressively.

       The  chroma  is not processed for a several reasons:  1) The eye is much more sensitive to changes in brightness,  2) the chroma is usually
       subsampled and doesn't contribute much to the perceived sharpness of an image - so not processing the chroma provides a boost in  speed  of
       processing  the  image,  and  3) possible artifacting - changes in Y' just make an image brighter/darker but changes in Cb or Cr can change
       colors and possibly lead to shifts in hue.  Use the -C option to enable processing of the chroma planes.

BUGS
       Only the 3 plane YUV4MPEG2 formats are supported.

       Only progressive, top field first or bottom field first interlaced streams are handled.  The mixed interlaced stream  format  is  not  sup‐
       ported.

MJPEG Tools Team                                                 11 November 2004                                                    y4munsharp(1)
