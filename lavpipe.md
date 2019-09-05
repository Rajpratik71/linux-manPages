lavpipe(1)                                                      MJPEG tools manual                                                      lavpipe(1)

NAME
       lavpipe - creates raw YUV streams from pipe list scripts

SYNOPSIS
       lavpipe [-o num] [-n num] pipe-list

DESCRIPTION
       lavpipe  reads  a  script  file called 'pipe list' that is of a similar structure as the edit lists that can be fed into lav2yuv.  For info
       about the pipe list format see below.

       The pipe list defines several video sources and filters that are combined by lavpipe to produce a single output YUV stream on stdout (which
       for example can be compressed and stored to disk via mpeg2enc(1) or yuv2lav(1)).

OPTIONS
       The command line options are used to output a specific part of the resulting video stream.  That means you can tell lavpipe how many frames
       to skip and how many frames to deliver from that point on.

       -o num This is the frame offset of the output video. The first num frames of the resulting video simply are neither calculated nor  written
              to stdout. This value defaults to 0.

       -n num This  is  the  frame  count.  If  the  input files or streams defined in the pipe list script are long enough, the output will be of
              exactly num frames length. A value of 0 means that all frames until the last one as defined in the pipe list will be written out, as
              long as there's some input (0 is the default).

       pipe-list
              This is name of the pipe list file that lavpipe will 'execute'.  For information about this file's format see below.

       -?     Display a synopsis of the command syntax.

EXAMPLES
       lavpipe -o 100 -n 25 film.pli
              would calculate and output to stdout frames 100 to 124 as defined in film.pli (in PAL this would be the 5th second of the film).

       lavpipe input.pli | yuv2lav -q80 output.avi
              would save the movie assembled by lavpipe as a single AVI file.

USAGE
       In  this section the format of lavpipe's input files the pipe list scripts is explained. If you need some examples or a more detailed tuto‐
       rial, please read the mjpegtools(1) manpage's section about CREATING MOVIE TRANSITIONS. and the file README.lavpipe that should be included
       in the distribution.  Also feel free to contact us via the mailing list (see below).

       A  pipe  list contains of two parts: the YUV source list and after this, as many sequence descriptions as wanted. It always begins with the
       following two lines:

       LAV Pipe List
              This is the first line in every pipe list script. It is used as a simple test if lavpipe really was given a pipe list script and not
              your PhD thesis as input.

       NTSC|PAL
              This is the second line in every pipe list and can be either PAL or NTSC, depending on what video standard you use. I don't remember
              if this is used at the moment.

       Now follows the source list:

       num    This is the number of input commands. lavpipe will read the next num lines and interpret them as input stream commands.

       command (num times)
              This is a valid command line with two variables $o and $n that will be replaced by lavpipe with the offset and number of frames that
              the program has to output. Example:
              lav2yuv -o $o -f $n input.avi

       Thus, an example source list could look like this:
       2
       lav2yuv -o $o -f $n scene1.avi
       lav2yuv -o $o -f $n scene2.avi

       after this you can append as many sequence descriptions as needed. Each of them is built up as follows:

       num    The number of frames that this sequence will last.

       num    The  number  of inputs that will be used in this sequence.  This number must of course be less than or equal to the number of inputs
              that are defined above.

       idx [ofs] (num times)
              These are the indices to the sources that are defined at the beginning of the file (first source is 0) with an optional frame offset
              (i.e. sequence starts with frame number ofs of this input.) - this value defaults to 0. Example:
              0 150

       command
              This  is  a valid command line to a YUV filter tool that reads num input streams and writes one output stream, combining its inputs.
              Optionally, the filter tool can be given the two $o and $n variables that will be replaced by lavpipe as in the source commands (see
              above).  For  further  info read README.lavpipe or the documentation for the filter programs (if available). An example filter could
              look like this:
              transist.flt -o 0 -O 255 -s $o -n $n -d 50
              And if the sequence only has one input that simply should be copied to the output, you can use a dash instead of a command line:
              -

       And here's an example for a complete pipe list that implements a transistion from scene1.avi to scene2.avi

       REMOVE THE COMMENTS AFTER The #

       LAV Pipe List
       PAL
       2
       lav2yuv -o $o -f $n scene1.avi
       lav2yuv -o $o -f $n scene2.avi
       50            # first sequence: 50 frames
       1             #   contains one input:
       0 0           #     scene1.avi, offset 0
       -             #   simple output
       25            # second sequence: 25 frames
       2             #   contains two inputs:
       0 50          #     scene1.avi, offset 50
       1             #     scene2.avi, offset 0
       transist.flt -o 0 -O 255 -s $o -n $n -d 50 # transistion
       50            # third sequence: 50 frames
       1             #   contains one input:
       1 25          #     scene2.avi, offset 25
       -             #   simple output

BUGS
       I'm sure there are enough of them. lavpipe often accepts malformed pipe lists and then writes out a video that was all but intended - with‐
       out warning.

       The mention of $n above is wrong. At one time there were two parameters but now a program is allowed to produce as many frames as it wants.
       THe author of the program hard coded, for reasons unknown, $n to be 0.

NOTES
       There are also some serious limitations in the system, such as frame-by-frame processing. But as the goal when writing lavpipe was the sim‐
       plicity of the pipeline, other tools will have to be written to do more interesting tasks.
       But  I want to note that it is very well possible to write a pipe list that combines several files, and then use that pipe list as an input
       for another pipe list by simply using the lavpipe command in the source list (see above) - this can be already used to do some nice things,
       if you have some nice filters.

       Comments are NOT allowed in pipelist files. The comments (text after #) above are for illustration only.

AUTHOR
       This man page was written by Philipp Zabel.
       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:
         mjpeg-users@lists.sourceforge.net

       For more info, see our website at
              http://mjpeg.sourceforge.net

SEE ALSO
       lav2yuv(1), lavplay(1), lavrec(1), mpeg2enc(1), yuv2lav(1), yuvscaler(1)

MJPEG Tools Team                                                    2 June 2001                                                         lavpipe(1)
