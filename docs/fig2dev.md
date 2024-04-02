
FIG2DEV(1)                                                    General Commands Manual                                                   FIG2DEV(1)

NAME
       fig2dev - translates Fig code to various graphics languages

SYNOPSIS
       fig2dev -L language [ -m mag ] [ -f font ] [ -s fsize ] [ other options ] [ fig-file [ out-file ] ]

DESCRIPTION
       Fig2dev translates fig code in the named fig-file into the specified graphics language and puts them in out-file.  The default fig-file and
       out-file are standard input and standard output, respectively

       Xfig (Facility for Interactive Generation of figures) is a screen-oriented tool which runs under the X Window System, and allows  the  user
       to  draw  and  manipulate objects interactively.  This version of fig2dev is compatible with xfig versions 1.3, 1.4, 2.0, 2.1, 3.0, 3.1 and
       3.2.

       Xfig version 3.2.3 and later saves and allows the user to edit comments for each Fig object.  These comments are output with several of the
       output languages, such as PostScript, CGM, EMF, LaTeX, MetaFont, PicTeX, (as % comments), tk (as # comments), and pic (as .\" comments).

GENERAL OPTIONS (all drivers)
       -L language
              Set  the  output  graphics  language.  Valid languages are box, cgm, epic, eepic, eepicemu, emf, eps, gbx (Gerber beta driver), gif,
              ibmgl, jpeg, latex, map (HTML image map), mf (MetaFont), mp (MetaPost), mmp (Multi-MetaPost), pcx, pdf, pdftex, pdftex_t,  pdftex_p,
              pic,  pictex,  png,  ppm,  ps, pstex, pstex_t, pstex_p, pstricks, ptk (Perl/tk), shape (LaTeX shaped paragraphs), sld (AutoCad slide
              format), svg (beta driver), textyl, tiff, tk (tcl/tk), tpic, xbm and xpm.

              Notes:
              dvips
               and xdvi must be compiled with the tpic support (-DTPIC) for epic, eepic and tpic to work.
              You must have ghostscript and ps2pdf, which comes with the ghostscript distribution to get the pdf output  and  the  bitmap  formats
              (png, jpeg, etc.), and the netpbm (pbmplus) package to get gif, xbm, xpm, and sld output.

       -h     Print help message with all options for all output languages then exit.

       -V     Print the program version number and exit.

       -D +/-rangelist
              With  +rangelist,  keep only those depths in the list.  With -rangelist, keep all depths except those in the list. The rangelist may
              be a list of comma-separated numbers or ranges separated by colon (:). For example, -D +10,40,55:70,80 means keep  only  layers  10,
              40, 55 through 70, and 80.

       -K     The selection of the depths with the '-D +/-rangelist' option does normally not affect the calcualtion of the bounding box. Thus the
              generated document might have a much larger bounding box than necessary. If -K is given then the bounding box is adjusted to include
              only those objects in the selected depths.

       -f font
              Set  the  default  font used for text objects to font.  The default is Roman; the format of this option depends on the graphics lan‐
              guage in use.  In TeX-based languages, the font is the base of the name given in lfonts.tex, for instance "cmr" for Roman,  or  "tt"
              for teletype.  In PostScript, it is any font name known to the printer or interpreter. For Gerber it has no effect.

       -G minor[:major][:unit]
              Draws  a grid on the page.  Specify thin, or thin and thick line spacing in one of several units.  For example, "-G .25:1cm" draws a
              thin, gray line every .25 cm and a thicker gray line every 1 cm.  Specifying "-G 1in" draws a thin line every 1 inch.  Fractions may
              be used, e.g. "-G 1/16:1/2in" will draw a thin line every 1/16 inch (0.0625 inch) and a thick line every 1/2 inch.
              Allowable units are: i, in, inch, f, ft, feet, c, cm, mm, and m.
              Only allowed for PostScript, EPS, PDF, and bitmap (GIF, JPEG, etc) drivers for now.

       -j     Enable the I18N internationalization facility.

       -m mag Set  the  magnification  at  which  the  figure is rendered to mag.  The default is 1.0.  This may not be used with the maxdimension
              option (-Z).

       -s size
              Set the default font size (in points) for text objects to fsize.  The default is 11*mag, and thus is scaled by the  -m  option.   If
              there is no scaling, the default font is eleven point Roman."

       -Z maxdimension
              Scale  the  figure so that the maximum dimension (width or height) is maxdimension inches or cm, depending on whether the figure was
              saved with imperial or metric units.  This may not be used with the magnification option (-m).

       other options
              The other options are specific to the choice of graphics language, as described below.

CGM OPTIONS
       CGM is Computer Graphics Metafile, developed by ISO and ANSI and is a vector-based plus bitmap language.  Microsoft  WORD,  PowerPoint  and
       probably other products can import this format and display it on the screen, something that they won't do with EPS files that have an ASCII
       preview.

       -b dummyarg
              Generate binary output (dummy argument required after the "-b").

       -r     Position arrowheads for CGM viewers that display rounded arrowheads.  Normally, arrowheads are pointed, so fig2dev  compensates  for
              this  by  moving the endpoint of the line back so the tip of the arrowhead ends where the original endpoint of the line was.  If the
              -r option is used, the position of arrows will NOT be corrected for compensating line width effects, because the  rounded  arrowhead
              doesn't extend beyond the endpoint of the line.

EMF OPTIONS
       EMF is Enhanced Metafile, developed by Microsoft and is a vector-based plus bitmap language.  Microsoft WORD, PowerPoint and probably other
       products can import this format and display it on the screen, something that they won't do with EPS files that have an ASCII preview.

EPIC OPTIONS
       EPIC is an enhancement to LaTeX picture drawing environment.  It was developed by Sunil Podar of Department of Computer Science in  S.U.N.Y
       at Stony Brook.

       EEPIC  is  an  extension to EPIC and LaTeX picture drawing environment which uses tpic specials as a graphics mechanism.  It was written by
       Conrad Kwok of Division of Computer Science at University of California, Davis.

       EEPIC-EMU is an EEPIC emulation package which does not use tpic specials.

       -A factor
              Scale arrowheads by factor.  The width and height of arrowheads is divided by this factor.  This is because EPIC arrowheads are nor‐
              mally about double the size of TeX arrowheads.

       -E num Set encoding for text translation (0 = none, 1 = ISO-8859-1, 2 = ISO-8859-2)

       -F     Don't  set the font face, series, and style; only set it's size and the baselineskip. By default, fig2dev sets all 5 font parameters
              when it puts some text. The disadvantage is that you can't set the font from your LaTeX document. With this option on, you  can  set
              the font from your LaTeX document (like "\sfshape \input picture.eepic").

              If  any  of  the  pictures included in your LaTeX document has been generated with -F, then all pictures must be generated with this
              option.

              This option can be used only when fig2dev was compiled with NFSS defined.

       -l width
              Use "\thicklines" when width of the line is wider than lwidth.  The default is 2.

       -P     Generate a complete LaTeX file. In other words, the output file can be formatted without requiring any changes. The additional  text
              inserted in the beginning and at the end of the file is controlled by the configuration parameter "Preamble" and "Postamble".

       -R     Allow  rotated text. Rotated text will be set using the \rotatebox command.  So, you will need to include "\usepackage{graphics}" in
              the preamble of your LaTeX document.

              If this option is not set, then rotated text will be set horizontally.

       -S scale
              Set the scale to which the figure is rendered.  This option automatically sets the magnification and size to scale /  12  and  scale
              respectively.

       -t stretch
              Set the stretch factor of dashed lines to sretch.  The default is 30.

       -v     Include comments in the output file.

       -W     Enable  variable  line  width.   By  default,  only two line widths are available: The normal line width (hinlines), and thick lines
              (hicklines), if a line width of more than one is selected in xfig.

       -w     Disable variable line width. Only "\thicklines" and/or "\thinlines" commands will be generated in the output file.

              When variable line width option is enabled, "\thinlines" command is still used when line width is less than LineThick. One potential
              problem  is  that the width of "\thinlines" is 0.4pt but the resolution of Fig is 1/80 inch (approx. 1pt). If LineThick is set to 2,
              normal lines will be drawn in 0.4pt wide lines but the next line width is already 2pt. One possible solution is to set LineThick  to
              1 and set the width of the those lines you want to be drawn in "\thinlines"  to 0.

              Due to this problem, Variable line width VarWidth is defaulted to be false.

IBM-GL (HP/GL) OPTIONS
       IBM-GL (IBM Graphics Language) is compatible with HP-GL (Hewlett-Packard Graphics Language).

       -a     Select ISO A4 (ANSI A) paper size if the default is ANSI A (ISO A4) paper size.

       -c     Generate instructions for an IBM 6180 Color Plotter with (without) an IBM Graphics Enhancement Cartridge (IBM-GEC).

       -d xll,yll,xur,yur
              Restrict  plotting to a rectangular area of the plotter paper which has a lower left hand corner at (xll,yll) and a upper right hand
              corner at (xur,yur).  All four numbers are in inches and follow -d in a comma-sparated list  -  xll,yll,xur,yur  -  with  no  spaces
              between them.

       -f file
              Load  text  character  specifications  from  the table in the fonts file.  The table must have 36 entries - one for each font plus a
              default.  Each entry consists of 5 numbers which specify the 1.) standard character set (0 - 4, 6 - 9, 30 - 39), 2.) alternate char‐
              acter  set  (0  - 4, 6 - 9, 30 - 39), 3.) character slant angle (degrees), 4.) character width scale factor and 5.) character height
              scale factor.

       -k     Precede output with PCL command to use HP/GL

       -l pattfile
              Load area fill line patterns from the table in the pattfile file.  The table must have 21 entries - one for each of  the  area  fill
              patterns.   Each  entry  consists  of 5 numbers which specify the 1.) pattern number (-1 - 6), 2.) pattern length (inches), 3.) fill
              type (1 - 5), 4.) fill spacing (inches) and 5.) fill angle (degrees).

       -m mag,x0,y0
              The magnification may appear as the first element in a comma separated list - mag,x0,y0 - where  the  second  and  third  parameters
              specify an offset in inches.

       -P     Rotate the figure to portrait mode. The default is landscape mode.

       -p penfile
              Load  plotter  pen  specifications  from  the  table in the penfile file.  The table must have 9 entries - one for each color plus a
              default.  Each entry consists of 2 numbers which specify the 1.) pen number (1 - 8) and 2.) pen thickness (millimeters).

       -S speed
              Set the pen speed to speed (centimeters/second).

       -v     Plot the figure upside-down in portrait mode or backwards in landscape mode.  This allows you to write on the top surface  of  over‐
              head transparencies without disturbing the plotter ink on the bottom surface.

       Fig2dev  may  be  installed with either ANSI A or ISO A4 default paper size.  The -a option selects the alternate paper size.  Fig2dev does
       not fill closed splines.  The IBM-GEC is required to fill other polygons.  Fig2dev may be installed for plotters with or without  the  IBM-
       GEC.  The -c option selects the alternate instruction set.

