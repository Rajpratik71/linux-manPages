man(1)                                                                               pdfxup man page                                                                               man(1)

NAME
       pdfxup - n-up PDF pages with reduced margins

SYNOPSIS
       pdfxup [OPTIONS] [FILE]

DESCRIPTION
       pdfxup creates a PDF document where each page is obtained by combining several pages of a PDF file given as output. The important feature of pdfxup, compared to similar programs,
       is that it tries to compute the (global) bounding box of the input PDF file, in order to remove the margins and to keep the text only. Instead of having the font size divided  by
       2  (for the case of 2-up output), in some case you may end up with almost the same font size as in the original document (as is the case for a default 'article' document produced
       by LaTeX).

       pdfxup uses ghostscript for computing the maximal bounding box of (some of) the pages of the document, and then uses pdflatex (with graphicx package) in order to produce the  new
       document.

OPTIONS
       pdfxup accepts numerous options. The most important ones are:

       -x n, --columns n
              sets the number of columns in the output file (default 2);

       -y n, --rows n
              sets the number of lines in the output file (default 1);

       -l (0|1), --landscape (0|1)
              sets orientation of paper (of final document) landscape;

       -b (0|1|le|se), --booklet (0|1|le|se)
              configure  for printing as a booklet. '1' is equivalent to 'le', which assumes that two-sided printing is in 'long-edge' mode (you turn from one page to the next along the
              long edge of the paper). 'se' is the 'short-edge' option;

       -o file, --output file
              name of output file;

       -i     ask before overwriting output file;

       -fw d, --framewidth d
              width of the frame around each page (default 0.4pt);

       -im d, --innermargins d
              inner margin between frame and page (default 5pt);

       -m d, --margins d
              margin of pages of the new document (default 5pt);

       -is d, --intspacess d
              space between different pages (default 1pt);

       -p a-b, --pages a-b
              only consider pages a to b of input document;

       -bb a-b, --pages a-b
              only consider pages a to b of input document for computing bounding box;

       -nobb a-b, --no-bb a-b
              omit pages a to b of input document from computation of bounding box;

       -g (0|1), --get-bb (0|1)
              only compute (and output) bounding box;

       -s x y W H, --set-bb x y W H
              set the bounding box to the given values;

       -d, --debug
              debug mode: keep intermediary files;

       -V [0-3], --verbose [0-3]
              select verbosity (default: 1);

       -q, --quiet
              run quietly (equiv. '-V=0')

       -v, --version
              print version number and exit;

       -h, --help
              print help message and exit.

SEE ALSO
       gs(1), pdflatex(1)

BUGS
       No known bugs.

AUTHOR
       Nicolas Markey (pdfxup@markey.fr)

1.30                                                                                  6 october 2015                                                                               man(1)
