MKFONTSCALE(1)                                                                          General Commands Manual                                                                         MKFONTSCALE(1)

NAME
       mkfontscale - create an index of scalable font files for X

SYNOPSIS
       mkfontscale [ -b ] [ -s ] [ -o filename ] [ -x suffix ] [ -a encoding ] ... [ -f fuzz ] [ -l ] [ -e directory ] [ -p prefix ] [ -r prefix ] [ -n prefix ] [ -u | -U ] [ -v ] [ -- ] [ directory
       ] ...

DESCRIPTION
       For each directory argument, mkfontscale reads all of the scalable font files in the directory.  For every font file found, an X11 font name (XLFD) is generated, and is written together  with
       the file name to a file fonts.scale in the directory.

       The resulting fonts.scale file should be checked and possibly manually edited before being used as input for the mkfontdir(1) program.

OPTIONS
       -b     read bitmap fonts.  By default, bitmap fonts are ignored.

       -s     ignore scalable fonts.  By default, scalable fonts are read.  If -b is set, this flag has the side effect of enabling the reading of fonts.scale files.

       -o filename
              send  program  output  to filename; default is fonts.scale if bitmap fonts are not being read, and fonts.dir if they are.  If filename is relative, it is created in the directory being
              processed.  If it is the special value -, output is written to standard output.

       -x suffix
              exclude all files with the specified suffix.

       -a encoding
              add encoding to the list of encodings searched for.

       -f fuzz
              set the fraction of characters that may be missing in large encodings to fuzz percent.  Defaults to 2%.

       -l     Write fonts.dir files suitable for implementations that cannot reencode legacy fonts (BDF and PCF).  By default, it is assumed that  the  implementation  can  reencode  Unicode-encoded
              legacy fonts.

       -e     specifies a directory with encoding files.  Every such directory is scanned for encoding files, the list of which is then written to an "encodings.dir" file in every font directory.

       -p     Specifies a prefix that is prepended to the encoding file path names when they are written to the "encodings.dir" file.  The prefix is prepended literally: if a `/' is required between
              the prefix and the path names, it must be supplied explicitly as part of the prefix.

       -r     Keep non-absolute encoding directories in their relative form when writing the "encodings.dir" file.  The default is to convert relative encoding directories to absolute directories by
              prepending the current directory.  The positioning of this options is significant, as this option only applies to subsequent -e options.

       -n     do not scan for fonts, do not write font directory files.  This option is useful when generating encoding directories only.

       -u, -U disable (-u) or enable (-U) indexing of ISO 10646:1 font encodings (default: enabled).

       -v     print program version and exit.

       --     end of options.

SEE ALSO
       X(7), Xserver(1), mkfontdir(1), ttmkfdir(1), xfs(1), xset(1)

NOTES
       The format of the fonts.scale, fonts.dir and encodings.dir files is documented in the mkfontdir(1) manual page.

       Mkfontscale will overwrite any fonts.scale file even if it has been hand-edited.

       mkfontscale -b -s -l is equivalent to mkfontdir.

AUTHOR
       The  version  of  mkfontscale  included in this X.Org Foundation release was originally written by Juliusz Chroboczek <jch@freedesktop.org> for the XFree86 project.  The functionality of this
       program was inspired by the ttmkfdir utility by Joerg Pommnitz.

X Version 11                                                                               mkfontscale 1.1.3                                                                            MKFONTSCALE(1)
