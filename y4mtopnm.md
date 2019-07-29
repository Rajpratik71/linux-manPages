y4mtopnm(1)                                                     MJPEG tools manual                                                     y4mtopnm(1)

NAME
       y4mtopnm - Convert a YUV4MPEG2 stream to PNM images

SYNOPSIS
       y4mtopnm [options]

DESCRIPTION
       y4mtopnm  converts  a  YUV4MPEG2 stream into a sequence of raw PPM, PGM, or PAM images.  (Technically, "pnm" comprises the PPM, PGM and PBM
       formats.  PAM is a fourth format, which can effectively contain any of the other three, and more.)

       Output is to stdout (but feel free to have the shell redirect to a file).

       Input is read from stdin, like all other YUV4MPEG2 filters and tools.  YUV4MPEG2 streams contain frames using the Y'CbCr colorspace  (ITU-R
       BT.601).   For  4:4:4 (color) streams, y4mtopnm will convert each pixel to the usual R'G'B' colorspace used for computer graphics, and pro‐
       duce PPM images.  "MONO" (luma-only) streams will be converted to full-range [0,255] grayscale and output as PGM images.

       YUV4MPEG2 streams may (often!) have subsampled chroma planes, but y4mtopnm will not process them (except in the special 'flatten' mode; see
       below).  Subsampled streams will need to be converted to 4:4:4 using a tool such as y4mscaler.

       If y4mtopnm is given a "444ALPHA" stream (4:4:4 video with an 8-bit alpha channel), the results depend on whether or not the "-P" option is
       specified.  With "-P", it will produce PAM images with a TUPLTYPE of RGB_ALPHA, containing both color  and  alpha  channel  data.   Without
       "-P",  it  will  produce  pairs  of  PPM  and PGM images: a PPM for the color pixels followed by a PGM for the alpha channel data.  (Such a
       sequence of interspersed PPM and PGM images cannot be later re-processed by pnmtoy4m.  This feature is mostly for  quick  and  easy  stream
       debugging.)

       If  multiple  output  images are generated, they are simply output one after another.  If you want to turn such a "multi-image" stream/file
       into individual files, use pnmsplit.  (Some PNM filters can process multi-image files/streams; however, many written before June 2000  will
       only process the first image.)

       y4mtopnm  and  pnmtoy4m are inverses of each other; you can typically pipe the output of one into the other, and vice-versa (except for the
       "444ALPHA" case noted above and the "mixed-mode" case noted below).  Note that the colorspace operations can be lossy  in  both  directions
       (due  to  range-compression  and/or  quantization).   And,  when converting to PNM, information on interlacing and sample aspect ratio of a
       stream is lost (but can be reconstructed by supplying command-line arguments to pnmtoy4m).

OPTIONS
       y4mtopnm accepts the following options:

       -P   Produce PAM format output, instead of PPM and/or PGM.  PAM can encode a superset of PNM, but is not yet understood by as many graphics
            programs.  (Indeed, surprisingly few of the NetPBM tools seem to understand it.)

       -D   Produce  a  separate  output  image  for  each  field of each frame.  (Otherwise, a single image per frame, containing two interleaved
            fields, is created.)

            If the input stream is interlaced, the field-images are output in temporal order, i.e. the first image of a bottom-field-first  stream
            will be the bottom-field.  If the stream is progressive or has "mixed-mode" interlacing, then the temporal order is ambiguous, and the
            top-field will always be output first.

            Note that it will not be possible to later use pnmtoy4m to reconstruct a "mixed-mode" stream from a sequence of PNM/PAM images.

       -f   Produce a special 'flattened' output, most useful for analyzing and debugging streams.  All the planes  of  a  frame/field  are  tiled
            together into an enlarged PGM (or grayscale PAM) output image as follows:
                           +-----+                    +-----+
                   4:4:4   |  Y  |    4:4:4 w/alpha   |  Y  |
                           +-----+                    +-----+
                           |  Cb |                    |  Cb |
                           +-----+                    +-----+
                           |  Cr |                    |  Cr |
                           +-----+                    +-----+
                                                      |  A  |
                           +-----+                    +-----+
                   4:2:2,  |  Y  |
                   4:2:0   +--+--+                    +-----+--+--+
                           |Cb|Cr|            4:1:1   |  Y  |Cb|Cr|
                           +--+--+                    +-----+--+--+
                                        +-----+
                                 MONO   |  Y  |
                                        +-----+
            In  this  mode, any YUV4MPEG2 chroma format is accepted, but no upsampling or colorspace conversion is performed.  This is essentially
            just a reformatting/permutation of the original data from the input stream into a PGM image container.   All  the  other  command-line
            flags continue to have the same effect on output.

       -v [0,1,2]
            Set verbosity level.
             0 = warnings and errors only.
             1 = add informative messages, too.
             2 = add chatty debugging message, too.

EXAMPLES
       To turn the first 15 frames of an (MJPEG or DV) AVI file into individual PPM files:

            lav2yuv -f 15 your-video.avi | y4mscaler -O chromass=444 | y4mtopnm | pnmsplit - "your-video-%d.ppm"

AUTHOR
       This manual page was written by Matt Marjanovic.
       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:
         mjpeg-users@lists.sourceforge.net

       For more info, see our website at
              http://mjpeg.sourceforge.net/

SEE ALSO
       pam(5), pgm(5), pnm(5), ppm(5), pnmtoy4m(1), mjpegtools(1), mpeg2enc(1), lav2yuv(1), pnmsplit(1), y4mscaler(1)

MJPEG Tools Team                                                   28 April 2004                                                       y4mtopnm(1)
