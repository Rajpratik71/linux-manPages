y4mtoppm(1)                                                     MJPEG tools manual                                                     y4mtoppm(1)

NAME
       y4mtoppm - Convert YUV4MPEG2 stream to PPM images

SYNOPSIS
       y4mtoppm [options]

DESCRIPTION
       y4mtoppm converts a YUV4MPEG2 stream into a sequence of raw PPM images.

       Output is to stdout (but feel free to have the shell redirect to a file).

       Input  is read from stdin, like all other YUV4MPEG2 filters and tools.  YUV4MPEG2 streams contain frames using the Y'CbCr colorspace (ITU-R
       BT.601).  y4mtoppm will convert each pixel to the usual R'G'B' colorspace used for computer graphics.

       YUV4MPEG2 streams may (often!) have subsampled chroma planes.  y4mtoppm can upsample "4:2:0 JPEG" streams using a simple, lousy  algorithm.
       Better results will be obtained using a filters such as y4mscaler(1) which are capable of general-purpose subsampling operations.  y4mtoppm
       will fail on streams which have chroma subsampling modes other than 4:4:4 or 4:2:0-JPEG.

       For interlaced streams, these operations are performed on each field individually.  Fields can be output as separate PPM  images  in  time-
       order (default), or interleaved into full-frame images.

       If  multiple  PPM images are generated, they are simply output one after another.  If you want to turn such a "multi-image" PPM stream/file
       into individual files, use pnmsplit.  (Some PNM filters can process multi-image files/streams; however, many written before June 2000  will
       only process the first image.)

       y4mtoppm  and ppmtoy4m are inverses of each other; you can pipe the output of one into the other, and vice-versa.  Note that the colorspace
       (and subsampling) operations are lossy in both directions.  And, when converting to PPM, information on interlacing and sample aspect ratio
       is lost (but can be reconstructed by supplying command-line arguments to ppmtoy4m).

OPTIONS
       y4mtoppm accepts the following options:

       -L   For  interlaced streams, output a single PPM image for each frame, containing two interleaved fields.  (Otherwise, two PPM images will
            be generated for each frame; one per field.)

       -v [0,1,2]
            Set verbosity level.
             0 = warnings and errors only.
             1 = add informative messages, too.
             2 = add chatty debugging message, too.

EXAMPLES
       To turn the first 15 frames of an (MJPEG or DV) AVI file into individual PPM files:

            lav2yuv -f 15 your-video.avi | y4mtoppm | pnmsplit - "your-video-%d.ppm"

AUTHOR
       This man page was written by Matt Marjanovic.
       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:
         mjpeg-users@lists.sourceforge.net

       For more info, see our website at
              http://mjpeg.sourceforge.net/

SEE ALSO
       ppm(5), pnm(5), ppmtoy4m(1), mjpegtools(1), mpeg2enc(1), lav2yuv(1), pnmsplit(1), y4mscaler(1)

MJPEG Tools Team                                                   28 April 2004                                                       y4mtoppm(1)
