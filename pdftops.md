pdftops(1)                                                                               General Commands Manual                                                                               pdftops(1)

NAME
       pdftops - Portable Document Format (PDF) to PostScript converter (version 3.03)

SYNOPSIS
       pdftops [options] <PDF-file> [<PS-file>]

DESCRIPTION
       Pdftops converts Portable Document Format (PDF) files to PostScript so they can be printed.

       Pdftops reads the PDF file, PDF-file, and writes a PostScript file, PS-file.  If PS-file is not specified, pdftops converts file.pdf to file.ps (or file.eps with the -eps option).  If PS-file is
       ´-', the PostScript is sent to stdout.

OPTIONS
       -f number
              Specifies the first page to print.

       -l number
              Specifies the last page to print.

       -level1
              Generate Level 1 PostScript.  The resulting PostScript files will be significantly larger (if they contain images), but will print on Level 1 printers.  This also converts all  images  to
              black and white.  No more than one of the PostScript level options (-level1, -level1sep, -level2, -level2sep, -level3, -level3sep) may be given.

       -level1sep
              Generate Level 1 separable PostScript.  All colors are converted to CMYK.  Images are written with separate stream data for the four components.

       -level2
              Generate Level 2 PostScript.  Level 2 supports color images and image compression.  This is the default setting.

       -level2sep
              Generate Level 2 separable PostScript.  All colors are converted to CMYK.  The PostScript separation convention operators are used to handle custom (spot) colors.

       -level3
              Generate Level 3 PostScript.  This enables all Level 2 features plus CID font embedding.

       -level3sep
              Generate Level 3 separable PostScript.  The separation handling is the same as for -level2sep.

       -eps   Generate  an  Encapsulated  PostScript  (EPS)  file.  An EPS file contains a single image, so if you use this option with a multi-page PDF file, you must use -f and -l to specify a single
              page.  No more than one of the mode options (-eps, -form) may be given.

       -form  Generate a PostScript form which can be imported by software that understands forms.  A form contains a single page, so if you use this option with a multi-page PDF file, you must use  -f
              and -l to specify a single page.  The -level1 option cannot be used with -form.  No more than one of the mode options (-eps, -form) may be given.

       -opi   Generate OPI comments for all images and forms which have OPI information.  (This option is only available if pdftops was compiled with OPI support.)

       -binary
              Write  binary  data in Level 1 PostScript.  By default, pdftops writes hex-encoded data in Level 1 PostScript.  Binary data is non-standard in Level 1 PostScript but reduces the file size
              and can be useful when Level 1 PostScript is required only for its restricted use of PostScript operators.

       -r number
              Set the resolution in DPI when pdftops rasterizes images with transparencies or, for Level 1 PostScript, when pdftops rasterizes images with color masks.  By default,  pdftops  rasterizes
              images to 300 DPI.

       -noembt1
              By  default,  any  Type  1 fonts which are embedded in the PDF file are copied into the PostScript file.  This option causes pdftops to substitute base fonts instead.  Embedded fonts make
              PostScript files larger, but may be necessary for readable output.

       -noembtt
              By default, any TrueType fonts which are embedded in the PDF file are copied into the PostScript file.  This option causes pdftops to substitute base fonts instead.  Embedded  fonts  make
              PostScript files larger, but may be necessary for readable output.  Also, some PostScript interpreters do not have TrueType rasterizers.

       -noembcidps
              By  default,  any  CID PostScript fonts which are embedded in the PDF file are copied into the PostScript file.  This option disables that embedding.  No attempt is made to substitute for
              non-embedded CID PostScript fonts.

       -noembcidtt
              By default, any CID TrueType fonts which are embedded in the PDF file are copied into the PostScript file.  This option disables that embedding.  No attempt is made to substitute for non-
              embedded CID TrueType fonts.

       -passfonts
              By  default,  references to non-embedded 8-bit fonts in the PDF file are substituted with the closest "Helvetica", "Times-Roman", or "Courier" font.  This option passes references to non-
              embedded fonts through to the PostScript file.

       -aaRaster yes | no
              Enable or disable raster anti-aliasing.  This defaults to "no".  pdftops may need to rasterize transparencies and pattern image masks in the PDF.  If the PostScript will be printed, leave
              -aaRaster disabled and set -r to the resolution of the printer.  If the PostScript will be viewed, enabling -aaRaster may make rasterized text easier to read.

       -optimizecolorspace
              By  default,  bitmap  images  in the PDF pass through to the output PostScript in their original color space, which produces predictable results.  This option converts RGB and CMYK images
              into Gray images if every pixel of the image has equal components.  This can fix problems when doing color separations of PDFs that contain embedded black and white images encoded as RGB.

       -preload
              preload images and forms

       -paper size
              Set the paper size to one of "letter", "legal", "A4", or "A3".  This can also be set to "match", which will set the paper size of each page to match the size specified in the PDF file. If
              none the -paper, -paperw, or -paperh options are specified the default is to match the paper size.

       -paperw size
              Set the paper width, in points.

       -paperh size
              Set the paper height, in points.

       -origpagesizes
              This option is the same as "-paper match".

       -nocrop
              By default, output is cropped to the CropBox specified in the PDF file.  This option disables cropping.

       -expand
              Expand PDF pages smaller than the paper to fill the paper.  By default, these pages are not scaled.

       -noshrink
              Don't scale PDF pages which are larger than the paper.  By default, pages larger than the paper are shrunk to fit.

       -nocenter
              By default, PDF pages smaller than the paper (after any scaling) are centered on the paper.  This option causes them to be aligned to the lower-left corner of the paper instead.

       -duplex
              Set the Duplex pagedevice entry in the PostScript file.  This tells duplex-capable printers to enable duplexing.

       -opw password
              Specify the owner password for the PDF file.  Providing this will bypass all security restrictions.

       -upw password
              Specify the user password for the PDF file.

       -overprint
              Enable overprinting.

       -q     Don't print any messages or errors.

       -v     Print copyright and version information.

       -h     Print usage information.  (-help and --help are equivalent.)

EXIT CODES
       The Xpdf tools use the following exit codes:

       0      No error.

       1      Error opening a PDF file.

       2      Error opening an output file.

       3      Error related to PDF permissions.

       99     Other error.

AUTHOR
       The pdftops software and documentation are copyright 1996-2011 Glyph & Cog, LLC.

SEE ALSO
       pdfdetach(1), pdffonts(1), pdfimages(1), pdfinfo(1), pdftocairo(1), pdftohtml(1), pdftoppm(1), pdftotext(1)

                                                                                              15 August 2011                                                                                   pdftops(1)
