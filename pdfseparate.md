pdfseparate(1)                                                General Commands Manual                                               pdfseparate(1)

NAME
       pdfseparate - Portable Document Format (PDF) page extractor

SYNOPSIS
       pdfseparate [options] PDF-file PDF-page-pattern

DESCRIPTION
       pdfseparate extract single pages from a Portable Document Format (PDF).

       pdfseparate reads the PDF file PDF-file, extracts one or more pages, and writes one PDF file for each page to PDF-page-pattern.

       PDF-page-pattern should contain %d (or any variant respecting printf format), since %d is replaced by the page number.

       The PDF-file should not be encrypted.

OPTIONS
       -f number
              Specifies the first page to extract. If -f is omitted, extraction starts with page 1.

       -l number
              Specifies the last page to extract. If -l is omitted, extraction ends with the last page.

       -v     Print copyright and version information.

       -h     Print usage information.  (-help and --help are equivalent.)

EXAMPLE
       pdfseparate sample.pdf sample-%d.pdf

       extracts all pages from sample.pdf, if i.e. sample.pdf has 3 pages, it produces

       sample-1.pdf, sample-2.pdf, sample-3.pdf

AUTHOR
       The  pdfseparate  software  and  documentation  are  copyright  1996-2004 Glyph & Cog, LLC and copyright 2005-2011 The Poppler Developers -
       http://poppler.freedesktop.org

SEE ALSO
       pdfdetach(1), pdffonts(1), pdfimages(1), pdfinfo(1), pdftocairo(1), pdftohtml(1), pdftoppm(1), pdftops(1),  pdftotext(1)  pdfsig(1),  pdfu‐
       nite(1)

                                                                 15 September 2011                                                  pdfseparate(1)
