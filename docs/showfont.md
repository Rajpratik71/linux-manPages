SHOWFONT(1)                                                   General Commands Manual                                                  SHOWFONT(1)

NAME
       showfont - font dumper for X font server

SYNOPSIS
       showfont [ -options ... ] -fn pattern

DESCRIPTION
       Showfont  displays  data  about  a  font that matches the given pattern.  The information shown includes font information, font properties,
       character metrics, and character bitmaps.

       The wildcard character "*" can be used to match any sequence of characters (including none) in the font name, and "?" can be used to  match
       any single character.  The "*" and "?" characters must be quoted to prevent them from being expanded by the shell.  If no pattern is given,
       "*" is assumed.

OPTIONS
       -server servername
               The X font server to contact.  servername must be specified in one of the formats defined in the Font Server Names section of X(7).
               If not specified, the server name in the FONTSERVER environment variable is used.

       -fn name
               The font to display.

       -lsb    The bit order of the font should be requested as LSBFirst (least significant bit first).

       -msb    The bit order of the font should be requested as MSBFirst (most significant bit first).

       -LSB    The byte order of the font should be requested as LSBFirst (least significant byte first).

       -MSB    The byte order of the font should be requested as MSBFirst (most significant byte first).

       -ext[ents_only]
               Only the character extents should be displayed, but not the bitmaps.

       -start char
               The start of the range of the characters to display (char is a number).

       -end char
               The end of the range of the characters to display (char is a number).

       -unit n The scanline unit of the font (8, 16, 32, or 64).

       -pad n  The scanpad unit of the font (8, 16, 32, or 64).

       -b[itmap_pad] n
               The bitmap padding unit of the font (0, 1, or 2, where 0 is ImageRectMin, 1 is ImageRectMaxWidth and 2 is ImageRectMax).

       -noprops
               Do not show the font properties.

       -version
               Print the program version and exit.

SEE ALSO
       xfs(1), fslsfonts(1), fstobdf(1), xlsfonts(1), X(7).

ENVIRONMENT
       FONTSERVER
               the  default  X  font  server to contact.  The server name must be specified in one of the formats defined in the Font Server Names
               section of X(7).

COPYRIGHT
       Copyright 1991, Network Computing Devices, Inc.
       See X(7) for a full statement of rights and permissions.

AUTHOR
       Dave Lemke, Network Computing Devices, Inc.

X Version 11                                                      showfont 1.0.5                                                       SHOWFONT(1)
