yuvkineco(1)                                                    MJPEG tools manual                                                    yuvkineco(1)

NAME
       yuvkineco - revert 2-3 pulldown movie

SYNOPSIS
       yuvkineco [options] [-C PATH]
       yuvkineco [options] -O|N PATH

DESCRIPTION
       yuvkineco  reverts  to  original non-interlaced frames, from NTSC video which was film sourced and 2-3 pulled down.  Input fps code must be
       4(29.97fps), output fps code can be selected from 1(23.97fps) to 4(29.97fps). If 2, 3 or 4 selected, duplicated frames remain but they  are
       reverted  to  non-interlaced.  If input was non-interlaced only remove duplicate frames.  Interlaced frame detection may fail in conditions
       like:
           Pull down cycle changed (video editing).
           Low quality pull down.
           Motionless scene.
       If -C PATH was specified, yuvkineco outputs 2-3 pull down cycle list to the file.  You can edit this file by hand and feed it to  yuvkineco
       with -O or -N option to correct mistake of 1st yuvkineco.  Try -C and see cycle list.
         EXAMPLE #1: for 24p movie / automatically
           lav2yuv 60i.eli | \
               yuvkineco -F 1 | yuv2lav -f a -I 0 -o 24p.avi
         EXAMPLE #2: for 30p/24p mix / automatically
           lav2yuv 60i.eli | \
               yuvkineco -F 4 | yuv2lav -f a -I 0 -o 30p.avi
         EXAMPLE #3: for 24p movie / check and repair
           lav2yuv 60i.eli | \
               yuvkineco -F 1 -C 60i.23c | \
               yuv2lav -f a -I 1 -o take1.avi
           glav -F +n take1.avi  # check and edit 60i.23c
           lav2yuv take1.avi | \
               yuvkineco -F 1 -N 60i.23c | \
               yuv2lav -f a -I 0 -o take2.avi
         EXAMPLE #4: for 24p movie / check and retry
           lav2yuv 60i.eli | \
               yuvkineco -F 1 -C 60i.23c | \
               yuv2lav -f a -I 0 -o take1.avi
           glav -F +n take1.avi  # check and edit 60i.23c
           lav2yuv 60i.eli | \
               yuvkineco -F 1 -O 60i.23c | \
               yuv2lav -f a -I 0 -o take2.avi

OPTIONS
       yuvkineco accepts the following options:

       -F FPSCODE
               Set output fps code (default: same as input).

       -C PATH Specify 2-3 pull down cycle list file name to write.

       -O PATH Specify cycle list name to read with old yuv stream to retry.

       -N PATH Specify cycle list name to read with new yuv stream to repair.

       -S MIN  Use yuvycsnoise(1) as preprocessor and specify minimum threshold.

       -n LEVEL
               Specify noise level of input (default: 10).  This affects both pulldown cycle detection and deinterlacing.

       -c THRESHOLD
               Specify  threshold to decide pictures in 2 frames are same (default: 4).  yuvkineco compares several frames, searches pair of frame
               they contain same pictures, to decide which frame should be dropped.  If THRESHOLD is 0, pair which has smallest difference will be
               selected.  If 16, selected from pairs those have differences smaller than average.

       -i PERMIL
               yuvkineco  deinterlaces  each  frame after 2-3 pulldown reverting process, specify how much pixels deinterlaced to decide to use or
               not use deinterlacing result (default: 10).  If PERMIL is 10 and 1% or more of pixels deinterlaced, deinterlacing  result  will  be
               used.   If  0, always deinterlacing result will be used.  If 1000, deinterlacing result will not be used, but deinterlacing process
               will run on all of frames.  To disable deinterlacing process, specify negative value.

       -u      Set interlace information in header of output to unknown (default: non-interlaced).

AUTHOR
       yuvkineco was written by Kawamata/Hitoshi.
       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:
         mjpeg-users@lists.sourceforge.net

       For more info, see our website at
              http://mjpeg.sourceforge.net/

SEE ALSO
       mjpegtools(1), yuvycsnoise(1).

MJPEG Tools Team                                                  5 February 2002                                                     yuvkineco(1)
