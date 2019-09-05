pdfjam(1)                                                                                                                                                                       pdfjam(1)

NAME
       pdfjam - A shell script for manipulating PDF files

SYNOPSIS
       pdfjam [OPTION [OPTION] ...] [SRC [PAGESPEC] [SRC [PAGESPEC]] ...]

DESCRIPTION
       pdfjam  provides a front end to most capabilities of the "pdfpages" package (by Andreas Matthias) of pdflatex.  Detailed information can be found via "pdfjam --help", and also in
       the web page mentioned below .

       A working installation of pdflatex, with the pdfpages package, is required.

       The pdfjam script is distributed as (the main) part of the PDFjam package.  The homepage of PDFjam is at http://go.warwick.ac.uk/pdfjam .

SETUP
       See http://go.warwick.ac.uk/pdfjam .

       For further information and some examples see http://go.warwick.ac.uk/pdfjam .

CONFIGURATION FILES
       Configuration of the PDFjam utilities involves specifying the location of pdflatex, the location of temporary files, specification of default page size, etc.  This is done  in  a
       block  of  lines  near  the  top  of  the  pdfjam  script;  settings  made  there  are  over-ridden  by any that are found at a site-wide configuration file (at /etc/pdfjam.conf,
       /usr/share/etc/pdfjam.conf, /usr/local/share/pdfjam.conf, or /usr/local/etc/pdfjam.conf), which in turn are over-ridden by any that are found in a user-defaults file  at  ~/.pdf‐
       jam.conf.

LIMITATIONS AND BUGS
       pdfjam does not work with encrypted PDF files, and does not preserve hyperlinks.

       Please report bugs! See the website at http://go.warwick.ac.uk/pdfjam .

LICENSE
       PDFjam is distributed under the GNU public license.

AUTHOR
       The PDFjam package is written and maintained by David Firth.

                                                                                      10 March 2010                                                                             pdfjam(1)
