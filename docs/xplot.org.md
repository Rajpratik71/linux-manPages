XPLOT.ORG(1)                                                BSD General Commands Manual                                               XPLOT.ORG(1)

NAME
     xplot.org — fast tool to graph and visualize lots of data

SYNOPSIS
     xplot.org [-v] [-x] [-y] [-tile] [-mono] [-1] [-d display | -display display] [-d2 display] file [files...]

DESCRIPTION
     xplot.org is a fast visualization tool for examining multiple data sets in parallel plots.  It supports easy zoom-in and zoom-out capabili‐
     ties, and synchronized views into multiple data sets (with the -x, -y, and -tile options).

OPTIONS
     -1 allows one to look at multiple data sets, one at a time.  This changes the behavior of click-right and shift-click-right from exiting and
     printing to cycling forward and backward through the various plots.

     -d display, -display display,

     -d2 display, all select which display(s) on which to draw the graphs.

     -mono causes the graph(s) to be drawn in black and white, with no use of color.

     -tile allows one to look at multiple data sets in parallel.  The plots will each consume 1/nth of the vertical space that would have been
     used with one plot.  This works well if the window manager refrains from wasting pixels with decorative tabs and respects the hints that
     xplot.org provides.

     -v prints the version number.

     -x causes several graphs to be synchronized on the X-axis (zooming in one window zooms all the others, with the same portion of the X-axis on
     display).  The Y-axis of the other graphs will be autoscaled to fit the data.

     -y causes several graphs to be synchronized on the Y-axis (zooming in one window zooms all the others, with the same portion of the Y-axis on
     display).

USE OF MOUSE BUTTONS
     When running xplot.org, the mouse may be used to zoom in and out on data.

     Dragging with the left mouse button depressed while inside the axes of the graph draws a rubber-band box around the area to be replotted in
     the existing window.

     Dragging with the left mouse button depressed while outside the axes (below the X-axis or to the left of the Y-axis) selects the range of the
     axis to plot.  In effect, this is like the previous mechanism, but only zooming on one axis.

     Dragging with the middle mouse button inside the axes pans the graph; the start-drag position ends up being at the end-drag position.  Drag‐
     ging on the axes pans only in one dimension.

     Clicking the left mouse button zooms out to the previous view.  One can zoom in multiple times, then back up through each view.  Panning
     locations are not saved.

     Clicking the right mouse button exits the program.

     Shift-clicking on the mouse buttons produces Postscript files with the same axis extents as the current view.  Shift-left produces a full-
     page view.  Shift-middle produces a squarish plot, and shift-right a plot such that three of them fit on a page of LaTeX.

PLOT LANGUAGE
     There are several example files demo.0, demo.1, demo.2, etc., stored with the xplot.org sources.  demo.0 lists all the commands.
           xplot.org demo.0
     demonstrates xplot.org's capabilities.

USE WITH TCPDUMP
     The command
           tcpdump -tt -S ... > tcpdump.out
     saves a tcpdump formatted output trace to tcpdump.out. The -tt and -S flags tell tcpdump to print an unformatted timestamp and to use abso‐
     lute TCP sequence numbers.

     This trace can then be examined by being processed with tcpdump2xplot.
           tcpdump -plot tcpdump.out

SEE ALSO
     tcpdump2xplot(1) tcpdump(8)

HISTORY
     The xplot.org command was written by Tim Shepard as a tool to use in his analysis of TCP performance while at MIT.  Some features were added
     by Andrew Heybey and Greg Troxel.

BUGS
     Some people may not like that the right mouse button exits without confirmation, although others consider it a feature that enables rapidly
     viewing hundreds of similar plots.

     Should use standard X geometry specifications.

BSD                                                               27 January 1999                                                              BSD
