FONTTOSFNT(1)                                                                           General Commands Manual                                                                          FONTTOSFNT(1)

NAME
       fonttosfnt - Wrap a bitmap font in a sfnt (TrueType) wrapper

SYNOPSIS
       fonttosfnt [ options ] -o file.ttf [ -- ] font...

DESCRIPTION
       Wrap a bitmap font or a set of bitmap fonts in a sfnt (TrueType or OpenType) wrapper.

OPTIONS
       -v     Be verbose.

       -c     Do not crop glyphs.  This usually increases file size, but may sometimes yield a modest decrease in file size for small character cell fonts (terminal fonts).

       -b     Write byte-aligned glyph data.  By default, unaligned data is written, which yields a smaller file size.

       -r     Do not reencode fonts.  By default, fonts are reencoded to Unicode whenever possible.

       -g n   Set  the  type  of scalable glyphs that we write.  If n is 0, no scalable glyphs are written; this is legal but confuses most current software.  If n is 1, a single scalable glyph (the
              undefined glyph) is written; this is recommended, but triggers a bug in current versions of FreeType.  If n is 2 (the default), a sufficiently high number of blank glyphs are  written,
              which works with FreeType but increases file size.

       -m n   Set the type of scalable metrics that we write.  If n is 0, no scalable metrics are written, which may or may not be legal.  If n is 1, full metrics for a single glyph are written, and
              only left sidebearing values are written for the other glyphs.  If n is 2, scalable metrics for all glyphs are written, which increases file size and is not recommended.   The  default
              is 1.

       --     End of options.

BUGS
       Some of the font-level values, notably sub- and superscript positions, are dummy values.

SEE ALSO
       X(7), Xserver(1), Xft(3x).  Fonts in X11.

AUTHOR
       The version of Fonttosfnt included in this X.Org Foundation release was originally written by Juliusz Chroboczek <jch@freedesktop.org> for the XFree86 project.

X Version 11                                                                               fonttosfnt 1.0.4                                                                              FONTTOSFNT(1)
