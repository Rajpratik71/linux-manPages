pdftocairo(1)                           General Commands Manual                          pdftocairo(1)

NAME
       pdftocairo - Portable Document Format (PDF) to PNG/JPEG/TIFF/PDF/PS/EPS/SVG using cairo

SYNOPSIS
       pdftocairo [options] PDF-file [output-file]

DESCRIPTION
       pdftocairo  converts Portable Document Format (PDF) files, using the cairo output device of the
       poppler PDF library, to any of the following output formats:

       •      Portable Network Graphics (PNG)

       •      JPEG Interchange Format (JPEG)

       •      Tagged Image File Format (TIFF)

       •      Portable Document Format (PDF)

       •      PostScript (PS)

       •      Encapsulated PostScript (EPS)

       •      Scalable Vector Graphics (SVG)

       •      Windows Printer

       pdftocairo reads the PDF file, PDF-file, and writes to output-file.  The  image  formats  (PNG,
       JPEG,  and TIFF) generate one file per page with the page number and file type appended to out‐
       put-file.  When -singlefile is used with the image formats, the file type is appended  to  out‐
       put-file.   When  the  output format is a vector format (PDF, PS, EPS, and SVG), output-file is
       the full filename.

       If the PDF-file is “-” , the PDF is read from stdin.  If the output-file is “-”  ,  the  output
       file will be written to stdout. Using stdout is not valid with image formats unless -singlefile
       is used.  If output-file is not used, the output filename will be  derived  from  the  PDF-file
       filename.

       Not  all options are valid with all output formats. One (and only one) of the output format op‐
       tions (-png, -jpeg, -tiff, -pdf, -print, -ps, -eps, or -svg) must be used.

       The resolution options (-r, -rx, -ry) set the resolution of the image output formats. The image
       dimensions will depend on the PDF page size and the resolution. For the vector outputs, regions
       of the page that can not be represented natively in the output format (eg translucency  in  PS)
       will be rasterized at the resolution specified by the resolution options.

       The  -scale-to  options  may  be used to set a fixed image size. The image resolution will vary
       with the page size.

       The cropping options (-x, -y, -W, and -H) use units of pixels with the image formats and  Post‐
       Script points (1/72 inch) with the vector formats. When cropping is used with vector output the
       cropped region is centered unless -nocenter is used in which case the cropped region is at  the
       top left (SVG) or bottom left (PDF, PS, EPS).

