TEXDIFF(1)                                                                 User Contributed Perl Documentation                                                                 TEXDIFF(1)

NAME
       texdiff - Compares two (La)TeX documents to create a merged version showing changes, similar to that of 'Change Tracking' in some word processors.

SYNOPSIS
       texdiff [--nofloats⎪-n] old.tex new.tex [diff.tex]

DESCRIPTION
       The first two files are compared and a new TeX file is output. When the output file is processed with (La)TeX it marks new changes with blue and old text with red with a strike-
       through line. Furthermore, passages with changes are marked at the margin with grey bars by the LaTeX "changebar" package (although only after running "dvips", in "xdvi" the bars
       are one inch too far left to compensate the one inch offset inserted by TeX printer drivers).

       "texdiff" uses and therefore requires the "wdiff" command to insert these marks. If LaTeX macros are included in those striked out or underlined passages, the latex run will most
       likely fail. The source of most problems lies in "wdiff" tearing apart pairs of braces. Therefore "texdiff" is a perl script that calls "wdiff" internally and fixes "wdiff"'s
       output by re-pairing braces again and handling some commonly used LaTeX macros.

       For texdiff to work, the following LaTeX code must be inserted in the preamble of the LaTeX document:

        \usepackage{xcolor} \usepackage{ulem} \usepackage{changebar}
        \newcommand\TLSins[1]{\cbstart{}\textcolor{ins}{\uline{#1}}\cbend{}}
        \newcommand\TLSdel[1]{\cbdelete{}\textcolor{del}{\sout{#1}}}

       Define editing colors "ins" and "del" with existing "xcolor" color names:
        \colorlet{ins}{blue} \colorlet{del}{red}

       Or from scratch:
        \definecolor{ins}{rgb}{0, 0.5, 0}

       These macros are NOT automatically interted at \begin{document} like the original scripts did (see the ACKNOWLEDGMENTS section below), because this will not work on files of a
       multi-file document (those included by \include or \input).  Furthermore, if you insert the macros manually, you can tune them as you like, i. e. change text color or position of
       changebars. Have a look at the documentation of the ulem and changebar packages on how to do this!

OPTIONS
       --nofloats, -n
           If given, skips contents of figure environments, but does show insertions and deletions in the caption commands. This is done to avoid complex messups in subfloat or complex
           figure environments.

       --debug, -d
           Turns on debugging. Temporary files that contain numbered braces are kept and a raw difference file is written as output file name appended with '-wdiff.tex'. In addition,
           several regular expression diagnostics are printed. Warning: produces a lot of output.

AUTHOR
       Mark Doll <markdoll<AT>gmx.net>, Cengiz Gunay <cengique<AT>users.sf.net>.

ACKNOWLEDGMENTS
       *   Version 0.4, by CG, 2009/09/15. Added use of GetOpt to take an optional parameter to skip float (e.g., figure or table) contents. Added an optional debug mode. Embedded POD
           documentation. Fixed problem with insertion and deletions appearing in the middle of sectioning commands by throwing off LaTeX.

       *   Version 0.3, modified by Cengiz Gunay <cengique@users.sf.net>, 2009/06/30. Added some Latex commands that should be excluded and fixed handling of '\%' characters.

       *   Version 0.2, is a perl implementation of TeXdiff by Mark Doll <markdoll@gmx.net>, 2006/08/09. It was derived from the original bash and perl scripts created by Robert Maron
           <robmar@mimuw.edu.pl>, available at http://www.robmar.net/TexDiff/. This version of texdiff is available at http://mark.doll.name/texdiff/.

COPYRIGHT AND LICENSE
       Copyleft 2006-2009, Mark Doll and Cengiz Gunay

       This library is free software; you may redistribute it and/or modify it under the same terms as Perl itself.

perl v5.8.8                                                                             2009-09-24                                                                             TEXDIFF(1)
