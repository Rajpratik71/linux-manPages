lav2yuv(1)                                                      MJPEG tools manual                                                      lav2yuv(1)

NAME
       lav2yuv - Convert a MJPEG file to raw yuv

SYNOPSIS
       lav2yuv [options] lavfile1 [lavfile2 ... lavfileN]

DESCRIPTION
       lav2yuv  converts  an  MJPEG  video sequence described by a sequence of MJPEG video files and/or edit lists pointing to such files into the
       simple uncompressed planar 4:2:0 Y'CbCr format, as used by mpeg2enc(1) MPEG encoder and  image  processing  filters  like  yuvscaler(1)  or
       yuv2dfilter(1) or yuvdenoise(1).

       Output is to stdout so that by piping the output of lav2yuv into a suitable pipeline it is possible to process and then encode or play back
       video recorded in any of the mjpegtools MJPEG container formats: AVI, quicktime or edit lists describing editted versions of video held  in
       such files.

       Mixing different files with different video formats is currently not possible.

       The -S -T -D options are used for scene detection which is used by linux video studio.

OPTIONS
       lav2yuv accepts the following options:

       -m   Force mono-chrome

       -c   Conceal frames containing corrupt MJPEG data by repeating the preceeding good frame.

       -S list.el
            Output a scene list with scene detection

       -T num
            Set scene detection threshold to num (default: 4)

       -D num
            Width decimation to use for scene detection (default: 2)

       -o num
            Frame offset - skip num frames at the beginning.  if num is negative all but the last num frames are skipped

       -f num
            Only num frames are written to stdout. 0 means that all frames are processed.

       -A width:height
            Set/override  the  sample  aspect  ratio  (SAR)  emitted in the output stream header.  Currently, the SAR is only auto-detected for DV
            files, and guessed otherwise.

       -P width:height
            Set the intended/approximate display aspect ratio (DAR) for the stream.  This value is only used to guess the SAR when  it  cannot  be
            detected  from  the  input  stream.   The default DAR is '4:3' (corresponding to a standard TV screen); another useful value is '16:9'
            (corresponding to widescreen TV).

       -C chroma
            Set output chroma (default: '420jpeg').  Currently, '420jpeg', '420mpeg2', '420paldv', '422' are available.

       -x   Exchange fields.  Useful if the field order was reversed during editing.

AUTHOR
       This man page was originally written by Bernhard Praschinger.
       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:
         mjpeg-users@lists.sourceforge.net

       For more info, see our website at
              http://mjpeg.sourceforge.net

SEE ALSO
       mjpegtools(1), mpeg2enc(1), yuvscaler(1), yuv2lav(1), yuvdenoise(1), yuvplay(1)

MJPEG Tools Team                                                   6 March 2002                                                         lav2yuv(1)
