ps2frag(1)                                                                       General Commands Manual                                                                       ps2frag(1)

NAME
       ps2frag - obsolete shell script for the PSfrag system.

IMPORTANT NOTICE
       The new PSfrag system no longer requires the ps2frag script; instead, it handles the processing entirely within TeX/LaTeX and DVIPS. I'm sure you will agree that never needing to
       run ps2frag again is a nice convenience!

       However, there are two significant differences in the way this new version of PSfrag works. Please make yourself aware of them:

       1) XDvi is no longer able to determine where your PSfrag replacements should go, so instead it lines them up in a vertical list to the left of the figure. This allows you to con‐
       firm  that  they  have been typeset properly, at least. However, to confirm that PSfrag positions your replacements properly, you will have to view the PostScript version of your
       file with a viewer like GhostView, or print it out.  This seems to be the only disadvantage to the elimination of the pre-processing step.

       2) If you embed '\tex' commands inside your figures, you now need to explicitly _tell_ PSfrag to process these commands. To do so,  use  \usepackage[scanall]{psfrag}  instead  of
       \usepackage{psfrag} at the beginning of your LaTeX file.

       If  you  only  use  '\tex'  commands  in  a small number of figures, then a more efficient might be to turn on '\tex'-scanning only for those figures. To do that, add the command
       '\psfragscanon' immediately before each relevant \includegraphics or \epsfbox command.

NOTES
       See the PSfrag documentation for further information.

SEE ALSO
       dvips(1), gs(1), ghostview(1), latex(1)

AUTHORS
       psfrag@rascals.stanford.edu
              The PSfrag maintainer's mailing list.

TeXware                                                                                   Feb 95                                                                               ps2frag(1)
