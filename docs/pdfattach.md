pdfattach(1)                            General Commands Manual                           pdfattach(1)

NAME
       pdfattach - Portable Document Format (PDF) document embedded file creator (version 3.03)

SYNOPSIS
       pdfattach [options] input-PDF-file file-to-attach output-PDF-file

DESCRIPTION
       Pdfattach  adds  a new embedded file (attachment) to an existing Portable Document Format (PDF)
       file.

OPTIONS
       -replace
              Replace embedded file with same name (if it exists)

       -v     Print copyright and version information.

       -h     Print usage information.  (-help and --help are equivalent.)

EXIT CODES
       0      No error.

       1      Error opening input PDF file.

       2      Error opening file to attach.

       3      Output file already exists.

       3      There is already an attached file with that name.

       5      Error saving the output file.

AUTHOR
       The pdfattach software and documentation are copyright 2019 The Poppler developers

SEE ALSO
       pdfdetach(1), pdfimages(1), pdfinfo(1), pdftocairo(1), pdftohtml(1),  pdftoppm(1),  pdftops(1),
       pdftotext(1) pdfseparate(1), pdfsig(1), pdfunite(1)

                                            10 Febuary 2019                               pdfattach(1)
