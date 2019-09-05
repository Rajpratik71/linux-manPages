y4mcolorbars(1)                                                 MJPEG tools manual                                                 y4mcolorbars(1)

NAME
       y4mcolorbars - Create a YUV4MPEG2 stream containing a colorbar test pattern

SYNOPSIS
       y4mcolorbars [options]

DESCRIPTION
       y4mcolorbars  creates  a YUV4MPEG2 stream consisting entirely of frames containing a colorbar test pattern.  The pattern attempts to repro‐
       duce the standard SMPTE EG-1-1990 colorbar test signal as faithfully as possible, given the constraints of the Y'CbCr colorspace.

       Output is to stdout to facilitate piping to other MJPEG tools.

OPTIONS
       y4mcolorbars accepts the following options:

       -n num
            Output a total of 'num' output frames. [default: 1]

       -F n:d
            Set framerate encoded in output stream, as an exact integer ratio.  Common rates are:
             24000:1001 - NTSC 3:2 pulldown converted film
                   24:1 - native film
                   25:1 - PAL/SECAM
             30000:1001 - NTSC video [default]
                   50:1 - PAL field rate
             60000:1001 - NTSC field rate

       -W w Set frame width. [default: 720]

       -H h Set frame height. [default: 480]

       -A n:d
            Set pixel aspect ratio encoded in output stream, as an exact integer ratio.  Common ratios are:
                 1:1  - square pixels (e.g. computer graphics)
                10:11 - CCIR-601 NTSC [default]
                59:54 - CCIR-601 PAL

       -I x Set interlacing mode, used to interpret the PPM image(s), and also encoded in output stream.
             p - progressive, non-interlaced [default]
             t - top/upper-field-first interlaced
             b - bottom/lower-field-first interlaced

       -Q n Data to place in the "-I/+Q" patches in the bottom row of the pattern:
             0 -  -I and +Q at 20% (20IRE)  [default]
             1 -  -I and +Q at 50% (50IRE)
             2 -  +Cb and +Cr at 100%

       -S mode
            Set chroma subsampling mode.
                   444 - 4:4:4 (no subsampling) [default]
               420jpeg - 4:2:0 JPEG/MPEG-1, interstitial cositing
              420mpeg2 - 4:2:0 MPEG-2, horizontal cositing

            The supported subsampled modes use a lousy subsampling filter; better results will be achieved by passing the default 4:4:4 output  to
            a scaler which supports subsampling, such as y4mscaler(1).

       -v [0,1,2]
            Set verbosity level.
             0 -  warnings and errors only.
             1 -  add informative messages, too. [default]
             2 -  add chatty debugging message, too.

EXAMPLES
       To create and display 200 frames of colorbars corresponding to a top-field-first interlaced 4:3 NTSC source:

            y4mcolorbars -n 200 -It -S 420jpeg | yuvplay

       To create and display 200 frames of colorbars corresponding to a bottom-field-first interlaced 4:3 PAL source:

            y4mcolorbars -n 200 -H 576 -F 25:1 -A 59:54 -Ib | yuvplay

BUGS
       First,  it's not clear to the author (who hasn't actually ever seen the SMPTE EG-1-1990 document itself) what the absolute excursion of the
       -I and +Q regions is supposed to be; however, the phase is correct, and that should be the critical feature.  Second, the PLUGE bars, of -4
       and  +4  IRE,  can  never  be  precisely synthesized --- the Y' digital space maps [16,235] over the full luma excursion, but the full luma
       excursion in analog space depends on whether or not 7.5 IRE NTSC setup is being used by whatever device eventually produces the analog out‐
       put.  However, the difference is within 1-bit of Y' accuracy anyway.

AUTHOR
       This man page was written by Matt Marjanovic.
       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:
         mjpeg-users@lists.sourceforge.net

       For more info, see our website at
              http://mjpeg.sourceforge.net

SEE ALSO
       mjpegtools(1), mpeg2enc(1), y4mscaler(1), yuv2lav(1), yuvplay(1)

MJPEG Tools Team                                                   28 April 2004                                                   y4mcolorbars(1)