OPTIONS COMMON TO ALL BITMAP FORMATS
       -b borderwidth
              Make blank border around figure of width borderwidth.

       -F     Use correct font sizes (points, 1/72 inch) instead of the traditional size that xfig/fig2dev uses, which is (1/80 inch).  The corre‐
              sponding xfig command-line option is -correct_font_size.

       -g color
              Use color for the background.

       -N     Convert all colors to grayscale.

       -S smoothfactor
              This will smooth the output by passing smoothfactor to ghostscript in the -dTextAlphaBits and -dGraphicsAlphaBits options to improve
              font rendering and graphic smoothing.  A value of 2 for smoothfactor provides some smoothing and 4 provides more.

GIF OPTIONS
       -t color
              Use  color  for  the  transparent  color in the GIF file.  This must be specified in the same format that ppmmake(1) allows.  It may
              allow an X11 color name, but at least you may use a six-digit hexadecimal RGBvalue using the # sign, e.g. #ff0000 (Red).

JPEG OPTIONS
       -q image_quality
              use the integer value image_quality for the JPEG "Quality" factor.  Valid values are 0-100, with the default being 75.

LATEX OPTIONS
       -d dmag
              Set a separate magnification for the length of line dashes to dmag.

       -E num Set encoding for latex text translation (0 no translation, 1 ISO-8859-1, 2 ISO-8859-2)

       -l lwidth
              Sets the threshold between LaTeX thin and thick lines to lwidth pixels.  LaTeX supports only two different  line  width:  \thinlines
              and  \thicklines.  Lines of width greater than lwidth pixels are drawn as \thicklines.  Also affects the size of dots in dotted line
              style.  The default is 1.

       -v     Verbose mode.

       LaTeX cannot accurately represent all the graphics objects which can be described by Fig.  For example, the possible slopes which lines may
       have  are  limited.   Some  objects, such as spline curves, cannot be drawn at all.  Fig2latex chooses the closest possible line slope, and
       prints error messages when objects cannot be drawn accurately

