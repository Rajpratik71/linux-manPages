MACSAVE(1)                                                    General Commands Manual                                                   MACSAVE(1)

NAME
       macsave - Save Mac files read from standard input

SYNOPSIS
       macsave [ - options ]

DESCRIPTION
       macsave  reads  a  sequence of Macintosh MacBinary files from standard input and writes the files it contains subject to the options speci‐
       fied.

OPTIONS
       In the absence of any options, macsave reads standard input and silently writes the file(s) it contains in  MacBinary  format,  giving  the
       output files ".bin" extensions and placing them in the current working directory.  Subdirectories are created for embedded folders.

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

       -i     Do not extract, give information only (implies -l.)

       -q     Ask the user for every file/folder whether it should be extracted (implies -l.)

       -V     Gives the patchlevel of the program, and other information.  Other options are ignored and the program quits immediately.

       -H     Give short information about the options.  Other options are ignored and the program quits immediately.

BUGS
       As this is a beta release, there may still be some problems.

SEE ALSO
       macutil(1)

AUTHOR
       Dik T. Winter, CWI, Amsterdam, The Netherlands (dik@cwi.nl)

3rd Berkeley Distribution                                        October 22, 1992                                                       MACSAVE(1)
