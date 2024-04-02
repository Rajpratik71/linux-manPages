MKFONTDIR(1)                                                                            General Commands Manual                                                                           MKFONTDIR(1)

NAME
       mkfontdir - create an index of X font files in a directory

SYNOPSIS
       mkfontdir [-n] [-x suffix] [-r] [-p prefix] [-e encoding-directory-name] ...  [--] [directory-name ... ]

DESCRIPTION
       For  each  directory  argument,  mkfontdir  reads  all of the font files in the directory searching for properties named "FONT", or (failing that) the name of the file stripped of its suffix.
       These are converted to lower case and used as font names, and, along with the name of the font file, are written out to the file "fonts.dir" in the directory.  The X server  and  font  server
       use "fonts.dir" to find font files.

       The kinds of font files read by mkfontdir depend on configuration parameters, but typically include PCF (suffix ".pcf"), SNF (suffix ".snf") and BDF (suffix ".bdf").  If a font exists in mul‐
       tiple formats, mkfontdir will first choose PCF, then SNF and finally BDF.

       The first line of fonts.dir gives the number of fonts in the file.  The remaining lines list the fonts themselves, one per line, in two fields.  First is the name of the font  file,  followed
       by a space and the name of the font.

SCALABLE FONTS
       Because  scalable  font  files  do  not  usually include the X font name, the file "fonts.scale" can be used to name the scalable fonts in the directory.  The fonts listed in it are copied to
       fonts.dir by mkfontdir.  "fonts.scale" has the same format as the "fonts.dir" file, and can be created with the mkfontscale(1) program.

FONT NAME ALIASES
       The file "fonts.alias", which can be put in any directory of the font-path, is used to map new names to existing fonts, and should be edited by hand.  The format is two white-space  separated
       columns, the first containing aliases and the second containing font-name patterns.  Lines beginning with "!" are comment lines and are ignored.

       If  neither  the  alias nor the value specifies the size fields of the font name, this is a scalable alias.  A font name of any size that matches this alias will be mapped to the same size of
       the font that the alias resolves to.

       When a font alias is used, the name it references is searched for in the normal manner, looking through each font directory in turn.  This means that the aliases need not mention fonts in the
       same directory as the alias file.

       To embed white space in either name, simply enclose it in double-quote marks; to embed double-quote marks (or any other character), precede them with back-slash:

       "magic-alias with spaces"     "\"font name\" with quotes"
       regular-alias            fixed

       If the string "FILE_NAMES_ALIASES" stands alone on a line, each file-name in the directory (stripped of its suffix) will be used as an alias for that font.

ENCODING FILES
       The  option  -e  can  be  used to specify a directory with encoding files.  Every such directory is scanned for encoding files, the list of which is then written to an "encodings.dir" file in
       every font directory.  The "encodings.dir" file is used by the server to find encoding information.

       The "encodings.dir" file has the same format as "fonts.dir".  It maps encoding names (strings of the form CHARSET_REGISTRY-CHARSET_ENCODING ) to encoding file names.

OPTIONS
       The following options are supported:

       -e     Specify a directory containing encoding files.  The -e option may be specified multiple times, and all the specified directories will be read.  The order of the entries is significant,
              as encodings found in earlier directories override those in later ones; encoding files in the same directory are discriminated by preferring compressed versions.

       -n     do not scan for fonts, do not write font directory files.  This option is useful when generating encoding directories only.

       -p     Specify  a prefix that is prepended to the encoding file path names when they are written to the "encodings.dir" file.  The prefix is prepended as-is.  If a `/' is required between the
              prefix and the path names, it must be supplied explicitly as part of the prefix.

       -r     Keep non-absolute encoding directories in their relative form when writing the "encodings.dir" file.  The default is to convert relative encoding directories to absolute directories by
              prepending the current directory.  The positioning of this options is significant, as this option only applies to subsequent -e options.

       -x suffix
              Ignore fonts files of type suffix.

       --     End options.

FILES
       fonts.dir      List of fonts in the directory and the files they are stored in.  Created by mkfontdir.  Read by the X server and font server each time the font path is set (see xset(1)).

       fonts.scale    List of scalable fonts in the directory.  Contents are copied to fonts.dir by mkfontdir.   Can be created with mkfontscale(1).

       fonts.alias    List of font name aliases.  Read by the X server and font server each time the font path is set (see xset(1)).

       encodings.dir  List of known encodings and the files they are stored in.  Created by mkfontdir.  Read by the X server and font server each time a font with an unknown charset is opened.

SEE ALSO
       X(7), Xserver(1), mkfontscale(1), xfs(1), xset(1)

X Version 11                                                                                mkfontdir 1.0.7                                                                               MKFONTDIR(1)
