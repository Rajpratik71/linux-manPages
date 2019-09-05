MAPSCRN(8)                                                                               International Support                                                                              MAPSCRN(8)

NAME
       mapscrn - load screen output mapping table

SYNOPSIS
       mapscrn [-V] [-v] [-o map.orig] mapfile

DESCRIPTION
       The mapscrn command is obsolete - its function is now built-in into setfont.  However, for backwards compatibility it is still available as a separate command.

       The  mapscrn  command loads a user defined output character mapping table into the console driver. The console driver may be later put into use user-defined mapping table mode by outputting a
       special escape sequence to the console device.  This sequence is <esc>(K for the G0 character set and <esc>)K for the G1 character set.  When the -o option is given, the old map is  saved  in
       map.orig.

USE
       There  are two kinds of mapping tables: direct-to-font tables, that give a font position for each user byte value, and user-to-unicode tables that give a unicode value for each user byte. The
       corresponding glyph is now found using the unicode index of the font.  The command
              mapscrn trivial
       sets up a one-to-one direct-to-font table where user bytes directly address the font. This is useful for fonts that are in the same order as the character set one uses.  A command like
              mapscrn 8859-2
       sets up a user-to-unicode table that assumes that the user uses ISO 8859-2.

INPUT FORMAT
       The mapscrn command can read the map in either of two formats:
       1. 256 or 512 bytes binary data
       2. two-column text file
       Format (1) is a direct image of the translation table. The 256-bytes tables are direct-to-font, the 512-bytes tables are user-to-unicode tables.  Format (2) is used to fill the table as  fol‐
       lows:  cell with offset mentioned in the first column is filled with the value mentioned in the second column.  When values larger than 255 occur, or values are written using the U+xxxx nota‐
       tion, the table is assumed to be a user-to-unicode table, otherwise it is a direct-to-font table.

       Values in the file may be specified in one of several formats:
       1. Decimal: String of decimal digits not starting with '0'
       2. Octal: String of octal digits beginning with '0'.
       3. Hexadecimal: String of hexadecimal digits preceded by "0x".
       4. Unicode: String of four hexadecimal digits preceded by "U+".
       5. Character: Single character enclosed in single quotes. (And the binary value is used.)  Note that blank, comma, tab character and '#' cannot be specified with this format.
       6. UTF-8 Character: Single (possibly multi-byte) UTF-8 character, enclosed in single quotes.

       Note that control characters (with codes < 32) cannot be re-mapped with mapscrn because they have special meaning for the driver.

OTHER OPTIONS
       -V     Prints version number and exits.

       -v     Be verbose.

FILES
       /usr/share/consoletrans is the default directory for screen mappings.

SEE ALSO
       setfont(8)

AUTHOR
       Copyright (C) 1993 Eugene G. Crosser
       <crosser@pccross.msk.su>
       This software and documentation may be distributed freely.

Local                                                                                        20 March 1993                                                                                  MAPSCRN(8)
