pdffonts(1)                                                                             General Commands Manual                                                                            pdffonts(1)

NAME
       pdffonts - Portable Document Format (PDF) font analyzer (version 3.03)

SYNOPSIS
       pdffonts [options] [PDF-file]

DESCRIPTION
       Pdffonts lists the fonts used in a Portable Document Format (PDF) file along with various information for each font.

       The following information is listed for each font:

       name   the font name, exactly as given in the PDF file (potentially including a subset prefix)

       type   the font type -- see below for details

       encoding
              the font encoding

       emb    "yes" if the font is embedded in the PDF file

       sub    "yes" if the font is a subset

       uni    "yes" if there is an explicit "ToUnicode" map in the PDF file (the absence of a ToUnicode map doesn't necessarily mean that the text can't be converted to Unicode)

       object ID
              the font dictionary object ID (number and generation)

       PDF files can contain the following types of fonts:

              Type 1
              Type 1C -- aka Compact Font Format (CFF)
              Type 3
              TrueType
              CID Type 0 -- 16-bit font with no specified type
              CID Type 0C -- 16-bit PostScript CFF font
              CID TrueType -- 16-bit TrueType font

OPTIONS
       -f number
              Specifies the first page to analyze.

       -l number
              Specifies the last page to analyze.

       -subst List the substitute fonts that poppler will use for non embedded fonts.

       -opw password
              Specify the owner password for the PDF file.  Providing this will bypass all security restrictions.

       -upw password
              Specify the user password for the PDF file.

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
       The pdffonts software and documentation are copyright 1996-2011 Glyph & Cog, LLC.

SEE ALSO
       pdfdetach(1), pdfimages(1), pdfinfo(1), pdftocairo(1), pdftohtml(1), pdftoppm(1), pdftops(1), pdftotext(1) pdfseparate(1), pdfsig(1), pdfunite(1)

                                                                                            15 August 2011                                                                                 pdffonts(1)
