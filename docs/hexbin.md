HEXBIN(1)                                                     General Commands Manual                                                    HEXBIN(1)

NAME
       hexbin - Macintosh file de-binhexer

SYNOPSIS
       hexbin [ - options ] [ files ]

DESCRIPTION
       hexbin takes the text files specified in files (or standard input if none is specified) and converts them subject to the options specified.

OPTIONS
       In  the  absence of any options, hexbin takes the specified files and silently converts them into MacBinary format, giving the output files
       ".bin" extensions and placing them in the current working directory.

       -3     Write files in fork format (.info, .data and .rsrc files.)

       -f     As -3, but empty data and rsrc files are not created.

       -r     Write resource forks only (.rsrc files.)

       -d     Write data forks only (.data files.)

       -u     As -d, but the codes for CR and LF are interchanged, the filename extension is .text.

       -U     As -u, but there is no filename extension.

       -a     Write files in AppleShare format.  This option is only valid if the program is compiled with support for some  form  of  AppleShare.
              The current directory must be a valid AppleShare folder.

       -s     Write extracted files to standard output in MacBinary format.

       -l     List every file extracted (and every directory/folder created etc.)

       -v     Like  -l,  but  more verbose.  When this option is specified all lines skipped because they do not belong to the hexified format are
              listed (implies -l.)

       -i     Do not convert, give information only (implies -l.)

       -c     Do not check whether the hexified lines have equal size.  Normally the hexifiers gives text  files  with  equal  length  line  size,
              hexbin  uses  this in its heuristics to determine whether a line must be skipped.  There are however hexified files that do not con‐
              form to that pattern.  If this option is specified hexbin will in general be unable to detect whether a line is garbage or  not,  so
              you have to remove the garbage by hand.

       -n name
              Gives  the Unix base file name for the converted files.  For files hexified with BinHex 4.0 or compatible hexifiers this flag is not
              needed; hexbin will determine the Unix file name based on the Mac file name.  For files in dl, hex or hcx format this parameter  may
              be needed as these formats do not include the Mac filename.  Normally hexbin will in those cases base the Unix file name on the text
              file name, but that can be overruled with this parameter.

       -V     Gives the patchlevel of the program, and other information.  Other options are ignored and the program quits immediately.

       -H     Give short information about the options.  Other options are ignored and the program quits immediately.

BUGS
       As this is a beta release, there may still be some problems.

SEE ALSO
       macutil(1)

AUTHOR
       Dik T. Winter, CWI, Amsterdam, The Netherlands (dik@cwi.nl)

       Parts of the code are based on codes from: ahm (?), Darin Adler, Jim Budler, Dave Johnson, Dan LaLiberte, Jeff Meyer, Guido van Rossum.

3rd Berkeley Distribution                                        October 22, 1992                                                        HEXBIN(1)
