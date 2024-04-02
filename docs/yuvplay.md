yuvplay(1)                                                      MJPEG tools manual                                                      yuvplay(1)

NAME
       yuvplay - Display YUV4MPEG2 streams (using SDL)

SYNOPSIS
       yuvplay [options]

DESCRIPTION
       yuvplay  produces  on-screen  playback  of  a  YUV4MPEG2  stream  which  is  provided to stdin, typically through piping from the stdout of
       lavpipe(1), lav2yuv(1), mpeg2dec(1) or a similar program.  It should be noted that for pure playback lavplay should be a  superior  option.
       yuvplay is intended primarily as a debugging or diagnostic utility when setting up video processing pipelines.

OPTIONS
       yuvplay accepts the following options:

       -s WxH  The  size  of  the SDL window.  By default, it uses the size of the input video stream scaled to yield 1:1 pixels (using the sample
               aspect ratio encoded in the stream header).  However, you can specify any size you want.  WxH is the width x height of  the  scaled
               window.

       -ttitle Set the window title.

       -f num  Override the framerate specified in the input stream header.

       -c      By  default, yuvplay will try to play at the framerate of the input movie.  With this option, yuvplay will just play all the frames
               as fast as it can.

       -v [0,1,2]
               Set the verbosity of user feedback.  Default is "1":  errors, warnings, and info messages.

AUTHOR
       This man page was originally written by Ronald Bultje (and since edited by Matt Marjanovic).
       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:
         mjpeg-users@lists.sourceforge.net

       For more info, see our website at
              http://mjpeg.sourceforge.net/

SEE ALSO
       mjpegtools(1), lavpipe(1), lav2yuv(1) lavplay(1)

MJPEG Tools Team                                                   8 April 2002                                                         yuvplay(1)
