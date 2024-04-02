XPL2GPL(1)                                                    General Commands Manual                                                   XPL2GPL(1)

NAME
       xpl2gpl - Convert tcptrace-style xplot input to gnuplot input.

SYNOPSIS
       xpl2gpl [-s] <file_name>

DESCRIPTION
       xpl2gpl  is a utility that converters tcptrace-style xplot input to gnuplot input.  This converter gives a nearly perfect gnuplot reproduc‐
       tion of the corresponding xplot graph.

OPTIONS
       -s     Seperate files.  If you wish to plot only some data from the xpl file, you may use the -s option, which generates a bunch  of  data-
              files filtered based on the color and plotting style.

EXAMPLES
       xpl2gpl foo.xpl

       This  would  produce files by the names "foo.gpl", "foo.datasets" and "foo.labels".  Load the file "file_name.gpl" in gnuplot and it should
       give you the plot.

NOTES
       xpl2gpl is provided for convenience, as gnuplot is more commonly installed than the xplot package  that  tcptrace  typically  expects,  and
       because xplot has not always been available in Debian. If possible, you should consider installing the xplot-xplot.org package and using it
       instead of using xpl2gpl.

AUTHOR
       Avinash Lakhiani (no known email address)

       This manual page was written by Noah Meyerhans <noahm@debian.org> for the Debian project and may be used freely and without restriction  by
       others.

SEE ALSO
       tcptrace(1)

                                                                    Aug 8, 2009                                                         XPL2GPL(1)
