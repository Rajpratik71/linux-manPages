yuv2lav(1)                                                      MJPEG tools manual                                                      yuv2lav(1)

NAME
       yuv2lav - encodes lavtool's raw YUV frame streams into MJPEG files

SYNOPSIS
       yuv2lav [-f a|A|q|m] [-q num] [-b num] [-I num] [-m num] [-v num] [-w file] -o output-file

DESCRIPTION
       yuv2lav  is  a  simple  MJPEG  encoder for raw YUV frame streams as they are emitted by lav2yuv(1) or lavpipe(1), for example. It reads its
       input from stdin and is capable of writing AVI and Quicktime.

OPTIONS
       The command line options allow to specify the output file name, JPEG encoding quality and the amount of memory that will be  allocated  for
       JPEG compressed data.

       -o output-file
              This  (compulsorary)  option  sets the name of the file that yuv2lav will write its output to. If the output file contains a % (e.g.
              file%02d.avi), the output will be written to multiple files in case this is necessary (file00.avi, file01.avi and so on).

       -f a|A|q
              This sets the output file format, which has to be one of
               a - for AVI file output,
               A - for AVI with reversed fields,
               q - for Quicktime output or
              AVI with reversed field of course only makes sense if yuv2lav's feed is an interlaced video source and should only be needed if  you
              experience  frame  reversal  problems in your output.  If you don't use that option yuv2lav will set the output format to AVI if the
              last 3 char are avi, or to Quicktime if you use mov. If you use the -f option it overides the setting in the filename

       -q num This option specifies the JPEG encoding quality as passed through to libjpeg. The default value is 80, num must lie within  24...100
              inclusive  (think  of  it  as percentage values, although with a lossy compression algorithm like JPEG, keeping 100% of the original
              quality is of course not really possible).

       -b num This option specifies the size of the buffer (in kBytes) that yuv2lav allocates in order to store the compressed JPEG  data  in  it.
              The default value (256k) is perfectly enough for 100% quality full sized PAL/NTSC, but if you want to compress Super-Mega-HDTV or if
              you are low on memory, you can use this option to suit your needs.

       -m num This is the maximum size (in MB) per file. Normally this depends on the output file type.

       -I num Force a specific interlacing type. 0 means no interlacing, 1 means top-field-first, 2 means bottom-field-first.

       -w file
              This is the WAV file containing audio data to be combined with the video stream into the output file.

       -v num Verbosity level. 0 means only print error messages, 2 prints full debug output.

       -?     Display a synopsis of the command syntax.

EXAMPLES
       lav2yuv movie.avi | yuv2lav -fq -q 30 lowbitrate.qt
              would recompress movie.avi as a low bit rate Quicktime file.

       lavpipe input.pli | yuv2lav -q80 output.avi
              would save the movie assembled by lavpipe as a single AVI file.

BUGS
       If you experience any problems with this tool, please feel free to contact the developers (see below).

AUTHOR
       This man page was written by pHilipp Zabel.
       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:
           mjpeg-users@lists.sourceforge.net
       For more info, see our website at
           http://mjpeg.sourceforge.net/

SEE ALSO
       lav2yuv(1), lavpipe(1), lavplay(1), lavrec(1), mpeg2enc(1), yuvscaler(1)

MJPEG Tools Team                                                    2 June 2001                                                         yuv2lav(1)
