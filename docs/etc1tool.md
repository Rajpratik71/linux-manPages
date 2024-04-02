ETC1TOOL(1)                                                                               ETC1TOOL(1)

NAME
       etc1tool - ETC1 conversion tool

SYNOPSIS
       etc1tool  infile [--help | --encode | --encodeNoHeader | --decode] [--showDifference difffile]
       [-o outfile]

DESCRIPTION
       etc1tool is a command line utility that lets you encode PNG images  to  the  ETC1  compression
       standard and decode ETC1 compressed images back to PNG.

       Default is --encode

OPTIONS
       infile The input file to compress.

       --help Print this usage information.

       --encode
              Create an ETC1 file from a PNG file.

       --encodeNoHeader
              Create a raw ETC1 data file (without a header) from a PNG file.

       --decode
              Create a PNG file from an ETC1 file.

       --showDifference difffile
              Write  difference between original and encoded image to difffile.  (Only valid when en‐
              coding).

       -o outfile
              Specify the name of the output file.  If outfile is not specified, the output  file  is
              constructed from the input filename with the appropriate suffix (.pkm or .png).

SEE ALSO
       https://developer.android.com/tools/help/etc1tool.html

AUTHORS
       The Android Open Source Project.

                                                                                          ETC1TOOL(1)
