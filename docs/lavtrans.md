lavtrans(1)                                                     MJPEG tools manual                                                     lavtrans(1)

NAME
       lavtrans - Convert MJPEG videos to other MJPEG video formats

SYNOPSIS
       lavtrans -o outputfile -f a|q|i|w [-i num] lavfile1 [lavfile2 ... lavfileN]

DESCRIPTION
       lavtrans  can  be  used  to convert the recorded videos from one MJPEG "container" format  to another one. It can also be used to split the
       streams, or do destructive edits.

       Like all the other mjpegtools(1) lavtrans also accept a edit list file in place of actual video files. This allows it to be  used  to  con‐
       struct a stand-alone copy of the editted video sequence described in the editlist.

       Note that lavtrans can only change the container type of MJPEG video, not the format.  As such it is not possible to use it combine streams
       of different format.

OPTIONS
       lavtrans accepts the following options:

       -f [a|q|m|i|w]
            Specifies the output format that should be saved.
              a - output to AVI file
              q - output to Qicktime file
              i - output single JPEG images,
              w - output WAV file (sound only!)

       -i num
            Convert a single frame to a JPEG file.

       -o outputfile
            Specifies the name of the output file If you want as output single JPEG images the output file string must be a valid format string

       filename
            Multiple filenames as input are acceped, also mixing of edit list files and other in video files.

BUGS
       There seem to be problems with the transoding of large Quicktime movies. One other thing is that with interlaced movies only one  field  is
       extracted.  So you get pictures with the full horizontal size and half vertical size.

AUTHOR
       This man page was written by Bernhard Praschinger.
       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:
         mjpeg-users@lists.sourceforge.net

       For more info, see our website at
              http://mjpeg.sourceforge.net

SEE ALSO
       mjpegtools(1), lavplay(1)

MJPEG Tools Team                                                    2 June 2001                                                        lavtrans(1)