MAP (HTML image map) OPTIONS
       Xfig version 3.2.3 and later saves and allows the user to edit comments for each Fig object.  The fig2dev map output language will  produce
       an  HTML  image  map  using Fig objects that have href="some_html_reference" in their comments.  Any Fig object except compound objects may
       used for this.  Usually, besides generating the map file, you would also generate a PNG file, which is the image to which the map refers.

       For example, you may have an xfig drawing with an imported image that has the comment href="go_here.html" and a box object with  a  comment
       href="go_away.html".  This will produce an image map file such the user may click on the image and the browser will load the "go_here.html"
       page, or click on the box and the browser will load the "go_away.html" page.

       After the map file is generated by fig2dev you will need to edit it to fill out any additional information it may need.

       -b borderwidth
              Make blank border around figure of width borderwidth.

METAFONT OPTIONS
       fig2dev scales the figure by 1/8 before generating METAFONT code.  The magnification can be further changed with the -m option or by giving
       magnification options to mf.

       In  order  to  process  the  generated METAFONT code, the mfpic macros must be installed where mf can find them. The mfpic macro package is
       available at any CTAN cite under the subdirectory: graphics/mfpic

       -C code
              specifies the starting METAFONT font code. The default is 32.

       -n name
              specifies the name to use in the output file.

       -p pen_magnification
              specifies how much the line width should be magnified compared to the original figure. The default is 1.

       -t top specifies the top of the whole coordinate system. The default is ypos.

       -x xmin
              specifies the minimum x coordinate value of the figure (inches). The default is 0.

       -y ymin
              specifies the minimum y coordinate value of the figure (inches). The default is 0.

       -X xmax
              specifies the maximum x coordinate value of the figure (inches). The default is 8.

       -Y ymax
              specifies the maximum y coordinate value of the figure (inches). The default is 8.

