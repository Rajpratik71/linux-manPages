ppmtoy4m(1)                                                     MJPEG tools manual                                                     ppmtoy4m(1)

NAME
       ppmtoy4m - Convert PPM images to YUV4MPEG2 stream

SYNOPSIS
       ppmtoy4m [options] [ filename ]

DESCRIPTION
       ppmtoy4m converts one or more raw PPM images into a YUV4MPEG2 stream ready for further processing by other video tools.

       Output is to stdout to facilitate piping to other MJPEG tools.  The size of the output frame(s) is determined from the (first) input image.

       Input  is  a 'raw' format PPM image, read from stdin or from the optional filename.  The input may contain multiple PPM images concatenated
       together; ppmtoy4m will read and process them sequentially.  All images must have identical size and format.  Input images  can  be  inter‐
       preted  as whole progressive frames, interleaved fields, or (in pairs) as sequential fields.  The input images must have 8 bits per channel
       (i.e. 'maxval' must be 255).

       Input images should be in the usual R'G'B' colorspace.  They are converted to the Y'CbCr colorspace (ITU-R BT.601) (and chroma  subsampled,
       if desired) before output.

       ppmtoy4m and y4mtoppm are inverses of each other; you can pipe the output of one into the other, and vice-versa.  Note that the subsampling
       and colorspace operations are lossy in both directions.  And, when converting to PPM, information on interlacing and sample aspect ratio is
       lost (but can be reconstructed by supplying command-line arguments to ppmtoy4m).

OPTIONS
       ppmtoy4m accepts the following options:

       -o num
            Frame offset:  skip output of the first 'num' frames.  (default: 0)

       -n num
            Output a total of 'num' output frames.  Use '0' to specify all frames.  (default: 0)

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

       -B   Interpret data as being BGR rather than RGB.

       -I x Set interlacing mode, used to interpret the PPM image(s), and also encoded in output stream.  (default:  'p')
             p - progressive, non-interlaced
             t - top/upper-field-first interlaced
             b - bottom/lower-field-first interlaced

       -L   For  interlaced  streams, treat each PPM image as two interleaved fields.  (Otherwise, two PPM images will be read for each frame; one
            per field.)

       -r   Repeat last input frame until output is complete.  If '-n 0' is also specified, last input frame will be repeated forever.

       -S mode
            Set chroma subsampling mode.  (default:  444)
                   444 - 4:4:4 (no subsampling)
               420jpeg - 4:2:0 JPEG/MPEG-1, interstitial cositing
              420mpeg2 - 4:2:0 MPEG-2, horizontal cositing

            The subsampled modes use a lousy subsampling filter; better results will be achieved by passing the default 4:4:4 output to  a  scaler
            which supports subsampling, such as y4mscaler(1).

       -v [0,1,2]
            Set verbosity level.
             0 = warnings and errors only.
             1 = add informative messages, too.
             2 = add chatty debugging message, too.

EXAMPLES
       To convert a file containing a single PPM file into a stream of 15 (identical) frames:

            ppmtoy4m -n 15 -r some-image.ppm

       To convert a series of Targa format images (in the current directory) to a YUV4MPEG2 stream displayed by yuvplay:

            ls *.tga | xargs -n1 tgatoppm | ppmtoy4m | yuvplay

AUTHOR
       This man page was written by Matt Marjanovic.
       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:
         mjpeg-users@lists.sourceforge.net

       For more info, see our website at
              http://mjpeg.sourceforge.net/

SEE ALSO
       ppm(5), y4mtoppm(1), mjpegtools(1), mpeg2enc(1), y4mscaler(1), yuv2lav(1), yuvplay(1)

MJPEG Tools Team                                                   28 April 2004                                                       ppmtoy4m(1)
