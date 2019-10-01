thumbpdf(1)                                                                                         teTeX                                                                                         thumbpdf(1)



NAME
       thumbpdf - generate thumbnail images for a PDF file created with pdftex

SYNOPSIS
       thumbpdf [ OPTION... ]  PDF_FILE

DESCRIPTION
       thumbpdf is used to create thumbnail images of individual pages within a PDF (Portable Document Format) document.

USAGE
       First run pdftex(1) on your document to create a PDF file.  Then run thumbpdf to generate the thumbnails, a PDF file containing the thumbnails, and a pdfTeX file to include the thumbnails in the PDF
       file.  Finally, run pdftex(1) on your file again to create the final PDF file.

       thumbpdf calls gs(1) to generate PNG images of the pages within PDF_FILE, and pdftex(1) to create a PDF file containing the thumbnail images.

OPTIONS
       --help print usage

       --(no)makepng
              make PNG thumbnail images (default: true)

       --(no)makepdf
              generate new PDF file containing the thumbnails (default: true)

       --(no)makedef
              create a TeX file for pdftex(1) to read in (default: true)

       --(no)quiet
              suppress messages (default: false)

       --(no)verbose
              verbose messages (default: false)

       --(no)debug
              print debugging information while parsing (default: false)

       --resolution res
              resolution for GhostScript step (default: 9)

       --compress n
              \pdfcompresslevel for thumbpdf.pdf (0-9; default: 9)

       --device | pngdev
              GhostScript PNG device; dev = `mono´, `gray´, `16´, `256´, `16m´ (default: `png16m´)

FILES
       thumbnn.png
              PNG thumbnail images

       thumbpdf.pdf
              PDF file containing thumbnail images

       thumbpdf.tex
              A pdfTeX program to include the thumbnails file

       thumbpdf.log
              pdfTeX log file

       thumbpdf.sty
              a LaTeX package to be included in files for which a user wants to generate thumbnails

SEE ALSO
       gs(1), pdftex(1).

       Web page: <http://tug.org/teTeX/>

BUGS
       None known, but report any bugs found to the author.

COPYRIGHT
       Copyright © 1999.  thumbpdf is distributed under version 1, or (at your option) a later version of the LaTeX Project Public License.

AUTHOR
       thumbpdf was written by Heiko Oberdiek <oberdiek@ruf.uni-freiburg.de>.

       This manual page was written by C.M. Connelly <c@eskimo.com>, for the Debian GNU/Linux system.  It may be used by other distributions without contacting the author.  Any mistakes or omissions in the
       manual page are my fault; inquiries about or corrections to this manual page should be directed to me (and not to the primary author).



teTeX                                                                                           September 2000                                                                                    thumbpdf(1)
