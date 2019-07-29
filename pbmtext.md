Pbmtext User Manual(0)                                                                                                                                                                 Pbmtext User Manual(0)



NAME
       pbmtext - render text into a PBM image


SYNOPSIS
       pbmtext [-font fontfile] [-builtin fontname] [-space pixels] [-lspace pixels] [-nomargins] [-width pixels] [text]

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.



DESCRIPTION
       This program is part of Netpbm(1)

       pbmtext takes the specified text, either a single line from the command line or multiple lines from standard input, and renders it into a PBM graphical image.

       In the image, each line of input is a line of output.  Formatting characters such as newline have no effect on the formatting; like any unprintable character, they turn into spaces.

       The image is just wide enough for the longest line of text, plus margins, and just high enough to contain the lines of text, plus margins.

       The left and right margins are twice the width of the widest character in the font; the top and bottom margins are the height of the tallest character in the font.  But if the text is only one line,
       all the margins are half of this.  You can use the -nomargins option to eliminate the margins.

       pbmtextps  does the same thing as pbmtext, but uses Ghostscript to generate the characters, which means you can use Postscript fonts.  But it also means you have to have Ghostscript installed and it
       isn't as fast.  Also, pbmtextps generates only one line of text, whereas pbmtext can create multiple lines.

       pbmtext is meant for small quantities of simple text.  If you're working with a document, you would be better off using a document formatting program to 'print' to a Postscript  file,  then  feeding
       that Postscript to pstopnm.


