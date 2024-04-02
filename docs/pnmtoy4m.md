pnmtoy4m(1)                                                     MJPEG tools manual                                                     pnmtoy4m(1)

NAME
       pnmtoy4m - Convert PNM/PAM images to YUV4MPEG2 stream

SYNOPSIS
       pnmtoy4m [options] [ filename ]

DESCRIPTION
       pnmtoy4m  converts  one or more raw PPM, PGM, PBM, or PAM images into a YUV4MPEG2 stream ready for further processing by other video tools.
       These three (or four) image formats are collectively referred to as "PNM images".

       Output is to stdout to facilitate piping to other MJPEG tools.  The size of the output frame(s) is determined from the (first) input image.

       Input is a 'raw' format PNM image, read from stdin or from the optional filename.  The input may contain multiple PNM  images  concatenated
       together;  pnmtoy4m  will  read and process them sequentially.  All images must have identical size and format.  Input images can be inter‐
       preted as whole progressive frames, pairs of interleaved fields, or as sequential fields (read in pairs of images) to be output  as  either
       interlaced or progressive frames.  PPM and PGM images must have 8 bits per channel (i.e. 'maxval' must be 255).

       PPM  input images should be in the usual R'G'B' colorspace.  They are converted to the Y'CbCr colorspace (ITU-R BT.601) before being output
       to a "4:4:4" (non-subsampled) YUV4MPEG2 stream.  If chroma subsampling is required (e.g. to 4:2:0 for MPEG), the output should  be  further
       piped through a program such as y4mscaler.

       PGM  images  should  be in the standard full-range ([0,255]) grayscale colorspace.  PGM and PBM images will be converted to BT.601 luma and
       output as "MONO" (luma-only) YUV4MPEG2 streams.

       The PAM format is a newer superset of the PNM formats; the precise contents of a PAM image is defined by the TUPLTYPE header tag.  pnmtoy4m
       handles  TUPLTYPE "GRAYSCALE" as PGM, "RGB" as PPM, and "RGB_ALPHA" as PPM with an 8-bit alpha channel.  (The alpha channel is converted to
       BT.601 luma as is appropriate for YUV4MPEG2 streams.)

       pnmtoy4m and y4mtopnm are inverses of each other; you can pipe the output of one into the other, and vice-versa.  Note that the  colorspace
       operations  are lossy in both directions.  And, when converting to PNM, information on interlacing and sample aspect ratio is lost (but can
       be reconstructed by supplying command-line arguments to pnmtoy4m).

OPTIONS
       pnmtoy4m accepts the following options:

       -o num
            Frame offset:  skip output of the first 'num' frames.  (default: 0)

       -n num
            Output a total of 'num' output frames.  Use '0' to specify all frames.  (default: 0)

       -B   Interpret data as being  BGR rather than RGB.

       -r   Repeat last input frame until output is complete.  If '-n 0' is also specified, last input frame will be repeated forever.

       -D x Treat each PNM image as a single (de-interleaved) field instead of a full frame.  The argument specifies the interpretation:
             t - the first image is a top-field
             b - the first image is a bottom-field

            With this option, two input images will be required per output frame.  Be careful:  mismatched "-I" and "-D" options  can  invert  the
            temporal or spatial order of the fields (or both).

       -F n:d
            Set framerate encoded in output stream, as an exact integer ratio.  (default:  30000:1001)  Common rates are:
             24000:1001 - NTSC 3:2 pulldown converted film
                   24:1 - native film
                   25:1 - PAL/SECAM
             30000:1001 - NTSC video
                   50:1 - PAL field rate
             60000:1001 - NTSC field rate

       -A n:d
            Set pixel aspect ratio encoded in output stream, as an exact integer ratio.  (default:  1:1)  Common ratios are:
                 1:1  - square pixels (computer graphics)
                10:11 - CCIR-601 NTSC
                59:54 - CCIR-601 PAL

       -I x Set the output interlacing mode, encoded in the output stream.  (Default is to match "-D" if given, or 'p' if not.)
             p - progressive, non-interlaced
             t - top/upper-field-first interlaced
             b - bottom/lower-field-first interlaced

       -v [0,1,2]
            Set verbosity level.
             0 = warnings and errors only.
             1 = add informative messages, too.
             2 = add chatty debugging message, too.

EXAMPLES
       To convert a file containing a single PPM file into a stream of 15 (identical) frames:

            pnmtoy4m -n 15 -r some-image.ppm

       To convert a series of Targa format images (in the current directory) to a YUV4MPEG2 stream displayed by yuvplay:

            ls *.tga | xargs -n1 tgatoppm | pnmtoy4m | yuvplay

AUTHOR
       This manual page was written by Matt Marjanovic.
       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:
         mjpeg-users@lists.sourceforge.net

       For more info, see our website at
              http://mjpeg.sourceforge.net/

SEE ALSO
       pam(5), pbm(5), pgm(5), pnm(5), ppm(5), y4mtopnm(1), mjpegtools(1), mpeg2enc(1), y4mscaler(1), yuv2lav(1), yuvplay(1)

MJPEG Tools Team                                                   28 April 2004                                                       pnmtoy4m(1)
