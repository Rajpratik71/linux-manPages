AFM2TFM(1)                                                                       General Commands Manual                                                                       AFM2TFM(1)

NAME
       afm2tfm - convert Adobe font metrics to TeX font metrics

DESCRIPTION
       PostScript  fonts  are  (or  should be) accompanied by font metric files such as Times-Roman.afm, which describes the characteristics of the font called Times-Roman.  To use such
       fonts with TeX, we need TFM files that contain similar information. This program does that conversion.

       For all the details, see the dvips manual (http://tug.org/dvips).

FILES
       psfonts.map in the config directory used by dvips.

SEE ALSO
       dvips(1), tex(1), vptovf(1), fontinst(1), afm2pl(1), otftotfm(1)

BUGS
       An option to add letterspacing to the virtual font was rejected by Knuth because it would make the fi and fl ligatures break the normal rhythmic pattern.

AUTHORS
       Tomas Rokicki and Donald E. Knuth.

       Maintained in TeX Live; please send bug reports or other correspondence to tex-k@tug.org (http://lists.tug.org/tex-k).

                                                                                     1 February 2016                                                                           AFM2TFM(1)