OPTIONS
       -png   Generates a PNG file(s)

       -jpeg  Generates a JPEG file(s). See also -jpegopt.

       -tiff  Generates a TIFF file(s)

       -pdf   Generates a PDF file

       -ps    Generate a PS file

       -eps   Generate  an  EPS  file.  An EPS file contains a single image, so if you use this option
              with a multi-page PDF file, you must use -f and -l to specify a single page.   The  page
              size  options  (-origpagesizes,  -paper, -paperw, -paperh) can not be used with this op‐
              tion.

       -svg   Generate a SVG (Scalable Vector Graphics) file

       -print (Windows only) Prints to a system printer. See also -printer and -printeropt.
               If an output file is not specified, the output will be sent to the printer.
               The output file '-' can not be used with this option.

       -printdlg
              (Windows only) Prints to a system printer. Displays the print dialog to allow the  print
              options to be modified before printing.

       -f number
              Specifies the first page to convert.

       -l number
              Specifies the last page to convert.

       -o     Generates only the odd numbered pages.

       -e     Generates only the even numbered pages.

       -singlefile
              Writes only the first page and does not add digits.

       -r number
              Specifies  the  X and Y resolution, in pixels per inch of image files (or rasterized re‐
              gions in vector output). The default is 150 PPI.

       -rx number
              Specifies the X resolution, in pixels per inch of image files (or rasterized regions  in
              vector output). The default is 150 PPI.

       -ry number
              Specifies  the Y resolution, in pixels per inch of image files (or rasterized regions in
              vector output). The default is 150 PPI.

       -scale-to number
              Scales the long side of each page (width for landscape pages, height for portrait pages)
              to  fit  in scale-to pixels. The size of the short side will be determined by the aspect
              ratio of the page (PNG/JPEG/TIFF only).

       -scale-to-x number
              Scales each page horizontally to fit in scale-to-x pixels. If scale-to-y is set  to  -1,
              the vertical size will determined by the aspect ratio of the page (PNG/JPEG/TIFF only).

       -scale-to-y number
              Scales each page vertically to fit in scale-to-y pixels. If scale-to-x is set to -1, the
              horizontal size will determined by the aspect ratio of the page (PNG/JPEG/TIFF only).

       -x number
              Specifies the x-coordinate of the crop area top left corner in pixels (image output)  or
              points (vector output)

       -y number
              Specifies  the y-coordinate of the crop area top left corner in pixels (image output) or
              points (vector output)

       -W number
              Specifies the width of crop area in pixels (image  output)  or  points  (vector  output)
              (default is 0)

       -H number
              Specifies  the  height  of  crop area in pixels (image output) or points (vector output)
              (default is 0)

       -sz number
              Specifies the size of crop square in pixels (image output)  or  points  (vector  output)
              (sets -W and -H)

       -cropbox
              Uses the crop box rather than media box when generating the files (PNG/JPEG/TIFF only)

       -mono  Generate a monochrome file (PNG and TIFF only).

       -gray  Generate a grayscale file (PNG, JPEG, and TIFF only).

       -antialias
              Set  the  cairo antialias option used for text and drawing in image files (or rasterized
              regions in vector output). The options are:

              default
                     Use the default antialiasing for the target device. This is the  default  setting
                     if -antialias is not used.

              none   Antialiasing is disabled.

              gray   Perform single-color antialiasing using shades of gray.

              subpixel
                     Perform antialiasing by taking advantage of the order of subpixel elements on de‐
                     vices such as LCD.

              fast   Hint that the backend should perform some  antialiasing  but  prefer  speed  over
                     quality.

              good   The backend should balance quality against performance.

              best   Hint  that the backend should render at the highest quality, sacrificing speed if
                     necessary.

       -transp
              Use a transparent page color instead of white (PNG and TIFF only).

       -icc icc-file
              Use the specified ICC file as the output profile (PNG only). The profile will be  embed‐
              ded in the PNG file.

       -jpegopt jpeg-options
              When  used with -jpeg, takes a list of options to control the jpeg compression. See JPEG
              OPTIONS for the available options.

       -level2
              Generate Level 2 PostScript (PS only).

       -level3
              Generate Level 3 PostScript (PS only). This enables all Level 2  features  plus  shading
              patterns and masked images. This is the default setting.

       -origpagesizes
              This option is the same as "-paper match".

       -paper size
              Set  the  paper size to one of "letter", "legal", "A4", or "A3" (PS,PDF,SVG only).  This
              can also be set to "match", which will set the paper size of each page to match the size
              specified in the PDF file. If none the -paper, -paperw, or -paperh options are specified
              the default is to match the paper size.

       -paperw size
              Set the paper width, in points (PS,PDF,SVG only).

       -paperh size
              Set the paper height, in points (PS,PDF,SVG only).

       -nocrop
              By default, printing output is cropped to the CropBox specified in the PDF  file.   This
              option disables cropping (PS,PDF,SVG only).

       -expand
              Expand  PDF  pages  smaller  than the paper to fill the paper (PS,PDF,SVG only).  By de‐
              fault, these pages are not scaled.

       -noshrink
              Don't scale PDF pages which are larger than the paper (PS,PDF,SVG  only).   By  default,
              pages larger than the paper are shrunk to fit.

       -nocenter
              By default, PDF pages smaller than the paper (after any scaling) are centered on the pa‐
              per.  This option causes them to be aligned to the lower-left corner of  the  paper  in‐
              stead (PS,PDF,SVG only).

       -duplex
              Adds the %%IncludeFeature: *Duplex DuplexNoTumble DSC comment to the PostScript file (PS
              only).  This tells the print manager to enable duplexing.

       -printer printer-name
              (Windows only). When used with -print, specifies the name of the printer to be used, in‐
              stead of the system default.

       -printopt printer-options
              (Windows  only).  When used with -print, takes a list of options to be used to configure
              the printer. See WINDOWS PRINTER OPTIONS for the available options.

       -setupdlg
              (Windows only). When used with -print, the printer properties dialog is displayed allow‐
              ing  the  print  settings to be modified before printing. The paper size selected in the
              print properties dialog will be used except when -origpagesizes is specified.

       -opw password
              Specify the owner password for the PDF file.  Providing this will  bypass  all  security
              restrictions.

       -upw password
              Specify the user password for the PDF file.

       -q     Don't print any messages or errors.

       -v     Print copyright and version information.

       -h     Print usage information.  (-help and --help are equivalent.)

EXIT CODES
       The poppler tools use the following exit codes:

       0      No error.

       1      Error opening a PDF file.

       2      Error opening an output file.

       3      Error related to PDF permissions.

       4      Error related to ICC profile.

       99     Other error.

JPEG OPTIONS
       When  JPEG output is specified, the -jpegopt option can be used to control the JPEG compression
       parameters.  It takes a string of the form "<opt>=<val>[,<opt>=<val>]". Currently the available
       options are:

       quality
              Selects the JPEG quality value. The value must be an integer between 0 and 100.

       progressive
              Select progressive JPEG output. The possible values are "y", "n", indicating progressive
              (yes) or non-progressive (no), respectively.

       optimize
              Sets whether to compute optimal Huffman coding tables for the JPEG  output,  which  will
              create smaller files but make an extra pass over the data. The value must be "y" or "n",
              with "y" performing optimization, otherwise the default Huffman tables are used.

WINDOWS PRINTER OPTIONS
       In Windows, you can use the -print option to print directly to a system printer.  Additionally,
       you  can  use  the  -printopt  option  to  configure the printer. It takes a string of the form
       "<opt>=<val>[,<opt>=<val>]". Currently the available options are:

       source Selects the source paper tray to be used (bin). The possible values are "upper",  "only‐
              one",   "lower",   "middle",   "manual",  "envelope",  "envmanual",  "auto",  "tractor",
              "smallfmt", "largefmt", "largecapacity", "formsource", or a numeric value  to  choose  a
              driver specific source.

       duplex Sets  the  duplex mode of the printer. The possible values are "off", "short" or "long",
              indicating no duplexing, short-edge binding, or long-edge binding,  respectively.   Gen‐
              eral  option  -duplex  is  a  synonym  of  "duplex=long". If both options are specified,
              -printopt has priority.

AUTHOR
       The pdftocairo software and documentation are copyright 1996-2004 Glyph & Cog,  LLC  and  copy‐
       right 2005-2011 The Poppler Developers.

SEE ALSO
       pdfdetach(1),  pdffonts(1),  pdfimages(1),  pdfinfo(1),  pdftohtml(1), pdftoppm(1), pdftops(1),
       pdftotext(1) pdfseparate(1), pdfsig(1), pdfunite(1)

                                                                                         pdftocairo(1)
