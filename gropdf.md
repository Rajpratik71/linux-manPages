GROPDF(1)                                                     General Commands Manual                                                    GROPDF(1)

NAME
       gropdf - PDF driver for groff

SYNOPSIS
       gropdf [-delvs] [-F dir] [-p papersize] [-y foundry] [-u [cmapfile]] [files ...]

       It is possible to have whitespace between a command line option and its parameter.

DESCRIPTION
       gropdf translates the output of GNU troff to PDF.  Normally gropdf should be invoked by using the groff command with a -Tpdf option.  If no
       files are given, gropdf reads the standard input.  A filename of - also causes gropdf to read the standard input.  PDF output is written to
       the standard output.  When gropdf is run by groff options can be passed to gropdf using groff's -P option.

       See section FONT INSTALLATION below for a guide how to install fonts for gropdf.

OPTIONS
       -d     Include debug information as comments within the PDF.  Also produces an uncompressed PDF.

       -e     Force all fonts to be embedded in the PDF.

       -Fdir  Prepend  directory  dir/devname  to  the search path for font, and device description files; name is the name of the device, usually
              pdf.

       -l     Print the document in landscape format.

       -ppaper-size
              Set physical dimension of output medium.  This overrides the papersize, paperlength, and paperwidth commands in the  DESC  file;  it
              accepts the same arguments as the papersize command.  See groff_font (5) for details.

       -v     Print the version number.

       -yfoundry
              Set the foundry to use for selecting fonts of the same name.

       -e     Forces gropdf to embed ALL fonts (even the 14 base PDF fonts).

       -s     Append a comment line to end of PDF showing statistics, i.e. number of pages in document.  Ghostscript's ps2pdf complains about this
              line if it is included, but works anyway.

       -u
       -ucmapfilename
              Gropdf normally includes a ToUnicode CMap with any font created using text.enc as the encoding file, this makes it easier to  search
              for  words  which  contain ligatures.  You can include your own CMap by specifying a cmapfilename or have no CMap at all by omitting
              the argument.

