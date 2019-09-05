yuvmedianfilter(1)                                              MJPEG tools manual                                              yuvmedianfilter(1)

NAME
       yuvmedianfilter - A filter for yuv images produced by the mjpeg tools

SYNOPSIS
       yuvmedianfilter [-r num] [-R num] [-t num] [-T num] [-I num] [-f] [-w num] [-s num] [-v num] [-h]

DESCRIPTION
       yuvmedianfilter is designed to enhance/filter images.  It takes the input from STDIN and writes output to STDOUT.
       This filter looks around the current point for a radius and averages the values that fall inside a threshold.  So the image is softened and
       the edges become more sharp. If the input material is noisy (it is always noisy but you do  not  always  see  it)  the  output  images  are
       improved  and  the  encoder spends less bandwidth encoding noise.  The more sophisticated version of image filtering is yuvdenoise. But you
       can use both programs in the encoding procces.  It cannot process a recorded file and write the improved version to another file.

OPTIONS
       yuvmedianfilter accepts the following options:

       -r num
            Radius for luma median (default: 2 pixels)

       -R num
            Radius for chroma median (default: 2 pixels)

       -t num
            Trigger threshold for luma (default: 2 [0=disable])

       -T num
            Trigger threshold for chroma (default: 2 [0=disable])

       -I num
            Interlacing type (0=no, 1=yes, default: taken from yuv stream)

       -f   Fast mode, i.e. the threshold is ignored, and a simple mean of the surrounding values is calculated.

       -w num
            In fast mode, the weight given to the current value versus the surrounding values.  Default is 8.
            Note that certain combinations of radii and weights have been optimized to be even faster -- radius 1 and weight 2.667, radius  1  and
            weight 8, and radius 2 and weight 8.

       -c num
            In  slow  mode, more than this fraction of the pixels must be within the threshold; otherwise the pixel is simply the weighted mean of
            pixels within a radius of 1.  Default is 0.33333.

       -s num
            Number of beginning frames to skip.  The first num frames are written to stdout unfiltered.  This is useful  for  resuming  an  inter‐
            rupted job without having to duplicate work.

       -v num
            Verbosity level (0, 1 or 2)

       -h   Print out a help message

BUGS
       It is slow.  Using a radius greater than the default of 2 is painfully slow.

AUTHOR
       This man page was written by Bernhard Praschinger.
       The yuvmedianfilter program was written by Mike Bernson, and adapted to the yuv4mpeg2 stream header format by Steven M. Schultz.

       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:
         mjpeg-users@lists.sourceforge.net

       For more info, see our website at
              http://mjpeg.sourceforge.net

SEE ALSO
       mjpegtools(1), jpeg2yuv(1), lav2yuv(1), mpeg2enc(1), ppmtoy4m(1), yuv2lav(1), yuvdenoise(1), yuvscaler(1)

y4mutils                                                         24 February 2003                                               yuvmedianfilter(1)
