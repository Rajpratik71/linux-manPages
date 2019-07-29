yuvycsnoise(1)                                                  MJPEG tools manual                                                  yuvycsnoise(1)

NAME
       yuvycsnoise - Noise filter specialized for NTSC Y/C separation noise

SYNOPSIS
       yuvycsnoise [-t] [-m t|b|i|c] [-S MIN] [-T ERRT[,MAXT]] [-B ERRB[,MAXB]] [-I ERRI[,MAXI]] [-C ERRC[,MAXC]]

DESCRIPTION
       If  video  capture  hardware has only a poor Y/C separator, at vertical stripe (especially red/blue), noises appear which seem checker flag
       and bright/dark invert per 1 frame.  yuvycsnoise reduces noises of this type.

OPTIONS
       yuvycsnoise accepts the following options:

       -t      test. Instead of noise reduction, noises will be marked as black pixel.

       -m METHOD
               (default: tbic).
               Select method.  METHOD is string in which each character mean method.
                t: 'triframe' method of luma noise reduction.
                b: 'biframe' method of luma noise reduction.
                i: 'infield' method of luma noise reduction.
                c: chroma noise reduction. use 3 frames as 'triframe'.

       -S MIN  (default: 4).
               Set minimum threshold of luma/chroma difference which is treated as noise.

       -T ERRT[,MAXT]
               (default: 32,255).

       -B ERRB[,MAXB]
               (default: 32,255).

       -I ERRI[,MAXI]
               (default: 16,255).

       -C ERRC[,MAXC]
               (default: 12,255).
               Set threshold of luma/chroma difference of each methods.  ERRx is maximum error of luma/chroma of pixels around target pixel, which
               should be same if target contain noise.  MAXx is maximum threshold of luma/chroma difference of target pixel from luma/chroma after
               noise reduced.

AUTHOR
       yuvycsnoise was written by Kawamata/Hitoshi.
       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:
         mjpeg-users@lists.sourceforge.net

       For more info, see our website at
              http://mjpeg.sourceforge.net/

SEE ALSO
       mjpegtools(1)

MJPEG Tools Team                                                  5 February 2002                                                   yuvycsnoise(1)