OPTIONS
       -font

       -builtin
              -builtin selects a font among those built into Netpbm.

              -font selects a font that you supply yourself either as an X Window System BDF (Bitmap Distribution Format) ⟨http://xfree86.org/current/bdf.pdf⟩  file or as a PBM file in a special form.

              The default is the built in font 'bdf.'

              'bdf' is Times-Roman 15 pixels high.  (That's about 14 point type printed at 75 dpi).

              'fixed' is a built in fixed width font.

              For information about other fonts, and how to make one of your own, see Fonts ⟨#fonts⟩  below.



       -space pixels
               Add pixels pixels of space between characters.  This is in addition to whatever space surrounding characters is built into the font, which is usually enough to produce a reasonable string of
              text.

              pixels may be fractional, in which case the number of pixels added varies so as to achieve the specified average.  For example -space=1.5 causes half the spaces to be 1 pixel and half to be 2
              pixels.

              pixels may be negative to crowd text together, but the author has not put much thought or testing into how this works in every possible case, so it might cause disastrous results.


       -lspace pixels
               Add pixels pixels of space between lines.  This is in addition to whatever space above and below characters is built into the font, which is usually enough to produce a reasonable line spac-
              ing.

              pixels must be a whole number.

              pixels may be negative to crowd lines together, but the author has not put much thought or testing into how this works in every possible case, so it might cause disastrous results.


       -nomargins
              By default, pbmtext adds margins all around the image as described above.  This option causes pbmtext not to add any margins.

              Note that there may still be space beyond the edges of the type because a character itself may include space at its edges.  To eliminate all surrounding background, so the  type  touches  all
              four edges of the image, use pnmcrop.


       -width pixels
              This specifies how much horizontal space the text is supposed to fit into.

              If the input is one line, pbmtext breaks it into multiple lines as needed to fit the specified width.  It breaks it between characters, but does not pay attention to white space; it may break
              in the middle of a word and a line may begin or end with white space.

              If the input is multiple lines, pbmtext assumes you already have line breaks where they make sense, and pbmtext simply truncates each line as needed to fit the specified width.





USAGE
       Often, you want to place text over another image.  One way to do this is with ppmlabel.  For more flexible (but complex) drawing of text on an image, there is ppmdraw.  These do  not  give  you  the
       font options that pbmtext does, though.

       Another way is to use pbmtext to create an image containing the text, then use pamcomp to overlay the text image onto your base image.  To make only the text (and not the entire rectangle containing
       it) cover the base image, you will need to give pamcomp a mask, via its -alpha option.  You can just use the text image itself as the mask, as long as you also specify the -invert option to pamcomp.

       If you want to overlay colored text instead of black, just use ppmchange to change all black pixels to the color of your choice before overlaying the text image.  But still use  the  original  black
       and white image for the alpha mask.

       If you want the text at an angle, use pnmrotate on the text image (and alpha mask) before overlaying.


FONTS
       There are three kinds of fonts you an use with pbmtext:



       ·      built in

       ·      BDF

       ·      PBM



   Built In Fonts
       There are two built in fonts: bdf and fixed.  You select these fonts with a -builtin option.

       bdf is the default when you specify no font information on the command line.

       bdf is encoded in ISO 8859-1 (Latin 1, 8-bit).  In addition to English it can handle most West European languages (Spanish, French, German, Swedish ...)  This set lacks the Euro currency sign.

       fixed is ASCII (7-bit) only.



   BDF Font
       BDF  is  an  ancient  font  format  that  at  one  time  was  standard  for  the  X  Window  System.   Now,  you  don't  see  it  very  often,  but  you  can  find  some  BDF  fonts  on  the Xfree86
       ⟨http://cvsweb.xfree86.org/cvsweb/xc/fonts/bdf/⟩  web site.

       You can get the full package of the BDF fonts from XFree86 (see above) from the Netpbm web site ⟨http://netpbm.sourceforge.net/bdffont.tgz⟩ .


   PBM Font
       To create a font as a PBM file (to use with the -font option), you just create a PBM image of the text matrix below.

       The first step is to display text matrix below on the screen, e.g. in an X11 window.


           M ',/^_[`jpqy| M

           /  !'#$%&'()*+ /
           < ,-./01234567 <
           > 89:;<=>?@ABC >
           @ DEFGHIJKLMNO @
           _ PQRSTUVWXYZ[ _
           { \]^_`abcdefg {
           } hijklmnopqrs }
           ~ tuvwxyz{|}~  ~

           M ',/^_[`jpqy| M


       Make sure it's a fixed width font -- This should display as a perfect rectangle.

       Also, try to use a simple display program.  Pbmtext divides this into a matrix of cells, all the same size, each containing one character, so it is important that whatever you use to display it dis-
       play  with  uniform horizontal and vertical spacing.  Fancy word processing programs sometimes stretch characters in both directions to fit certain dimensions, and that won't work.  Sometimes a dis-
       play program scales a font to show a character larger or smaller than its natural size.  That too won't often work because the rounding involved in such scaling causes non-uniform distances  between
       characters.

       If  you display the text matrix improperly, the usual symptom is that when you try to use the font, pbmtext fails with an error message telling you that the number of lines in the font isn't divisi-
       ble by 11, or it can't find the blank band around the inner rectangle.  Sometimes the symptom is that one of the characters displays with a piece of the character that is next to it in  the  matrix.
       For example, 'l' might display with a little piece of the 'm' attached on its right.

       Do  a  screen grab or window dump of that text, using for instance xwd, xgrabsc, or screendump.  Convert the result into a pbm file.  If necessary, use pamcut to remove anything you grabbed in addi-
       tion to the text pictured above (or be a wimp and use a graphical editor such as ImageMagick).  Finally, run it through pnmcrop.  to make sure the edges are right up against the text.   pbmtext  can
       figure out the sizes and spacings from that.



NON-ENGLISH TEXT
       pbmtext does little to accommodate the special needs of non-English text.

       pbmtext reads input in byte units.  Unicode (utf-7, utf-8, utf-16, etc.) text which contains multibyte characters does not work.

       pbmtext  can  handle  7-bit  and  8-bit  character  sets.  Examples are ASCII, ISO 8859 family, koi8-r/u and VISCII.  It is up to the user to supply a BDF file covering the necessary glyphs with the
       "-font" option.  The font file must be in the right encoding.

       pbmtext does not recognize locale.  It ignores the associated environment variables.

       pbmtext cannot render vertically or right to left.



TIPS
       If you get garbled output, check whether the font file encoding corresponds to the input text encoding.  Also make sure that your input is not in utf-* or any other multi-byte format.

       To dump characters in a BDF font file run this command:

           $ awk 'BEGIN { for (i=0x01; i<=0xFF; i++)
                           { printf('%c%s',i,i%16==15 ? '\n':''); } }' |\
             pbmtext -f font.bdf > dump.pbm

       If you need only ASCII, change the for statement to:

            for (i=0x20; i<=0x7E; i++)

       To check the encoding of a BDF file, examine the CHARSET_REGISTRY line and the next line, which should be CHARSET_ENCODING:

           $ grep -A1 CHARSET_REGISTRY font-a.bdf
           CHARSET_REGISTRY 'ISO8859'
           CHARSET_ENCODING '1'

           $ grep -A1 CHARSET_REGISTRY font-b.bdf
           CHARSET_REGISTRY 'ISO10646'
           CHARSET_ENCODING '1'

       The latter is Unicode.  BDF files coded in ISO 16046-1 usually work for Western European languages, because ISO 16046-1 expands ISO 8859-1 (also called 'Latin-1') while  maintaining  the  first  256
       code points.  ISO 8859-1 itself is a superset of ASCII.  Run the above command and verify the necessary glyphs are present.

       It may sound strange that pbmtext accepts font files encoded in Unicode but not input text in Unicode.  This is because Unicode provides several 'numbering schemes'.

       When rendering text in character sets other than ISO 8859-1, one often has to produce a BDF file in the given encoding from a master BDF file encoded in ISO 10646-1.

       In particular, 75% of the BDF files in the font collection available from the Netpbm website ⟨http://netpbm.sourceforge.net/bdffont.tgz⟩  are in ISO 10646-1.  Many have the Euro sign, Greek letters,
       etc, but they are placed in code points beyond what pbmtext sees.

       There are several programs that perform BDF encoding conversion.  If you have the X Window System installed, first look for ucs2any.  If you don't, you can download ucs2any.pl from  Unicodefontsand-
       tools for X11 (1)

       Another converter is trbdf, included in the 'trscripts' package, available in some GNU/Linux distributions.

       BDF files encoded in ISO 8859-2, ISO 8859-7, koi8-r, etc. are available from ISO8859Alphabet Soup (1)
        and its sister page TheCyrillicCharset Soup (1) of 8-bit character sets.

       To convert OTF or TTF font files to BDF, use
        otf2bdf by Mike Leisher ⟨http://www.math.nmsu.edu/~mleisher/Software/otf2bdf⟩ .



SEE ALSO
       pbmtextps(1) , pamcut(1) , pnmcrop(1) , pamcomp(1) , ppmchange(1) , pnmrotate(1) , ppmlabel(1) , ppmdraw(1) , pstopnm(1) , pbm(5) , Pango ⟨http://www.pango.org⟩ , Cairo ⟨http://cairographics.org⟩


AUTHOR
       Copyright (C) 1993 by Jef Poskanzer and George Phillips



netpbm documentation                                                                             14 June 2010                                                                          Pbmtext User Manual(0)
