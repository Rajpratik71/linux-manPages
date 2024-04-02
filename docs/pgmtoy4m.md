pgmtoy4m(1)                                                     MJPEG tools manual                                                     pgmtoy4m(1)

NAME
       pgmtoy4m - Convert mpeg2dec pgm and pgmpipe output to YUV4MPEG2

SYNOPSIS
       pgmtoy4m [options]

DESCRIPTION
       pgmtoy4m  repacks the PGM output from mpeg2dec into YUV4MPEG2 4:2:0p.    No actual changes to the data are made.  The data is unpacked from
       the quasi-PGM format and placed in YUV4MPEG2 format with the specified sample aspect, frame rate and field order.  Output must be either to
       a pipe or a file, leaving stdout as a terminal will elicit an error and the program will exit.

OPTIONS
       pgmtoy4m accepts the following options:

       -v num
            Set verbosity level.  (default: 0)

       -h   Print a usage summary and exit.

       -i t|b|p
            Set the interlacing mode.  Top field first (t), bottom field first (b) or progressive/none (p).  (default: t)

       -a sar
            Set the sample aspect ratio.  (default: 10:11)

       -r frame rate
            Set the frame rate.  (default: 30000:1001)

EXAMPLES
       mpeg2dec -s -o pgmpipe file.mpg | pgmtoy4m -a 10:11 -r 24000:1001 -i b | yuvplay

       mpeg2dec -s -o pgm file.mpg
       cat *.pgm | pgmtoy4m -r 30000:1001 -i t | yuvplay

NOTES
       This program is specifically designed to work with the output of mpeg2dec and is NOT a general PGM (NetPBM) tool!

       From the introduction in the source file:

        * Note: mpeg2dec uses a variation of the PGM format - they're really not
        * "Grey Maps" but rather a catenation of the 420P data (commonly called
        * "YUV").    The type is P5 ("raw") and the number of rows is really
        * the total of the Y', Cb and Cr heights.   The Cb and Cr data is "joined"
        * together.  After the Y' rows you have 1 row of Cb and 1 row of Cr per
        * "row" of PGM data.

        * NOTE: You MAY need to know the field order (top/bottom field first),
        *      sample aspect ratio and frame rate because the PGM format makes
        *      none of that information available!

AUTHOR
       This manpage was written by Steven Schultz (sms at 2bsd dot com).

BUGS
       Possible but none known at the present time.

y4mutils                                                         16 December 2003                                                      pgmtoy4m(1)
