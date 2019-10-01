AFM2TFM(1)                                                                                 General Commands Manual                                                                                 AFM2TFM(1)



NAME
       afm2tfm - convert Adobe font metrics to TeX font metrics

DESCRIPTION
       PostScript fonts are (or should be) accompanied by font metric files such as Times-Roman.afm, which describes the characteristics of the font called Times-Roman.  To use such fonts with TeX, we need
       TFM files that contain similar information. This program does that conversion.  For more information, print out the dvips manual.

FILES
       psfonts.map in the config directory used by dvips (update this).
       ../afm/Makefile in the dvips sources (look at this for examples).

SEE ALSO
       dvips(1), tex(1), vptovf(1)

BUGS
       An option to add letterspacing to the virtual font was rejected by Knuth because it would make the fi and fl ligatures break the normal rhythmic pattern.

AUTHORS
       Tomas Rokicki <rokicki@cs.stanford.edu> and Donald E. Knuth



                                                                                                9 August 1990                                                                                      AFM2TFM(1)
