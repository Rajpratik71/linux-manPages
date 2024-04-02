jpeg2yuv(1)                                                     MJPEG tools manual                                                     jpeg2yuv(1)

NAME
       jpeg2yuv - Convert jpeg images to the yuv format.

SYNOPSIS
       jpeg2yuv [-b num] [-f num] [-I num] [-A ratio] [-L num] [-n num] [-l num] [-j filename]

DESCRIPTION
       jpeg2yuv decompresses a sequence of JPEG files and pipes the image data to stdout as a YUV4MPEG2 stream.  Any JPEG format supported by lib‐
       jpeg can be read.  stdout will be filled with the YUV4MPEG2 movie data stream, so be prepared to pipe it on to mpeg2enc or to write it into
       a file.

OPTIONS
       jpeg2yuv accepts the following options:

       -b num
            Frame offset:  skip output of the first 'num' frames.  (default: 0)

       -f num
            Set the frame rate of stream accepts the same numbers.  No default, this option has to be specified.

       -A ratio
            Sample aspect ratio.  Default is square pixels (1:1)

       -I num
            interlacing mode: p = none / progressive
            t = top field first
            b = bottom field first
            No default, this option has to be specified.

       -L num
            0 = non-interlaced (two successive fields per JPEG file)
            1 = interlaced fields

       -l num
            Specifies the number of loops (default: 0 loops )
            When  this  option  is  not used the given range of images is only processed once. If you use this option with num of -1 jpeg2yuv will
            loop forever writing the image to stdout. When you use n > 0 it will loop n-times till it finishes.

       -n num
            Specifies the number of frames to process. (default: all = -1)

       -j {1}%{2}d{3}
            Read JPEG frames with the name components as follows:
             {1} JPEG filename prefix (e g: picture_ )
             {2} Counting placeholder (like in C, printf, eg 06 ))
             {3} File extension. Something like this: .jpg A correct description of the files could look like this: picture_%06d.jpg

            If this option is omited, the filenames are read from stdin. For example:
             $ls *jpg | jpeg2yuv -f 25 -I p > result.yuv

       -R 1 or 0
            rescale YUV color values from 0-255 to 16-235 (default: 1)

       -v num
            Verbosity level (0, 1 or 2)

BUGS
       The frame rate description seems not to be up to date. The NTSC integer ratios seem not to be supported. As a workaround specify a PAL (25)
       or FILM (24) and set the right frame rate in mpeg2enc with the -F option.

AUTHOR
       This man page was written by Bernhard Praschinger.
       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:
         mjpeg-users@lists.sourceforge.net

       For more info, see our website at
              http://mjpeg.sourceforge.net

SEE ALSO
       mjpegtools(1), mpeg2enc(1), ppmtoy4m(1), yuv2lav(1), yuvdenoise(1), yuvmedianfilter(1), yuvscaler(1)

MJPEG Tools Team                                                  8 December 2001                                                      jpeg2yuv(1)
