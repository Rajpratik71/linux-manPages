yuvfps(1)                                                       MJPEG tools manual                                                       yuvfps(1)

NAME
       yuvfps - Converts to a different frame rate

SYNOPSIS
       yuvfps [-r Num:Den] [-s Num:Den] [-i Interlacing] [-I Interlacing] [-c] [-n] [-w] [-v 0-2] [-h]

DESCRIPTION
       yuvfps is a general (UP or DOWN) resampling utility that is provided to allow the generation of video streams with the frame rates required
       for each standard video format. yuvfps reads a YUV4MPEG stream from the standard input and outputs a YUV4MPEG stream to the standard output
       in  which  frames  from  the  original  ones  are skipped (downsampling) or duplicated (upsampling).  This allows for other mjpegtools that
       require a specific frame rate to process the stream.

       yuvfps uses by default Bresenham's algorithm to do the resampling so that the new video stream is similar to the original one.  Note,  how‐
       ever,  that  downscaling  is  a  non-reversible operation because frames are dropped. Moreover, the resulting video stream may not have the
       exact same duration as the original one if the new frame rate is not a whole multiple of the original rate.

       As an alternative to simply dropping or duplicating frames each output frame/field can be produced as a weighted average of the two  tempo‐
       rally closest input frames/fields.  In this mode, yuvfps can also change the interlacing mode of the stream.

       yuvfps  also  can  "fix"  the framerate specified in the YUV4MPEG header.  This allows for the generation of effects (fast-forwarding, slow
       motion) and also when the source stream has some framerate that is very close, but not exactly, the rate required for some  standard  video
       (for example, 24.9 vs 25).

OPTIONS
       -r Num:Den

              Specifies the resulting stream frame rate.

       -s Num:Den

              Ignores the frame rate in the input stream and assumes this frame rate for the input stream.

       -i Interlacing

              Specifies  the  interlacing  mode of the resulting stream.  The interlacing mode can be changed only when using the weighted average
              resampling mode (the -w option).

              p - progressive (non-interlaced)
              t - top-field first
              b - bottom-field first

       -I Interlacing

              Ignores the interlacing mode information in the input stream and assumes this interlacing mode for the input stream.   The  possible
              values are the same as for the -i option.

       -c

              Changes  the  stream  header frame rate and interlacing mode in the output stream but copies frames from the original stream without
              changes.  The -r and -i options specify the frame rate and interlacing mode for the output stream header.

       -n

              By default yuvfps tries to find a normalized framerate. Some programs create framerates like: 29969909:1000000 which is actually  th
              typical NTSC framerate of 30000:1001. yuvfps prints out the normalizes values and the original when it starts. If you think the nor‐
              malized value is not correct and want yuvfps to use the original given number you have to add that option. So yuvfps does not try to
              normalize the values.

       -w

              Produce  each  output frame/field as a weighted average of the two temporally closest input frames/fields instead of simply dropping
              or duplicating frames.  The blending of two adjacent frames/fields reduces visible stepping compared to the  default  drop/duplicate
              algorithm but as a drawback it makes fast moving objects appear blurred and is much slower.

       -v  [0,1,2]

              Set verbosity level.
               0 = warnings and error messages only.
               1 = add informative messages, like the framerate conversation information.
               2 = add chatty debugging message, too.

AUTHOR
       This man page was written by Alfonso García-Patiño Barbolani.
       Johannes Lehtinen added information about the weighted average resampling mode and the related options.
       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:
         mjpeg-users@lists.sourceforge.net

       For more info, see our website at
              http://mjpeg.sourceforge.net/

SEE ALSO
       yuvscaler(1), mjpegtools(1), lavpipe(1), lav2yuv(1) mpeg2enc(1)

MJPEG Tools Team                                                    8 Jan 2006                                                           yuvfps(1)
