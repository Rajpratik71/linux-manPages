fig2mpdf(1)                                         Including xfig figures into LaTeX documents                                        fig2mpdf(1)

NAME
       fig2mpdf - creation of multilayer pdf or eps figures from fig files using latex for typesetting

SYNOPSIS
       fig2mpdf [OPTION]... FILE

DESCRIPTION
       This  tool  can create pdf or eps figures using fig files as source. For beamer presentations, for example, you can use the multilayer mode
       to create multiple figures that can be overlayed to get a dynamic figure. For proper appearance you can use latex to typeset  some  or  all
       texts, possibly containing formulas.

       The default interpretation of the given fig FILE depends on its suffix.

       fig    Normal  conversion  of  a fig file. All texts are interpreted as postscript texts and all elements of the figure are included in the
              resulting figure.

       lfig   LaTeX interpretation of the file. All texts of the input file that have the special bit set are  typeset  by  pdflatex  resp.  latex
              (see: Option -|+l).

       mfig   Multilayer  file interpretation. Depending on the used depths of the figure it is split into multiple parts. For each part an output
              file is created (see: section MultiLayerOutput).

       mlfig or lmfig
              Combination of multilayer and LaTeX interpretation of the input (see: Suffix lfig and mfig).

       The default interpretation of the input can be changed by using the options below.

OPTIONS
       -e     produce an eps output file. Instead of creating a pdf file (the default) an eps figure is produced.

       -|+l   force calling (pdf)latex (-) or do not use (pdf)latex (+) for typesetting the text marked with the special flag.  With  this  option
              you can change the default behavior given by the input file suffix.

       -|+m   force  set  (-)  or unset (+) the multilayer interpretation (see: MultiLayerOutput below) which was previously set by the input file
              suffix.

       -p ranges
              explicitly set the ranges of depths for splitting the input figure in multilayer mode. ranges is a colon separated list of ranges of
              the  form  upper-lower or depth where upper  is the top and lower the bottom depth in the range. If you use the depth form the range
              consist of just that depth.

       -i     include the the bottommost range (that is, the one with the highest depth) into all output figures. This  is  for  compatibility  to
              older versions of this tool.

       -I     turn on pyramid mode. The figure of a corresponding range in multilayer mode includes all lower ranges too.

       -g gapwidth
              set the allowed gapwidth between two used depths to decide if these depths should be grouped together in one range. With this option
              you get more flexibility to insert objects with new depths. The default width is zero (no gap = consecutively  numbered  depths  are
              grouped together).

       -s style
              replace the default style for selecting a font family in LaTeX mode.  If this option is omitted the style `times' is set by default.

       -H header
              replace the default header sequence for creating temporary LaTeX documents in LaTeX mode. To get maximum flexibility you can set the
              entire document header in the file header (see: Customized Headers  below).

       -G     in multilayer mode change the default output file pattern to the PDF format which is  <name>.page<no>.<ext>

       -v     be verbose and print out all executed commands

       -V     print out the version of fig2mpdf

MultiLayerOutput
       In xfig you can assign an individual depth to all objects of the figure. These depths are normally used to determine the order of  printing
       the  objects.  fig2mpdf uses these depths to group the objects into ranges in automatic mode (if the ranges option is omitted). In the list
       of used depths, consecutively numbered depths are grouped into one range. That is, all gaps between used depths are used to logically split
       the figure. With -g you can set the gapwidth which doesn't split the figure (default: zero).

       The  resulting list of ranges determines the number of output files. In default mode all objects with depths assigned to one range are col‐
       lected and put into the corresponding output file. The contents of the output files can be changed with the two Options -i and -I.

       The -i option reduces the number of output files by one. The bottommost range, that is the range which consist of the highest depths of the
       figure, is included into all output files.

       In pyramid mode, activated by the option -I, the output files contain additionally all lower ranges. With this mode you can get stand alone
       figures that don't have to be overlayed to have meaningful content.

       Example 1
       Assume that you have a fig file foo.fig which contains the three ranges 230-233, 455-460 and 499-500.

       With no options set you get three output files, one per range. But if you set the -i option you get the following two files where the  bot‐
       tommost range is included in both of the files:
         foo-0.pdf with ranges 455-460 and 499-500
         foo-1.pdf with ranges 230-233 and 499-500.

       Example 2
       The pyramid mode, activated by the option -I, will produce the following files from the source file of Example 1:
         foo-0.pdf with ranges 499-500
         foo-1.pdf with ranges 455-460 and 499-500
         foo-2.pdf with ranges 230-233, 455-460 and 499-500.

       Example 3
       If both options are set you will get just two files with the following contents:
         foo-0.pdf with ranges 455-460 and 499-500
         foo-1.pdf with ranges 230-233, 455-460 and 499-500.

Customized Headers
       For  various  reasons you might want to change the standard latex generation, e.g., if you want to change the default font family. The fol‐
       lowing example represents a valid header file.

       The usage of this example file changes the font family to sans serif and adds an additional search path for includegraphics  to  the  `fig‐
       ures' subdirectory.

         \documentclass{article}
         \usepackage{german,amssymb,amsmath}
         \renewcommand{\familydefault}{\sfdefault}
         \AtBeginDocument{\graphicspath{{figures/}}}

       The following packages are generally used: color, graphicx and epsfig.

Tex errors
       Sometimes  it  might happen that latex generates an error while processing your special texts. To keep you informed about the occurrence of
       that error and about what has happened, in this case the log file is shown by invoking a less command.

Files
       In single layer mode for the resulting files the suffix fig is replaced by pdf (resp. eps) (i.e. foo.fig -> foo.pdf).

       In multilayer mode the base name of the source fig files is extended by '-<range>' and the suffix is set to pdf (resp. eps).
       (i.e., foo.fig -> foo-0.pdf, foo-1.pdf, foo-2.pdf,  ...
           or foo.fig -> foo.page0.pdf, foo.page1.pdf, foo.page2.pdf, ...
              if the option -G is set).

SEE ALSO
       xfig(1) fig2dev(1) gawk(1) pdflatex(1) latex(1) dvips(1)

                                                                     Jun 2006                                                          fig2mpdf(1)
