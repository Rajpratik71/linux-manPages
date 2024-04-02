PDFOPEN(1)                                                                                                                                                                     PDFOPEN(1)

NAME
       pdfopen, pdfclose - open or close a PDF file viewer

SYNOPSIS
       pdfopen [ options ]  [ --file ]  file.pdf
       pdfclose [ --file ]  file.pdf

OPTIONS
       -h, --help, -?
               output help and exit.

       -v, --version, -V
               output the version number and exit.

       -p <n>, --page <n>
               when starting the viewer, display page <n> of the document (notes: not all viewers support this feature, and even in those cases this option only has effect when the doc‐
               ument is initially loaded).  This option is over-ridden by -g.

       -g <named destination>, --goto <named destination>
               when starting the viewer, display the page of the document containing the named destination (notes: not all viewers support this feature, and even  in  those  cases  this
               option only has effect when the document is initially loaded).

       -r, --reset_focus
               after sending commands to the PDF viewer, attempt to reset the input focus to the window which had focus before the commands were sent.

       -viewer, --viewer <ar9|ar9-tab|ar8|ar7|ar5|xpdf|evince>
               use  (respectively)  Adobe  Reader  9  (in  a new window), Adobe Reader 9 (in a new tab of a running AR9, if any), Adobe Reader 8, Adobe Reader 7, Adobe Reader 5, xpdf or
               evince as the PDF viewer program.  Adobe Reader 9 (in a new window) is the default.

RATIONALE
       At certain points of TeX document preparation, many people repeat a "edit-compile-view" cycle.  Since PDF viewers such as Adobe's Acrobat Reader ("acroread") do not automatically
       refresh the display when the PDF file changes, this cycle can be more cumbersome than desired.  The pdfopen program provides the ability to automate the reloading of the PDF doc‐
       ument when it is changed.

       Note: there seems to be little need for pdfclose under GNU/Linux, since (unlike the situation for MS windows) acroread does not lock the PDF file, which would prevent pdftex  (or
       a DVI to PDF converter) from creating a new version of the PDF output file.  However, pdfclose is provided in case someone finds it useful.

DESCRIPTION
       pdfopen  searches  for an instance of the specified (or default) PDF viewer displaying the specified PDF file.  If there is already an instance of the given viewer displaying the
       given file, the viewer is instructed to reload the file.  If no such instance is found, pdfopen attempts to run the specified viewer on the specified document.

       The default viewer is "acroread", which could start any one of a number of versions of Acrobat Reader, depending on what is installed on your system.  However,  the  commands  to
       reload  the  current document vary from one version of acroread to another; consequently, if you are using a version of acroread other than AR9, you should explicitly specify the
       viewer program.

       This version of pdfopen accepts the following viewer options:
       ar9, ar9-tab, ar8, ar7, ar5, xpdf, and evince.
       The difference between ar9 and ar9-tab is significant when there is no instance of AR9 already displaying the requested document.  In  this  situation,  while  ar9  will  request
       acroread  to  create  a new instance of acroread (and thus open a new window) by using the -openInNewInstance argument, ar9-tab starts acroread without this argument; if there is
       already an instance of acroread running, a new tab will be opened in an existing window.

       pdfclose searches for one of the above PDF viewers displaying the given file and instructs the viewer to "close" the window.  In most cases, the PDF viewer continues to run, pos‐
       sibly now displaying just a blank window.  (This behaviour varies somewhat from one PDF viewer to another.)

PORTABILITY AND AVAILABILITY
       These  programs have been tested on Slackware64 Version 14.1 and a few other versions / distributions of GNU/Linux.  The code is reasonably generic and should work out of the box
       using most recent X11 implementations.  (Reports to the contrary are welcome, particularly if they come with robust fixes.)

       These programs are designed for X11-based systems.  If you somehow find compiled versions of these programs on a system using another window system, they are very unlikely to  be
       of any use to you.

       Source and binaries of the programs can be downloaded from CTAN://support/xpdfopen/ (e.g., http://mirror.ctan.org/support/xpdfopen).

CAVEATS
       If  you  use ar9-tab to reload the PDF document and the instance of acroread with the given document is currently displaying some other document, the command causes your document
       to be displayed, but not reloaded.

       pdfopen works by looking for a window with a name (window title) matching that expected for the given viewer and document.  If for some reason your viewer's window name is not as
       expected, pdfopen may not work for you.

       With  at least AR9 and some window managers, using pdfopen to reload the document gives focus to the acroread window, even though the mouse cursor is not necessarily in that win‐
       dow.  This can be annoying.  The -reset_focus option can be used to deal with this problem.

AUTHOR
       This manual page was written by Jim Diamond <Jim.Diamond@acadiau.ca>.  I am the current maintainer of the X11 versions of pdfopen and pdfclose.  Report any bugs you find  to  me.
       Feature enhancement requests are welcome, coded enhancements even more so.

       Past  authors:  Fabrice Popineau wrote the MS-windows versions of pdfopen and pdfclose upon which these programs were originally based.  Taco Hoekwater created the GNU/Linux ver‐
       sions, up to Version 0.61 (including some documentation which inspired parts of this man page).  Peter Breitenlohner has contributed both code and suggestions to  versions  later
       than 0.61.

pdfopen 0.86                                                                            2014-05-24                                                                             PDFOPEN(1)
