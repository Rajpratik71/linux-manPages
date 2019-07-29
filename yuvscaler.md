yuvscaler(1)                                                    MJPEG tools manual                                                    yuvscaler(1)

NAME
       yuvscaler - UPscales or DOWNscales a YUV4MPEG2 stream to a specified format

SYNOPSIS
       yuvscaler [-I input_keyword] [-M mode_keyword] [-O output_keyword] [-n p|s|n] [-v 0-2] [-h]

DESCRIPTION
       yuvscaler  is  a  general  (UP or DOWN) scaling utility that is provided to allow conversion between different video formats. It reads in a
       YUV4MPEG2 format stream from stdin (such as that produced by lav2yuv) and outputs such stream to stdout (e.g. to be consumed by  mpeg2enc).
       The most common use of yuvscaler is to generate input suitable for MPEG encoding to VCD or SVCD formats using mpeg2enc(1).

       yuvscaler will automatically take into account PAL/SECAM and NTSC format, as well as widescreen (16:9) format and interlacing. Use of yuvs‐
       caler was designed to be straightforward.

EXAMPLES
       VCD encoding:
       lav2yuv my-file.avi | yuvscaler -O VCD | mpeg2enc -f 1 -o vcd.%d.m1v

       SVCD encoding:
       lav2yuv my-file.qt | yuvscaler -O SVCD | mpeg2enc -f 4 -o svcd.%d.m2v

       Encoding anamorphic 16:9 as letterboxed VCD:
       lav2yuv my-ana16-9.eli | yuvscaler -M WIDE2VCD | mpeg2enc -f 1 -o letterbox_vcd.%d.m1v

       Encoding anamorphic 16:9 as letterboxed SVCD:
       lav2yuv my-ana16-9.eli | yuvscaler -M WIDE2STD -O SVCD | mpeg2enc -f 4 -o letterbox_svcd.%d.m2v

       Encoding anamorphic 16:9 as letterboxed DVD:
       lav2yuv my-ana16-9.eli | yuvscaler -M WIDE2STD -O DVD | mpeg2enc -f 8 -o letterbox_dvd.%d.m2v

OPTIONS
       -I input_keyword

              Specifies input processing options.  Input options may be combined by using multiple -I flags. Possible input_keywords are:

              USE_WidthxHeight+WidthOffset+HeightOffset to select a useful area of the input frame (all multiple of  2,  Height  and  HeightOffset
              multiple of 4 if interlaced), the rest of the image being discarded

              ACTIVE_WidthxHeight+WidthOffset+HeightOffset to select an active area of the input frame (all multiple of 2, Height and HeightOffset
              multiple of 4 if interlaced), the rest of the image being made black

       -M mode_keyword

              Sets the scaling mode options.  Scaling mode options can be combined by giving several -M flags.  Possible  are:

              BICUBIC - to use the (Mitchell-Netravalli) high-quality bicubic upsacling and/or downscaling algorithm

              RESAMPLE - to use a classical resampling algorithm -only for downscaling- that goes much faster than bicubic. For coherence  reason,
              yuvscaler will use RESAMPLE if only downscaling is necessary, BICUBIC if not.

              WIDE2STD - convert widescreen anamorphic (16:9) input video into letterboxed (4:3), generating necessary black lines.  Note that for
              MPEG applications if your player can properly decode anamorphic video you may wish to leave the video unscaled  and  simply  specify
              the approprate format during MPEG encoding (see mpeg2enc(1)).

              RATIO_WidthIn_WidthOut_HeightIn_HeightOut  to  specified  scaling  ratios  of  WidthIn/WidthOut for width and HeightIN/HeightOut for
              height to be applied to the useful area. The output frames that result from scaling can have a different format than the output for‐
              mat  specified  using  -O options(s).  In this case, yuvscaler automatically generate necessary black lines and columns and/or skips
              necessary lines and columns to center the scaled image in the output frame.

              WIDE2VCD to scale anamorphic widescreen (16:9) frames into letterboxed VCD format (equivalent to -M WIDE2STD -O VCD).

              FASTVCD to transcode full sized frames to VCD (equivalent to -M RATIO_2_1_2_1 -O VCD, see below).

              FAST_WIDE2VCD to transcode full-sized anamorphic (16:9) frames to letter-boxed VCD (equivalent to -M WIDE2STD  -M  RATIO_2_1_2_1  -O
              VCD, see below).

              NO_HEADER to suppress stream header generation on output

              MMX to use MMX functions for BICUBIC scaling (experimental feature!!)

       -O output_keyword

              Sets  the output frame format options.  Output format options can be combined by giving several -O flags.  By default, output frames
              size will be the same as input frame sizes, as well as output frames interlacing if coherent with output keyword specification which
              prevails, top_first if not.

              MONOCHROME  to  generate  monochrome  frames on output.  Chrominance information for the scaled pixels is set neutral (white).  MPEG
              encoding of black and white video will be both inefficient and show annonying chrominance artifacts unless this is done.

              VCD to generate VCD compliant frames on output (taking care of PAL and NTSC standards). Non-interlaced output.

              SVCD to generate SVCD compliant frames on output (taking care of PAL and NTSC standards). Top-field-first interlaced frames.

              DVD to generate DVD compliant frames on output (taking care of PAL and NTSC standards). Top-field-first interlaced frames.

              SIZE_WidthxHeight to generate frames of size WidthxHeight on output (multiple of 4)

              If VCD, SVCD or DVD keywords are not used, output interlacing is taken of the same type as input. By  default,  output  frames  size
              will be the same as input frame size.

       -n p|s|n
              (usually   not   necessary)   if   norm   could  not  be  determined  from  data  flux,  specifies  the  OUTPUT  norm  for  VCD/SVCD
              (p=pal,s=secam,n=ntsc).

       -v 0|1|2
              Specifies the degree of verbosity: 0=quiet, 1=normal, 2=verbose/debug

       -h     Prints a summary of command line syntax.

       Note: The most useful downscaling ratios are handled using dedicated optimised scaling routines. They are:

              RATIO_WidthIn_WidthOut_2_1 => Full-sized frame to VCD downscaling

              RATIO_3_2_1_1 => Full-sized frame to SVCD downscaling

              RATIO_1_1_4_3 => WIDE2STD downscaling mode

              RATIO_WidthIn_WidthOut_1_1 => downscaling only concerns width, not height

              RATIO_1_1_HeightIn_HeightOut => downscaling only concerns height, not width

              RATIO_2_1_2_1 => FASTVCD, slightly width distorted (real ratio 45 to  22)  but  faster  full-sized  frame  to  VCD  downscaling  (-M
              RATIO_2_1_2_1 -O VCD)

              RATIO_WidthIn_WidthOut_8_3 => specific to WIDE2VCD downscaling (-M WIDE2STD -O VCD)

              RATIO_2_1_8_3 => specific to (slighly distorted) FAST_WIDE2VCD downscaling (-M WIDE2STD -M RATIO_2_1_2_1 -O VCD)

              RATIO_1_1_1_1 => copy useful input part of possible several files into output frames

AUTHOR
       This man page was written by Xavier Biquard et al.
       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:
         mjpeg-users@lists.sourceforge.net

       For more info, see our website at
              http://mjpeg.sourceforge.net/

SEE ALSO
       mjpegtools(1), lavpipe(1), lav2yuv(1) mpeg2enc(1)

MJPEG Tools Team                                                 26 Septembre 2001                                                    yuvscaler(1)