METAPOST OPTIONS
       -i file
              Include file content via \input-command.

       -I file
              Include file content as additional header.

       -o     Old mode (no latex).

       -p number
              Adds the line "prologues:=number" to the output.

PIC OPTIONS
       -p ext Enables the use of certain PIC extensions which are known to work with the groff package; compatibility with  DWB  PIC  is  unknown.
              The extensions enabled by each option are:

           arc     Allow ARC_BOX i.e. use rounded corners
           line    Use the 'line_thickness' value
           fill    Allow ellipses to be filled
           all     Use all of the above
           psfont  Don't convert Postscript fonts generic type
                   (useful for files going to be Ditroff'ed for
                   and printed on PS printer). DWB-compatible.
           allps   Use all of the above (i.e. "all" + "psfont")

PICTEX OPTIONS
       In order to include PiCTeX pictures into a document, it is necessary to load the PiCTeX macros.

       PiCTeX  uses  TeX  integer  register  arithmetic  to  generate curves, and so it is very slow.  PiCTeX draws curves by \put-ing the psymbol
       repeatedly, and so requires a large amount of TeX's internal memory, and generates large DVI files.  The size of TeX's  memory  limits  the
       number of plot symbols in a picture.  As a result, it is best to use PiCTeX to generate small pictures.

       -E num Set encoding for latex text translation (0 no translation, 1 ISO-8859-1, 2 ISO-8859-2)

GBX OPTIONS (Gerber, RS-247-X)
       Typically you will wish to set the y scale to -1.  See -g for more information.

       -d [mm|in]
              Output dimensions should be assumed to be millimeters (mm) or inches (in).  The default is millimeters.

       -p [pos|neg]
              Select  the  image  polarity.  For positive images lines drawn in the fig file will generate lines of material.  For negative images
              lines drawn in the fig file will result in removed material.  Consider etching a chrome on glass transmission mask.   Drawing  lines
              in the fig file and choosing 'neg' will result in these lines being etched through the chrome, leaving transparent lines.

       -g <x scale>x<y scale>+<x offset>+<y offset>
              This controls the geometry of the output, scaling the dimensions as shown and applying the given offset.  Typically you will wish to
              set the y scale to -1, mirroring about the x axis.  This is because Gerber assumes the origin to be bottom left, while xfig  selects
              top left.

       -f <n digits>.<n digits>
              This  controls  the  number  of  digits  of  precision before and after the implied decimal point.  With -f 5.3 the following number
              12345678 corresponds to 12345.678.  Whereas with -f 3.5 it corresponds to 123.45678.  The default is for 3 places before the decimal
              point and 5 after.  This corresponds, to a range of 0 to 1m in 10 micron increments.

       -i [on|off]
              Controls  the output of comments describing the type of objects being output.  The text appears as comments starting with ## on each
              line in the output file.  By default this is on.

