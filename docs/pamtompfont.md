Pamtompfont User Manual(0)                                                                                                                                                         Pamtompfont User Manual(0)



NAME
       pamtompfont - Convert Netpbm image to Mplayer bitmap font file


SYNOPSIS
       pamtompfont [imagefile]

       All options can be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one.  You may separate an option name and its value with white space instead of an equals sign.


DESCRIPTION
       This program is part of Netpbm(1)

       pamtompfont reads a Netpbm image (PNM or PAM) and converts it to an Mplayer bitmap font raster file.

       This is the original font format used by Mplayer (for subtitles, on-screen messages, etc.), before it had the ability to use Freetype to access standard fonts.

       The format was apparently an image format before Mplayer adopted it for fonts, but I have no idea where it came from or where else it might be used.

       An  Mplayer  bitmap  font consists of a font descriptor file and raster files.  The font descriptor file identifies the raster files by file name.  A raster file contains a single rectangular raster
       image which contains an arrangement of a bunch of glyphs.  Each glyph is a rectangular image and the font descriptor indicates where in the image the glyph for each codepoint is.  Every glyph in the
       font has the same height, so the font descriptor just indicates the file position in the raster file of the to left corner of the glyph, and the width of the glyph in pixels.



OPTIONS
       None.


SEE ALSO
       pam(5)



HISTORY
       pamtompfont was added to Netpbm in Release 10.43 (June 2008).



netpbm documentation                                                                             18 May 2008                                                                       Pamtompfont User Manual(0)
