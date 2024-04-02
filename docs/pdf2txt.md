PDF2TXT(1)                                                        PDFMiner Manual                                                       PDF2TXT(1)

NAME
       pdf2txt - extracts text contents of PDF files

SYNOPSIS
       pdf2txt [option...] file...

DESCRIPTION
       pdf2txt extracts text contents from a PDF file. It extracts all the text that is to be rendered programmatically, i.e. text represented as
       ASCII or Unicode strings. It cannot recognize text drawn as images that would require optical character recognition. It also extracts the
       corresponding locations, font names, font sizes, writing direction (horizontal or vertical) for each text portion. You need to provide a
       password for protected PDF documents when its access is restricted. You cannot extract any text from a PDF document which does not have
       extraction permission.

OPTIONS
       -o file
           Specifies the output file name. The default is to print the extracted contents to standand output in text format.

       -p pageno[,pageno,...]
           Specifies the comma-separated list of the page numbers to be extracted. Page numbers start at one. By default, it extracts text from
           all the pages.

       -c codec
           Specifies the output codec.

       -t type
           Specifies the output format. The following formats are currently supported:

           text
               Text format. This is the default.

           html
               HTML format. It is not recommended.

           xml
               XML format. It provides the most information.

           tag
               “Tagged PDF” format. A tagged PDF has its own contents annotated with HTML-like tags.  pdf2txt tries to extract its content streams
               rather than inferring its text locations. Tags used here are defined in the PDF Reference, Sixth Edition[1] (§10.7 “Tagged PDF”).

       -D writing-mode
           Specifies the writing mode of text outputs:

           lr-tb
               Left-to-right, top-to-bottom.

           tb-rl
               Top-to-bottom, right-to-left.

           auto
               Determine writing mode automatically

       -M char-margin, -L line-margin, -W word-margin
           These are the parameters used for layout analysis. In an actual PDF file, text portions might be split into several chunks in the
           middle of its running, depending on the authoring software. Therefore, text extraction needs to splice text chunks. In the figure
           below, two text chunks whose distance is closer than the char-margin is considered continuous and get grouped into one. Also, two lines
           whose distance is closer than the line-margin is grouped as a text box, which is a rectangular area that contains a “cluster” of text
           portions. Furthermore, it may be required to insert blank characters (spaces) as necessary if the distance between two words is greater
           than the word-margin, as a blank between words might not be represented as a space, but indicated by the positioning of each word.

           Each value is specified not as an actual length, but as a proportion of the length to the size of each character in question. The
           default values are char-margin = 1.0, line-margin = 0.3, and W = 0.2, respectively.

       -n
           Suppress layout analysis.

       -A
           Force layout analysis for all the text strings, including text contained in figures.

       -V
           Enable detection of vertical writing.

       -s scale
           Specifies the output scale. This option can be used in HTML format only.

       -m n
           Specifies the maximum number of pages to extract. By default, all the pages in a document are extracted.

       -P password
           Provides the user password to access PDF contents.

       -d
           Increase the debug level.

EXAMPLES
       Extract text as an HTML file whose filename is output.html:

           $ pdf2txt -o output.html samples/naacl06-shinyama.pdf

       Extract a Japanese HTML file in vertical writing:

           $ pdf2txt -c euc-jp -D tb-rl -o output.html samples/jo.pdf

       Extract text from an encrypted PDF file:

           $ pdf2txt -P mypassword -o output.txt secret.pdf

SEE ALSO
       dumppdf(1)

AUTHORS
       Jakub Wilk <jwilk@debian.org>
           Wrote this manual page for the Debian system.

       Yusuke Shinyama <yusuke@cs.nyu.edu>
           Author of PDFMiner and its original HTML documentation.

NOTES
        1. PDF Reference, Sixth Edition
           http://www.adobe.com/devnet/acrobat/pdfs/pdf_reference_1-7.pdf

pdf2txt                                                             11/05/2015                                                          PDF2TXT(1)
