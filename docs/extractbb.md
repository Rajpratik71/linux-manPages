EXTRACTBB(1)                                                                             DVIPDFMx                                                                            EXTRACTBB(1)

NAME
       extractbb, ebb - extract bounding box information from graphics files

SYNOPSIS
       extractbb [-v|-q] [-O] [-m|-x] file...

DESCRIPTION
       For  each  JPEG,  PNG,  or  PDF  file given on the command line, extractbb extracts the bounding box information and writes it into a file with extension .xbb, together with some
       header information. These files can then be used by dvipdfmx or other programs. For PDF files, the number of pages and the PDF version number are reported  as  well.   The  input
       filename extension may be in upper or lower case.

       If called as ebb, the output is written in the ``bb'' format (and with extension .bb) as used by dvipdfm.  Xbb may be defined as a synomym for extractbb on your system.

OPTIONS
       -v        Be verbose.
       -q        Be quiet.
       -O        Write output to standard output.
       -m        Write output in dvipdfm's ``bb'' format.
       -x        Write output in dvipdfmx's ``xbb'' format (default), which is the same as that used by pdfTeX.

OUTPUT FORMATS
       Here are more details about the bb and xbb formats:

       The  original ebb (from dvipdfm) ignored density information in bitmap images, and generated bounding boxes with 100px = 72bp = 1in.  Unfortunately, screenshots (especially) tend
       to look bad with this approach.

       So, extractbb (from dvipdfmx) uses density information if present.  Otherwise, it generates bounding box with 100px = 100bp.  This is what pdfTeX does.

BUGS
       There is currently no way to specify which bounding box is taken for PDF files. It will always be the first one from the following  list:  ArtBox,  TrimBox,  BleedBox,  MediaBox.
       (Often only MediaBox is defined.) Moreover, the reported bounding box always refers to the first page in a PDF file.

AUTHOR
       extractbb was written by the DVIPDFMx project team <dvipdfmx@ktug.or.kr>, based on the program ebb by Mark A. Wicks.

       This  manual  page was also written by the DVIPDFMx project team, based on a manual page Frank Küster <frank@kuesterei.ch> wrote for the Debian GNU/Linux system.  It may be used,
       modified, and/or redistributed by others without contacting the authors.

20120420                                                                              20 April 2012                                                                          EXTRACTBB(1)
