GFTODVI(1)                                                                                 General Commands Manual                                                                                 GFTODVI(1)



NAME
       gftodvi - make proof sheets from generic font files

SYNOPSIS
       gftodvi [-overflow-label-offset=real] [-verbose] gf_file_name

DESCRIPTION
       This manual page is not meant to be exhaustive.  The complete documentation for this version of TeX can be found in the info file or manual Web2C: A TeX implementation.

       The  gftodvi program converts a generic font (gf) file output by, for example, mf(1), to a device independent (DVI) file (that can then be typeset using the same software that has already been writ‐
       ten for TeX). The characters in the gf file will appear one per page, with labels, titles, and annotations as specified in Appendix H (Hardcopy Proofs) of The Metafontbook.

       gftodvi uses other fonts in addition to the main gf file.  A `gray' font is used to typeset the pixels that actually make up the character. (We wouldn't want all the pixels to be simply black, since
       then  labels, key points, and other information would be lost.)  A `title' font is used for the information at the top of the page. A `label' font is used for the labels on key points of the figure.
       A `slant' font is used to typeset diagonal lines, which otherwise have to be simulated using horizontal and vertical rules.  The default gray, title, and label fonts  are  gray,  cmr8,  and  cmtt10,
       respectively; there is no default slant font.

       To change the default fonts, you can give special commands in your Metafont source file, or you can change the fonts online. An online dialog ensues if you end the gf_file_name with a `/'. For exam‐
       ple,
         gftodvi cmr10.300gf/
         Special font substitution: grayfont black
         OK; any more? grayfontarea /home/art/don/
         OK; any more? slantfont /home/fonts/slantimagen6
         OK; any more? <RET>
       will use /home/art/don/black as the `gray' font and /home/fonts/slantimagen6 as the `slant' font (this name indicates a font for lines with slope 1/6 at the resolution of an Imagen printer).

       The gf_file_name on the command line must be complete.  Because the resolution is part of the extension, it would not make sense to append a default extension as is  done  with  TeX  or  DVI-reading
       software. The output file name uses the same root as the gf file, with the .dvi extension added. For example, the input file cmr10.2602gf would become cmr10.dvi.

OPTIONS
       The  argument  to  -overflow-label-offset  specifies  the  distance from the right edge of the character bounding box at which the overflow equations (if any) are typeset.  The value is given in TeX
       points.  The default is a little over two inches.

       Without the -verbose option, gftodvi operates silently.  With it, a banner and progress report are printed on stdout.

ENVIRONMENT
       gftodvi looks for gf_file_name using the environment variable GFFONTS.  If that is not set, it uses the variable TEXFONTS. If that is not set, it uses the system default.

       See tex(1) for the details of the searching.

FILES
       {gray.tfm,...}
              The default fonts.

       {gray.mf,...}
              The Metafont sources.

SEE ALSO
       tex(1), mf(1).
       Donald E. Knuth, The Metafontbook (Volume C of Computers and Typesetting), Addison-Wesley, 1986, ISBN 0-201-13445-4.
       Donald E. Knuth et al., Metafontware.

AUTHORS
       Donald E. Knuth wrote the program. It was published as part of the Metafontware technical report, available from the TeX Users Group.  Paul Richards ported it to Unix.



Web2C 2012                                                                                      20 April 2007                                                                                      GFTODVI(1)
