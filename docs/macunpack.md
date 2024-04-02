MACUNPACK(1)                                                  General Commands Manual                                                 MACUNPACK(1)

NAME
       macunpack - Macintosh file de-archiver

SYNOPSIS
       macunpack [ - options ] [ file ]

DESCRIPTION
       macunpack  takes  the Macintosh MacBinary archive specified in file (or standard input if none is specified) and extracts the files it con‐
       tains subject to the options specified.  The program will also accept the data fork of the archive for some kinds of  archive  as  standard
       input.

OPTIONS
       In  the  absence of any options, macunpack takes the specified archive and silently extracts the file(s) it contains into MacBinary format,
       giving the output files ".bin" extensions and placing them in the current working directory.  Subdirectories are created for embedded fold‐
       ers.

       -3     Write files in fork format (.info, .data and .rsrc files.)

       -f     As -3, but empty data and rsrc files are not created.

       -r     Write resource forks only (.rsrc files.)

       -d     Write data forks only (.data files.)

       -u     As -d, but the codes for CR and LF are interchanged, the filename extension is .text.

       -U     As -u, but there is no filename extension.

       -a     Write  files  in  AppleShare format.  This option is only valid if the program is compiled with support for some form of AppleShare.
              The current directory must be a valid AppleShare folder.

       -s     Write extracted files to standard output in MacBinary format.

       -l     List every file extracted (and every directory/folder created etc.)

       -v     Like -l, but more verbose (implies -l.)

       -i     Do not extract, give information only (implies -l.)

       -q     Ask the user for every file/folder whether it should be extracted (implies -l.)

       -V     Gives the patchlevel of the program, and other information.  Other options are ignored and the program quits immediately.

       -H     Give short information about the options.  Other options are ignored and the program quits immediately.

BUGS
       As this is a beta release, there may still be some problems.  Archives that are password protected and multi-file archives  are  not  dealt
       with.

SEE ALSO
       macutil(1)

AUTHOR
       Dik T. Winter, CWI, Amsterdam, The Netherlands (dik@cwi.nl)

       Parts  of  the  code  are based on codes from: Steve Davies, Rahul Dhesi, Casper H.S. Dik, Jim McKie, Mark G. Mendel, Haruhiko Okumura, Joe
       Orost, Samuel H. Smith, Yooichi Tagawa, Spencer W. Thomas, Ken Turkowski, Allan G. Weber, James A. Woods and Haruyasu Yoshizaki.

3rd Berkeley Distribution                                        October 22, 1992                                                     MACUNPACK(1)
