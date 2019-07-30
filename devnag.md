DEVNAG(1)                                                                             User Commands                                                                             DEVNAG(1)

NAME
       devnag - Devanagari for TeX preprocessor

SYNOPSIS
       devnag in[.dn] [out[.tex]]

DESCRIPTION
       devnag is a preprocessor that reads transliterated Devanagari input delimited by n and converts it into a form with which TeX is familiar.

       The preprocessor handles the details of character placement such as the alignment of vowel diacritics and consonant ligatures. The rest of the layout, however, must be managed by
       the user.

       For specification of the format please see the documentation accompanying the package.

OPTIONS
       in[.dn] out[.tex]
              The default file extension for an input file is .dn and for an output file .tex. The output filename is optional. If an output filename is not specified, the  preprocessor
              will name it after the input file.

       -v     report devnag version

AUTHORS
       devnag  was  written  by Frans J. Velthuis <velthuis@rc.rug.nl> and is currently maintained by Zdenek Wagner <wagner@cesnet.cz>.  This manpage was written by Norbert Preining for
       Debian/GNU Linux and may be used, modified and/or distributed freely by anyone.

devnag 2.13                                                                             April 2006                                                                              DEVNAG(1)
