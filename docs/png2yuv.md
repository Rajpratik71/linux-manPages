png2yuv(1)                                                      MJPEG tools manual                                                      png2yuv(1)

NAME
       png2yuv - Convert PNG images to the YUV4MPEG stream format.

SYNOPSIS
       png2yuv [-b num] [-f num] [-I num] [-L num] [-n num] [-l num] [-j filename]

DESCRIPTION
       png2yuv decompresses a sequence of PNG files and pipes the image data to stdout as a YUV4MPEG2 stream.  Any 8bit/pixel PNG format supported
       by libpng can be read.  stdout will be filled with the YUV4MPEG movie data stream, so be prepared to pipe it on to mpeg2enc or to write  it
       into a file.

       This tool is incomplete.  The alternative utility you are probably looking for is ppmtoy4m(1), which is also included in MJPEGtools.

OPTIONS
       png2yuv accepts the following options:

       -b num
            Frame offset:  skip output of the first 'num' frames.  (default: 0)

       -f num
            Set the frame rate of stream accepts the same numbers. Not default, this option has to be specified.

       -I num
            interlacing mode: p = none / progressive
            t = top field first
            b = bottom field first
            No default, this option has to be specified.

       -L num
            0 = non-interleaved (two successive fields per PNG file)
            1 = interleaved fields

       -l num
            Specifies the number of loops (default: 0 loops )

       -S samp_mode
            chroma subsampling mode, only for professionals, for more info see ppmtoy4m and the YUV guide on http://www.mir.com/DMG/.
            default: 420_jpeg
            When  this  option  is not used the given range of images is only processed once. If you use this option and as number 1, jpeg2yv will
            loop forever writing the image to stdout. When you use n > 1 it will loop. n-time till it finishes.

       -n num
            Specifies the nummber of frames to process. (default: all = -1)

       -j {1}%{2}d{3}
            Read PNG frames with the name components as follows:
             {1} PNG filename prefix (e g: picture_ )
             {2} Counting placeholder (like in C, printf, eg 06 ))
             {3} File extension. Something like this: .png A correct description of the files could look like this: picture_%06d.png

       -v num
            Verbosity level (0, 1 or 2)

BUGS
       The frame rate description does not seem to be up to date. The NTSC integer ratios are not supported (use floating point instead). As work‐
       around  specify  a  PAL  (25)  or native FILM (24) and set the right frame rate in mpeg2enc with the -F option.  Interlaced handling is not
       implemented yet.

AUTHOR
       This man page was written by Gernot Ziegler.
       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:
         mjpeg-users@lists.sourceforge.net

       For more info, see our website at
              http://mjpeg.sourceforge.net

SEE ALSO
       mjpegtools(1), mpeg2enc(1), ppmtoy4m(1), yuv2lav(1), yuvdenoise(1), yuvmedianfilter(1), yuvscaler(1)

MJPEG Tools Team                                                  2 February 2003                                                       png2yuv(1)
