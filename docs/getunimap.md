GETUNIMAP(8)                                                                                        Linux                                                                                        GETUNIMAP(8)



NAME
       getunimap - dump the unicode map for the current console to stdout


SYNOPSIS
       getunimap [ -s ] [ -C console ]


DESCRIPTION
       The getunimap program is old and obsolete. It is now part of setfont (1).

       The getunimap program outputs the unicode map (also called a "Screen Font Map") for the current console to standard output.

       The -C option may be used with Linux 2.6.1 and later to get the map for a console different from the current one. Its argument is a pathname.

       The output of getunimap is of the form

                   0xAA U+1234 # comment

       where 0xAA is the font character code and U+1234 is a unicode character, that if displayed, will be displayed using glyph 0xAA in the font.  Many unicode characters may be mapped to the same glyph.
       the Hash symbol # is used as a comment delimiter; characters after a hash sign (to the end of the line) are comments.

       The -s option will sort and merge elements, sorting on font character.  Hence, it will produce output of the form:

                   0x22 U+1234 U+5678 U+3456
                   0x23 U+0023

            etc., listing the multiple unicode characters that map to a font glyph.

       The output of getunimap is of the form accepted by setfont and psfaddtable

SEE ALSO
       psfaddtable(1), setfont(1).



Console Tools                                                                                     2004-01-01                                                                                     GETUNIMAP(8)
