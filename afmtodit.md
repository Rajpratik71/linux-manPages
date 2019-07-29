AFMTODIT(1)                                                   General Commands Manual                                                  AFMTODIT(1)

NAME
       afmtodit - create font files for use with groff -Tps and -Tpdf

SYNOPSIS
       afmtodit [ -ckmnsvx ] [ -a n ] [ -d desc_file ] [ -e enc_file ] [ -f internal_name ] [ -i n ] [ -o out_file ] afm_file map_file font

       The whitespace between a command line option and its argument is optional.

DESCRIPTION
       afmtodit creates a font file for use with groff, grops, and gropdf.  afmtodit is written in perl; you must have perl version 5.004 or newer
       installed in order to run afmtodit.

       afm_file is the AFM (Adobe Font Metric) file for the font.

       map_file is a file that says which groff character names map onto each PostScript character name; this file should contain  a  sequence  of
       lines of the form

              ps_char groff_char

       where  ps_char  is the PostScript name of the character and groff_char is the groff name of the character (as used in the groff font file).
       The same ps_char can occur multiple times in the file; each groff_char must occur at most once.  Lines starting with # and blank lines  are
       ignored.   If the file isn't found in the current directory, it is searched in the ‘devps/generate’ subdirectory of the default font direc‐
       tory.

       If a PostScript character is not mentioned in map_file, and a generic groff glyph name can't be deduced using the Adobe  Glyph  List  (AGL,
       built  into  afmtodit),  then  afmtodit  puts  the  PostScript character into the groff font file as an unnamed character which can only be
       accessed by the \N escape sequence in troff.  In particular, this is true for glyph variants like ‘foo.bar’; all glyph names containing one
       or  more  periods  are mapped to unnamed entities.  If option -e is not specified, the encoding defined in the AFM file (i.e., entries with
       non-negative character codes) is used.  Please refer to section ‘Using Symbols’ in the groff info file  which  describes  how  groff  glyph
       names are constructed.

       Characters  not  encoded  in  the AFM file (i.e., entries which have -1 as the character code) are still available in groff; they get glyph
       index values greater than 255 (or greater than the biggest character code used in the AFM file in the unlikely case that it is greater than
       255) in the groff font file.  Glyph indices of unencoded characters don't have a specific order; it is best to access them with glyph names
       only.

       The groff font file will be output to a file called font, unless the -o option is used.

       If there is a downloadable font file for the font, it may be listed in the file /usr/share/groff/1.22.3/font/devps/download; see grops(1).

       If the -i option is used, afmtodit will automatically generate an italic correction, a left italic correction and  a  subscript  correction
       for  each  character (the significance of these parameters is explained in groff_font(5)); these parameters may be specified for individual
       characters by adding to the afm_file lines of the form:

              italicCorrection ps_char n
              leftItalicCorrection ps_char n
              subscriptCorrection ps_char n

       where ps_char is the PostScript name of the character, and n is the desired value of the corresponding parameter in thousandths of  an  em.
       These parameters are normally needed only for italic (or oblique) fonts.

OPTIONS
       -an    Use  n  as  the slant parameter in the font file; this is used by groff in the positioning of accents.  By default afmtodit uses the
              negative of the ItalicAngle specified in the afm file; with true italic fonts it is sometimes desirable to use a slant that is  less
              than  this.   If  you  find  that characters from an italic font have accents placed too far to the right over them, then use the -a
              option to give the font a smaller slant.

       -c     Include comments in the font file in order to identify the PS font.

       -ddesc_file
              The device description file is desc_file rather than the default DESC.  If not found in the current directory, the ‘devps  subdirec‐
              tory  of  the  default  font  directory is searched (this is true for both the default device description file and a file given with
              option -d).

       -eenc_file
              The PostScript font should be reencoded to use the encoding described in enc_file.  The format of enc_file is described in grops(1).
              If not found in the current directory, the ‘devps’ subdirectory of the default font directory is searched.

       -fname The internal name of the groff font is set to name.

       -in    Generate  an italic correction for each character so that the character's width plus the character's italic correction is equal to n
              thousandths of an em plus the amount by which the right edge of the character's bounding box is to the right of the character's ori‐
              gin.  If this would result in a negative italic correction, use a zero italic correction instead.

              Also generate a subscript correction equal to the product of the tangent of the slant of the font and four fifths of the x-height of
              the font.  If this would result in a subscript correction greater than the italic correction, use a subscript  correction  equal  to
              the italic correction instead.

              Also  generate a left italic correction for each character equal to n thousandths of an em plus the amount by which the left edge of
              the character's bounding box is to the left of the character's origin.  The left italic correction may be negative unless option  -m
              is given.

              This  option  is  normally  needed only with italic (or oblique) fonts.  The font files distributed with groff were created using an
              option of -i50 for italic fonts.

       -oout_file
              The output file is out_file instead of font.

       -k     Omit any kerning data from the groff font.  This should be used only for mono-spaced fonts.

       -m     Prevent negative left italic correction values.  Roman font files distributed with groff were created with -i0 -m to improve spacing
              with eqn(1).

       -n     Don't output a ligatures command for this font.  Use this with constant-width fonts.

       -s     The font is special.  The effect of this option is to add the special command to the font file.

       -v     Print version.

       -x     Don't use the built-in Adobe Glyph List.

FILES
       /usr/share/groff/1.22.3/font/devps/DESC      Device description file.

       /usr/share/groff/1.22.3/font/devps/F         Font description file for font F.

       /usr/share/groff/1.22.3/font/devps/download  List of downloadable fonts.

       /usr/share/groff/1.22.3/font/devps/text.enc  Encoding used for text fonts.

       /usr/share/groff/1.22.3/font/devps/generate/textmap
                                                    Standard mapping.

SEE ALSO
       groff(1), grops(1), groff_font(5), perl(1)

       The groff info file, section ‘Using Symbols’.

COPYING
       Copyright © 1989-2014 Free Software Foundation, Inc.

       Permission  is  granted  to make and distribute verbatim copies of this manual provided the copyright notice and this permission notice are
       preserved on all copies.

       Permission is granted to copy and distribute modified versions of this manual under the conditions for verbatim copying, provided that  the
       entire resulting derived work is distributed under the terms of a permission notice identical to this one.

       Permission  is  granted  to  copy and distribute translations of this manual into another language, under the above conditions for modified
       versions, except that this permission notice may be included in translations approved by the Free Software Foundation  instead  of  in  the
       original English.

Groff Version 1.22.3                                              28 January 2016                                                      AFMTODIT(1)