POSTSCRIPT, ENCAPSULATED POSTSCRIPT (EPS), and PDF OPTIONS
       With PostScript, xfig can be used to create multiple page figures Specify the -M option to produce a multi-page output.  For  posters,  add
       -O to overlap the pages slightly to get around the problem of the unprintable area in most printers, then cut and paste the pages together.
       Due to memory limitations of most laser printers, the figure should not have large imported images (bitmaps). Great for text with very  big
       letters.

       The EPS driver has the following differences from PostScript:
           o No showpage is generated because the output is meant to be imported into another program or document and not printed
           o The landscape/portrait options are ignored
           o The centering option is ignored
           o The multiple-page option is ignored
           o The paper size option is ignored
           o The x/y offset options are ignored

       The EPS driver has the following two special options:

       -B 'Wx [Wy X0 Y0]'
              This  specifies  that  the  bounding box of the EPS file should have the width Wx and the height Wy.  Note that it doesn't scale the
              figure to this size, it merely sets the bounding box.  If a value less than or equal to 0 is specified for Wx or Wy, these  are  set
              to  the width/height respectively of the figure. Origin is relative to screen (0,0) (upper-left).  Wx, Wy, X0 and Y0 are interpreted
              in centimeters or inches depending on the measure given in the fig-file.  Remember to put either quotes (") or  apostrophes  (')  to
              group the arguments to -B.

       -R 'Wx [Wy X0 Y0]'
              Same  as  the -B option except that X0 and Y0 is relative to the lower left corner of the figure.  Remember to put either quotes (")
              or apostrophes (') to group the arguments to -R.

       The PDF driver uses all the PostScript options.

       Text can now include various ISO-character codes above 0x7f, which is useful for language specific characters to be printed directly.   Not
       all ISO-characters are implemented.

       Color  support:  Colored  objects created by Fig can be printed on a color postscript printer. There are 32 standard colors: black, yellow,
       white, gold, five shades of blue, four shades of green, four shades of cyan, four shades of red, five shades of  magenta,  four  shades  of
       brown,  and four shades of pink.  In addition there may be user-defined colors in the file.  See the xfig FORMAT3.2 file for the definition
       of these colors.  On a monochrome printer, colored objects will be mapped into different grayscales by the  printer.   Filled  objects  are
       printed  using  the  given  area  fill and color.  There are 21 "shades" going from black to full saturation of the fill color, and 21 more
       "tints" from full saturation + 1 to white.  In addition, there are 16 patterns such as bricks, diagonal lines, crosshatch, etc.

       -A     Add an ASCII (EPSI) preview.

       -b borderwidth
              Make blank border around figure of width borderwidth.
              Not available in EPS.

       -C dummy_arg
              Add a color *binary* TIFF preview for Microsoft products that need a binary preview.  See also -T  (monochrome  preview).   A  dummy
              argument must be supplied for historical reasons.

       -c     option centers the figure on the page.  The centering may not be accurate if there are texts in the fig_file that extends too far to
              the right of other objects.

       -e     option puts the figure against the edge (not centered) of the page.  Not available in EPS.

       -F     Use correct font sizes (points) instead of the traditional size that xfig/fig2dev uses, which is 1/80 inch.  The corresponding  xfig
              command-line option is -correct_font_size.

       -g color
              Use color for the background.

       -l dummy_arg
              Generate figure in landscape mode.  The dummy argument is ignored, but must appear on the command line for reasons of compatibility.
              This option will override the orientation specification in the file (for file versions 3.0 and higher).
              Not available in EPS.

       -M     Generate multiple pages if figure exceeds paper size.
              Not available in EPS.

       -N     Convert all colors to grayscale.

       -n name
              Set the Title part of the PostScript output to name.  This is useful when the input to fig2dev comes from standard input.

       -O     When used with -M, overlaps the pages slightly to get around the problem of the unprintable area in most printers.
              Not available in EPS.

       -p dummy_arg
              Generate figure in portrait mode.  The dummy argument is ignored, but must appear on the command line for reasons of  compatibility.
              This option will override the orientation specification in the file (for file versions 3.0 and higher).  This is the default for Fig
              files of version 2.1 or lower.
              Not available in EPS.

       -T     Add a monochrome *binary* TIFF preview for Microsoft products that need a binary preview.  See also -C (color preview).

       -x offset
              shift the figure in the X direction by offset units (1/72 inch).  A negative value shifts the figure to  the  left  and  a  positive
              value to the right.
              Not available in EPS.

       -y offset
              shift the figure in the Y direction by offset units (1/72 inch).  A negative value shifts the figure up and a positive value down.
              Not available in EPS.

       -z papersize
              Sets the papersize.  Not available in EPS.
              Available paper sizes are:
                  "Letter" (8.5" x 11" also "A"),
                  "Legal" (11" x 14")
                  "Ledger" (11" x 17"),
                  "Tabloid" (17" x 11", really Ledger in Landscape mode),
                  "A" (8.5" x 11" also "Letter"),
                  "B" (11" x 17" also "Ledger"),
                  "C" (17" x 22"),
                  "D" (22" x 34"),
                  "E" (34" x 44"),
                  "A4" (21  cm x  29.7cm),
                  "A3" (29.7cm x  42  cm),
                  "A2" (42  cm x  59.4cm),
                  "A1" (59.4cm x  84.1cm),
                  "A0" (84.1cm x 118.9cm),
                  and "B5" (18.2cm x 25.7cm).

PSTEX OPTIONS
       The  pstex  language is a variant of ps which suppresses formatted (special) text.  The pstex_t language has the complementary behavior: it
       generates only the LaTeX special text and the commands necessary to position special text, and to overlay  the  PostScript  file  generated
       using pstex.  These two drivers can be used to generate a figure which combines the flexibility of PostScript graphics with LaTeX text for‐
       matting of special text.

       -F     Use correct font sizes (points) instead of the traditional size that xfig/fig2dev uses, which is 1/80 inch.  The corresponding  xfig
              command-line option is -correct_font_size.

       -g color
              Use color for the background.

       -n name
              sets the Title part of the PostScript output to name.  This is useful when the input to fig2dev comes from standard input.

PSTEX_T OPTIONS
       The  pstex_t  language  produces  only the LaTeX special text and the commands necessary to position special text, and to overlay the Post‐
       Script file generated using pstex.  (see above)

       -E num Set encoding for latex text translation (0 no translation, 1 ISO-8859-1, 2 ISO-8859-2)

       -F     Don't set the font face, series, and style; only set it's size and the baselineskip. By default, fig2dev sets all 5 font  parameters
              when  it  puts some text. The disadvantage is that you can't set the font from your LaTeX document. With this option on, you can set
              the font from your LaTeX document (like "\sfshape \input picture.eepic").

       -p file
              specifies the name of the PostScript file to be overlaid.  If not set or its value is null then no PS file will be inserted.

PSTricks OPTIONS
       The PSTricks driver provides full LaTeX text and math formatting for XFig drawings without overlaying separate  outputs  as  in  the  PSTEX
       methods.   The  output  matches the quality of output of the PostScript driver except for text, where the Latex font selection mechanism is
       used as for other fig2dev LaTeX drivers. In addition, text is rendered black, although font color-changing LaTex code can  be  embedded  in
       the  drawing.   The  generated  PSTricks code is meant to be readable.  Each command stands alone, not relying on global option state vari‐
       ables.  Thus the user can easily use XFig to rough out a PSTricks drawing, then finish by hand editing.

       To use the driver's output, give the command "\usepackage{pstricks}" in your document preamble.  The graphicx and pstricks-add packages may
       also be required.  The former is used for bitmap graphics and the second for complex line styles and/or hollow PSTricks arrows (with the -R
       1 option).  The driver will tell you which packages are needed.  In the document body, include the figure with "\input{pstfile}" where pst‐
       file.tex  is  the  output file.  Use the XFig special flag to have text passed as-is to LaTeX.  For non-special text, the same mechanism as
       the LaTeX and epic driver mechanism is used to match font specs, but this is imprecise.

       Known bugs and limitations.
              PSTricks support for join styles is version dependent. Raw postscript is inserted with "\pstVerb" for old versions when  other  than
              angle  joins  are needed.  The -t option controls this behavior. PSTricks does not support rotated ellipses directly, so a rput com‐
              mand is emitted that rotates and locates a horizontal ellipse.  This makes a problem  with  hatch  patterns,  which  are  moved  and
              rotated along with the ellipse.  Hatch rotation is fixed by a counter-rotation, but the origin is not adjusted, so registration with
              adjacent hatch patterns will be incorrect.  Flipped bitmap graphics use an undocumented feature of the graphicx package: a  negative
              height  flips  the  image  vertically.   This appears to work reliably.  However, you may want to flip graphics with another program
              before including them in Xfig drawings just to be sure.  With the -p option, the driver attempts to convert non-EPS pictures to  EPS
              with the TeX distribution's bmeps program, but bmeps does not know about very many file formats including gif.

       -G dummy_arg
              Draws a standard PSTricks grid in light gray, ignoring the size parameters, numbered in PSTricks units.

       -l weight
              Sets  a line weight factor that is multiplied by the actual Fig line width.  The default value 0.5 roughly matches the output of the
              PS driver.

       -n 0|1|2|3
              Sets environment type.  Default 0 creates a \picture environment with bounding box exactly enclosing the picture (but see -x and  -y
              ).   A 1 emits bare PSTricks commands with no environment at all, which can be used with \input{commands} inside an existing \pspic‐
              ture.  A 2 emits a complete LaTeX document.  A 3 also emits a complete LaTeX document but attempts to set the PSTricks unit to fit a
              7.5 by 10 inch (portrait aspect) box.

       -P     Shorthand for -n 3
               .

       -p dir Attempts  to run the bmeps program to translate picture files to EPS, which is required by PSTricks.  The translated files go in dir
              , which must already exist (the driver will not create it). Moreover, (BIG CAVEAT HERE) the driver overwrites files with impunity in
              this  directory!   Don't put your stuff here.  The includegraphics commands in the output file refer to this directory.  Even if the
              -p option is not used, includegrpahics commands follow this convention with the default directory ./eps .  In this  case,  the  user
              must  do  the conversions independently.  The bmeps program is part of the standard TeX distribution. It converts the following for‐
              mats to EPS: png jpg pnm tif.  You can see the bmeps command with the -v option.

       -R 0|1|2
              Sets arrow style.  With the default style 0, Fig arrows are converted to lines and polygons.  With style 1, the Fig arrowhead dimen‐
              sions  are  converted  to  PSTricks arrowhead dimensions and PSTricks arrowhead options are emitted.  Hollow arrows will require the
              additional package pstricks-add
               . With style 2, PSTricks arrowhead options are emitted with no dimensions at all, and arrowhead size  may  be  controlled  globally
              with psset
               .

       -S scale
              Scales the image according to the same convention as the EPIC driver, i.e., to size scale
               /12.

       -t version
              Provides the driver with PSTricks version number so output can match expected LaTeX input.

       -v     Print  verbose  warnings  and extra comments in the output file.  Information provided includes font substitution details, the bmeps
              commands used for picture conversion, if any, and one comment per Fig object in the output.

       -x marginsize
              Adds marginsize on the left and right of the PStricks bounding box.  By default, the box exactly encloses the image.

       -y marginsize
              Adds marginsize on the top and bottom of the PStricks bounding box.  By default, the box exactly encloses the image.

       -z 0|1|2
              Sets font handling option.  Default option 0 attempts to honor Fig font names and sizes, finding the  best  match  with  a  standard
              LaTeX font.  Option 1 sets LaTeX font size only.  Option 2 issues no font commands at all.

PSTEX_P and PDFTEX_P OPTIONS
       The  pstex_p language has the same intention as the combination of pstex and pstex_t.  The only reason to use pstex_p is that you have par‐
       tially overlayed texts.  pstex_p splits the Fig file concerning the depths of existing texts. Because of it's necessary to get the  result‐
       ing size of the figure for the pdf document you have to specify the target document format (i.e. using pstex_p rsp. pdftex_p).
       Two files results by using this language:

       1) A bash script for creating and removing the necessary graphics files.  Extension: .create

       2) The latex code which includes all graphics files and special texts. Content is put to stdout.

       The pstex_p driver has the following special options:

       -p basename
          specifies the basename of the files to be created (see (1) above). This option is mandatory.

       -d dmag
          Set a separate magnification for the length of line dashes to dmag.

       -E num
          Set encoding for latex text translation (0 no translation, 1 ISO-8859-1, 2 ISO-8859-2)

       -l lwidth
          Sets  the  threshold  between LaTeX thin and thick lines to lwidth pixels.  LaTeX supports only two different line width: \thinlines and
          \thicklines.  Lines of width greater than lwidth pixels are drawn as \thicklines.  Also affects the size of dots in dotted  line  style.
          The default is 1.

       -v Verbose mode.

       -F Don't set the font face, series, and style; only set it's size and the baselineskip. By default, fig2dev sets all 5 font parameters when
          it puts some text. The disadvantage is that you can't set the font from your LaTeX document. With this option on, you can set  the  font
          from your LaTeX document (like "\sfshape \input picture.eepic").

TK and PTK OPTIONS (tcl/tk and Perl/tk)
       -l dummy_arg
              Generate figure in landscape mode.  The dummy argument is ignored, but must appear on the command line for reasons of compatibility.
              This option will override the orientation specification in the file (for file versions 3.0 and higher).

       -p dummy_arg
              Generate figure in portrait mode.  The dummy argument is ignored, but must appear on the command line for reasons of  compatibility.
              This option will override the orientation specification in the file (for file versions 3.0 and higher).  This is the default for Fig
              files of version 2.1 or lower.

       -P     Generate canvas of full page size instead of using the bounding box of the figure's objects. The default is to use only the bounding
              box.

       -z papersize
              Sets  the papersize.  See the POSTSCRIPT OPTIONS for available paper sizes.  This is only used when the -P option (use full page) is
              used.

SEE ALSO
       [x]fig(1), pic(1) pic2fig(1), transfig(1)

BUGS and RESTRICTIONS
       Please send bug reports, fixes, new features etc. to:
       xfig-bugs@epb1.lbl.gov (Brian V. Smith)

       Arc-boxes are not supported for the tk output language, and only X bitmap pictures are supported because of the canvas limitation in tk.

       Picture objects are not scaled with the magnification factor for tk output.

       Because tk scales canvas items according to the X display resolution, polygons, lines, etc. may be scaled differently  than  imported  pic‐
       tures (bitmaps) which aren't scaled at all.

       Rotated text is only supported in the IBM-GL (HP/GL) and PostScript (including eps) languages.

       In  pdftex_p  language fig2dev can not determine the exact sizes of the special texts set by pdflatex afterwards. If these texts are bigger
       than expected the calculated bounding box might be too small so that some texts passes over the figure boundaries. If this happen you  have
       to put an invisible rectangle (line width 0) around the text or the entire figure.

COPYRIGHT
       Copyright (c) 1991 Micah Beck
       Parts Copyright (c) 1985 Supoj Sutantavibul
       Parts Copyright (c) 1989-1999 Brian V. Smith

       Permission  to  use,  copy, modify, distribute, and sell this software and its documentation for any purpose is hereby granted without fee,
       provided that the above copyright notice appear in all copies and that both that copyright notice and this permission notice appear in sup‐
       porting  documentation. The authors make no representations about the suitability of this software for any purpose.  It is provided "as is"
       without express or implied warranty.

       THE AUTHORS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND  FITNESS,  IN  NO
       EVENT  SHALL THE AUTHORS BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
       DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION  WITH  THE  USE  OR
       PERFORMANCE OF THIS SOFTWARE.

AUTHORS
       Micah Beck
       Cornell University
       Sept 28 1990

       and Frank Schmuck (then of Cornell University)
       and Conrad Kwok (then of U.C. Davis).

       drivers contributed by
       Jose Alberto Fernandez R. (U. of Maryland)
       and Gary Beihl (MCC)

       Color support, ISO-character encoding and poster support by
       Herbert Bauer (heb@regent.e-technik.tu-muenchen.de)

       Modified from f2p (fig to PIC), by the author of Fig
       Supoj Sutanthavibul (supoj@sally.utexas.edu)
       University of Texas at Austin.

       MetaFont driver by
       Anthony Starks (ajs@merck.com)

       X-splines code by
       Carole Blanc (blanc@labri.u-bordeaux.fr)
       Christophe Schlick (schlick@labri.u-bordeaux.fr)
       The  initial  implementation  was  done  by  C.  Feuille, S. Grobois, L. Maziere and L. Minihot as a student practice (Universite Bordeaux,
       France).

       Japanese text support for LaTeX output written by T. Sato (VEF00200@niftyserve.or.jp)

       The tk driver was written by
       Mike Markowski (mm@udel.edu) with a little touch-up by Brian Smith

       The CGM driver (Computer Graphics Metafile) was written by
       Philippe Bekaert (Philippe.Bekaert@cs.kuleuven.ac.be)

       The EMF driver (Enhanced Metafile) was written by
       Michael Schrick (m_schrick@hotmail.com)

       The GBX (Gerber) driver was written by
       Edward Grace (ej.grace@imperial.ac.uk).

       The PSTEX_P and PDFTEX_P drivers (overlayed LaTeX texts) was written by
       Michael Pfeiffer (p3f@gmx.de)

                                                            Version 3.2.5e August 2013                                                  FIG2DEV(1)
