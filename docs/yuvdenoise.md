yuvdenoise(1)                                                   MJPEG tools manual                                                   yuvdenoise(1)

NAME
       yuvdenoise - Motion-Compensating-YUV4MPEG2-frame-denoiser

SYNOPSIS
       yuvdenoise [options] </dev/stdin >/dev/stdout

DESCRIPTION
       yuvdenoise  is  a  spatio-temporal  noise-filter for YUV4MPEG2 streams. This is useful to reduce the bitrate needed to encode your captured
       movies for VCD and SVCD creation.

OPTIONS
       yuvdenoise accepts the following options:

       -g y,u,v [0..255] Gaussian filter thresholds
           This sets the thresholds for the gaussian filter.  A value of 0 disables filtering for a specific component and 0,0,0  completely  dis‐
           ables/bypasses the filter.  This filter is applied before the temporal (-t) filter.
           (default=0,0,0)

       -m y,u,v [0..255] Pre 3D Median filter thresholds
           This  sets the thresholds for the pre-processing 3D median filter.  A value of 0 disables median filtering for a specific component and
           0,0,0 completely disables/bypasses the filter.  This filter is applied before the temporal (-t) filter.
           (default=0,0,0)

       -r y,u,v [0..255] Renoising filter thresholds
           This sets the thresholds for adding random "noise" back into the video stream.  Default is disabled (not adding  random  noise).   This
           filter, if enabled, is run as the Blast filter (after the median and temporal filters).  Reasonable value is 4,8,8 but if you are work‐
           ing with monochrome (black and white movie) then 4,0,0 will speed things up by not processing the chroma planes.
           (default=0,0,0)

       -t y,u,v [0..255] Temporal noise-filter thresholds
           This sets the thresholds for the temporal noise-filter.  Values above 12 may introduce ghosting.  The default value for Y' (y) is often
           a  little  high  and  reducing it to 4 or 5 may be necessary.  If the chroma smears or ghosts try using values of 5 or 6 instead of the
           default (12).  A value of 0 disables temporal filtering for the specified component (0,0,0 disables/bypasses all  temporal  filtering).
           Thus for black and white movies 4,0,0 will be faster by not denoising the chroma planes.
           (default=4,8,8)

       -M y,u,v [0..255] Post 3D Median filter thresholds
           This sets the thresholds for the post-processing 3D median filter.  A value of 0 disables median filtering for a specific component and
           0,0,0 completely disables/bypasses the filter.  This filter is applied after the temporal (-t) filter.  Reasonable value is  4,8,8  but
           if you are working with monochrome (black and white movie) then 4,0,0 will speed things up by not processing the chroma planes.
           (default=0,0,0)

HOW IT WORKS
       To Be Written (maybe) in the future.

TYPICAL USAGE AND TIPS
       As it is self-adapting to the noise-situation found in the stream you normally just can go without any options set:

       lav2yuv my-video.avi | yuvdenoise | mpeg2enc -t 1 -o my-video.m1v

AUTHOR
       This man page was written by Stefan Fendt <stefan@lionfish.ping.de> and revised by Steven Schultz.

ADDITIONAL INFO
       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:

       mjpeg-users@lists.sourceforge.net

       For more info, see our website at

       http://mjpeg.sourceforge.net/

SEE ALSO
       mjpegtools(1), mpeg2enc(1) lavrec(1) lav2yuv(1)

MJPEG Tools Team                                                 11th August 2005                                                    yuvdenoise(1)