USAGE
       The input to gropdf must be in the format output by troff(1).  This is described in groff_out(5).

       In addition, the device and font description files for the device used must meet certain requirements: The resolution must  be  an  integer
       multiple of 72 times the sizescale.  The pdf device uses a resolution of 72000 and a sizescale of 1000.

       The  device  description  file  must contain a valid paper size; see groff_font(5) for more information.  gropdf uses the same Type 1 Adobe
       postscript fonts as the grops device driver.  Although the PDF Standard allows the use of other font types (like TrueType) this implementa‐
       tion  only  accepts the Type 1 postscript font.  Fewer Type 1 fonts are supported natively in PDF documents than the standard 35 fonts sup‐
       ported by grops and all postscript printers, but all the fonts are available since any which aren't supported  natively  are  automatically
       embedded in the PDF.

       gropdf  supports  the  concept of foundries, that is different versions of basically the same font.  During install a Foundry file controls
       where fonts are found and builds groff fonts from the files it discovers on your system.

       Each font description file must contain a command

              internalname psname

       which says that the PostScript name of the font is psname.  Lines starting with # and blank lines are ignored.  The code for each character
       given in the font file must correspond to the code in the default encoding for the font.  This code can be used with the \N escape sequence
       in troff to select the character, even if the character does not have a groff name.  Every character in the font file  must  exist  in  the
       PostScript font, and the widths given in the font file must match the widths used in the PostScript font.

       Note that gropdf is currently only able to display the first 256 glyphs in any font.  This restriction will be lifted in a later version.

       gropdf can automatically include the downloadable fonts necessary to print the document.  Fonts may be in PFA or PFB format.

       Any    downloadable    fonts    which    should,    when    required,    be   included   by   gropdf   must   be   listed   in   the   file
       /usr/share/groff/1.22.3/font/devpdf/download; this should consist of lines of the form

              foundry font filename

       where foundry is the foundry name or blank for the default foundry.  font is the PostScript name of the font, and filename is the  name  of
       the  file  containing  the  font;  lines  beginning  with  #  and blank lines are ignored; fields must be separated by tabs (spaces are not
       allowed); filename is searched for using the same mechanism that is used for groff font metric files.  The download  file  itself  is  also
       searched for using this mechanism; currently, only the first found file in the font path is used.  Foundry names are usually a single char‐
       acter (such as ‘U’ for the URW Foundry) or blank for the default foundry.  This default uses the same fonts as  ghostscript  uses  when  it
       embeds fonts in a PDF file.

       In  the default setup there are styles called R, I, B, and BI mounted at font positions 1 to 4.  The fonts are grouped into families A, BM,
       C, H, HN, N, P, and T having members in each of these styles:

              AR     AvantGarde-Book
              AI     AvantGarde-BookOblique
              AB     AvantGarde-Demi
              ABI    AvantGarde-DemiOblique
              BMR    Bookman-Light
              BMI    Bookman-LightItalic
              BMB    Bookman-Demi
              BMBI   Bookman-DemiItalic
              CR     Courier
              CI     Courier-Oblique
              CB     Courier-Bold
              CBI    Courier-BoldOblique
              HR     Helvetica
              HI     Helvetica-Oblique
              HB     Helvetica-Bold
              HBI    Helvetica-BoldOblique
              HNR    Helvetica-Narrow
              HNI    Helvetica-Narrow-Oblique
              HNB    Helvetica-Narrow-Bold
              HNBI   Helvetica-Narrow-BoldOblique
              NR     NewCenturySchlbk-Roman
              NI     NewCenturySchlbk-Italic
              NB     NewCenturySchlbk-Bold
              NBI    NewCenturySchlbk-BoldItalic
              PR     Palatino-Roman
              PI     Palatino-Italic
              PB     Palatino-Bold
              PBI    Palatino-BoldItalic
              TR     Times-Roman
              TI     Times-Italic
              TB     Times-Bold
              TBI    Times-BoldItalic

       There is also the following font which is not a member of a family:

              ZCMI   ZapfChancery-MediumItalic

       There are also some special fonts called S for the PS Symbol font.  The lower case greek characters are automatically slanted (to match the
       SymbolSlanted  font  (SS)  available to postscript).  Zapf Dingbats is available as ZD, the "hand pointing left" glyph (\[lh]) is available
       since it has been defined using the \X'pdf: xrev' extension which reverses the direction of letters within words.

       The default color for \m and \M is black; for colors defined in the ‘rgb’ color space setrgbcolor is used, for ‘cmy’  and  ‘cmyk’  setcmyk‐
       color,  and for ‘gray’ setgray.  Note that setcmykcolor is a PostScript LanguageLevel 2 command and thus not available on some older print‐
       ers.

       gropdf understands some of the X commands produced using the \X escape sequences supported by grops.  Specifically, the following  is  sup‐
       ported.

       \X'ps: invis'
              Suppress output.

       \X'ps: endinvis'
              Stop suppressing output.

       \X'ps: exec gsave currentpoint 2 copy translate n rotate neg exch neg exch translate'
              where n is the angle of rotation.  This is to support the align command in gpic.

       \X'ps: exec grestore'
              Again used by gpic to restore after rotation.

       \X'ps: exec n setlinejoin'
              where n can be one of the following values.

              0 = Miter join
              1 = Round join
              2 = Bevel join

       \X'ps: exec n setlinecap'
              where n can be one of the following values.

              0 = Butt cap
              1 = Round cap, and
              2 = Projecting square cap

       \X'ps: ... pdfmark'
              All the pdfmark macros installed by using -m pdfmark or -m mspdf (see documentation in ‘pdfmark.pdf’).  A subset of these macros are
              installed automatically when you use -Tpdf so you should not need to use ‘-m pdfmark’ for using most of the PDF functionality.

       All other ps: tags are silently ignored.

       One \X special used by the DVI driver is also recognised:

       \X'papersize=paper-size'
              where the paper-size parameter is the same as the papersize command.  See groff_font(5) for details.  This means that you can  alter
              the  page size at will within the PDF file being created by gropdf.  If you do want to change the paper size, it must be done before
              you start creating the page.

       In addition, gropdf supports its own suite of pdf: tags.  The following tags are supported:

       \X'pdf: pdfpic file alignment width height line-length'
              Place an image of the specified width containing the PDF drawing from file file of desired width and height (if height is missing or
              zero  then  it  is  scaled proportionally).  If alignment is -L the drawing is left aligned.  If it is -C or -R a linelength greater
              than the width of the drawing is required as well.  If width is specified as zero then the width is  scaled  in  proportion  to  the
              height.

       \X'pdf: xrev'
              This  toggles  a  flag  which  reverses  the direction of printing letter by letter, i.e., each separate letter is reversed, not the
              entire word.  This is useful for reversing the direction of glyphs in the Dingbats font.  To return to normal  printing  repeat  the
              command again.

       \X'pdf: markstart /ANN definition'
              The  macros  which support PDF Bookmarks use this call internally to start the definition of bookmark hotspot (user will have called
              ‘.pdfhref L’ with the text which will become the ‘hot spot’ region).  Normally this is never used except  from  within  the  pdfmark
              macros.

       \X'pdf: markend'
              The  macros  which  support PDF Bookmarks use this call internally to stop the definition of bookmark hotspot (user will have called
              ‘.pdfhref L’ with the text which will become the ‘hot spot’ region).  Normally this is never used except  from  within  the  pdfmark
              macros.

       \X'pdf: marksuspend'
       \X'pdf: markrestart'
              If you are using page traps to produce headings, footings, etc., you need to use these in case a ‘hot spot’ crosses a page boundary,
              otherwise any text output by the heading or footing macro will be marked as part of the ‘hot spot’.  To  stop  this  happening  just
              place  ‘.pdfmarksuspend’  and  ‘.pdfmarkrestart’  at the start and end of the page trap macro, respectively.  (These are just conve‐
              nience macros which emit the \X code.  These macros must only be used within page traps.)

   Importing graphics
       gropdf only supports importing other PDF files as graphics.  But that PDF file may contain any of the graphic formats supported by the  PDF
       standard (such as JPEG, PNG, GIF, etc.).  So any application which outputs PDF can be used as an embedded file in gropdf.  The PDF file you
       wish to insert must be a single page and the drawing must just fit inside the media size of the PDF file.  So, in  inkscape(1)  or  gimp(1)
       (for example) make sure the canvas size just fits the image.

       The  PDF parser used in gropdf has not been rigorously tested with all possible applications which produce PDFs.  If you find a single page
       PDF which fails to import properly, it is worth running it through the pdftk(1) program by issuing the command:

              pdftk oldfile.pdf output newfile.pdf

       You may find that newfile.pdf will now load successfully.

   TrueType and other font formats
       gropdf does not support any other fonts except Adobe Type 1 (PFA or PFB).

FONT INSTALLATION
       This section gives a summary of the above explanations; it can serve as a step-by-step font installation guide for gropdf.

        ·  Convert your font to something groff understands.  This is either a PostScript Type 1 font in either PFA or PFB, together with  an  AFM
           file.

           The very first line in a PFA/PFB file contains this:

                  %!PS-AdobeFont-1.0:

           A PFB file has this also in the first line, but the string is preceded with some binary bytes.

        ·  Convert the AFM file to a groff font description file with the afmtodit(1) program.  An example call is

                  afmtodit Foo-Bar-Bold.afm map/textmap FBB

           which  converts  the  metric file ‘Foo-Bar-Bold.afm’ to the groff font ‘FBB’.  If you have a font family which comes with normal, bold,
           italic, and bold italic faces, it is recommended to use the letters R, B, I, and BI, respectively, as postfixes in the groff font names
           to  make  groff's  ‘.fam’ request work.  An example is groff's built-in Times-Roman font: The font family name is T, and the groff font
           names are TR, TB, TI, and TBI.

        ·  Install both the groff font description files and the fonts in a ‘devpdf’ subdirectory of the font path which  groff  finds.   See  the
           ENVIRONMENT  section in the troff(1) man page which lists the actual value of the font path.  Note that groff doesn't use the AFM files
           (but it is a good idea to store them anyway).

        ·  Register all fonts which must be downloaded to the printer in the ‘devpdf/download’ file.  Only the first occurrence of  this  file  in
           the  font  path  is read.  This means that you should copy the default ‘download’ file to the first directory in your font path and add
           your fonts there.  To continue the above example we assume that the PS font name for Foo-Bar-Bold.pfa is ‘XY-Foo-Bar-Bold’ (the PS font
           name  is  stored  in  the internalname field in the ‘FBB’ file) and belongs to foundry ‘Fcq] thus the following line should be added to
           ‘download’:

                  F XY-Foo-Bar-Bold Foo-Bar-Bold.pfa

           Use a tab character to separate the fields, and the ‘foundry’ field should be null for the default foundry.

ENVIRONMENT
       GROFF_FONT_PATH
              A list of directories in which to search for the devname directory in addition to the default ones.  If, in the ‘download’ file, the
              font file has been specified with a full path, no directories are searched.  See troff(1) and groff_font(5) for more details.

       SOURCE_DATE_EPOCH
              A timestamp (expressed as seconds since the Unix epoch) to use as the creation timestamp in place of the current time.

FILES
       /usr/share/groff/1.22.3/font/devpdf/DESC      Device description file.

       /usr/share/groff/1.22.3/font/devpdf/F         Font description file for font F.

       /usr/share/groff/1.22.3/font/devpdf/U-F       Font description file for font F (using foundry U rather than the default foundry).

       /usr/share/groff/1.22.3/font/devpdf/download  List of downloadable fonts.

       /usr/share/groff/1.22.3/font/devpdf/Foundry   A Perl script used during install to locate suitable fonts.

       /usr/share/groff/1.22.3/font/devpdf/enc/text.enc
                                                     Encoding used for text fonts.

       /usr/share/groff/1.22.3/tmac/pdf.tmac         Macros for use with gropdf; automatically loaded by troffrc.

SEE ALSO
       afmtodit(1), groff(1), grops(1), troff(1), grops(1), pfbtops(1), groff_out(5), groff_font(5), groff_char(7), groff_tmac(5)

LICENSE
       Copyright © 2011-2014 Free Software Foundation, Inc.

       Permission is granted to make and distribute verbatim copies of this manual provided the copyright notice and this permission notice are
       preserved on all copies.

       Permission is granted to copy and distribute modified versions of this manual under the conditions for verbatim copying, provided that the
       entire resulting derived work is distributed under the terms of a permission notice identical to this one.

       Permission is granted to copy and distribute translations of this manual into another language, under the above conditions for modified
       versions, except that this permission notice may be included in translations approved by the Free Software Foundation instead of in the
       original English.

Groff Version 1.22.3                                              28 January 2016                                                        GROPDF(1)
