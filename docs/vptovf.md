VPTOVF(1)                                                                        General Commands Manual                                                                        VPTOVF(1)

NAME
       vptovf - convert virtual property lists to virtual font metrics

SYNOPSIS
       vptovf [-verbose] vpl_name[.vpl] [vfm_name[.vf] [tfm_name[.tfm]]]

DESCRIPTION
       This manual page is not meant to be exhaustive.  The complete documentation for this version of TeX can be found in the info file or manual Web2C: A TeX implementation.

       The vptovf program translates a (human-oriented) property list file to a pair of (program-oriented) files in the VF (virtual font) and TFM (TeX font metric) formats. Thus, a vir‐
       tual font file can be edited and its exact contents can be displayed mnemonically.  New virtual fonts, which map characters as seen by TeX into an arbitrary sequence of low-level
       typesetting operations, can also be created in this way.

       All three filenames, vpl_name, vf_name, and tfm_name, are extended with the appropriate suffix, if they lack one.

OPTIONS
       Without the -verbose option, vptovf operates silently.  With it, a banner and progress report are printed on stdout.

SEE ALSO
       pltotf(1), tftopl(1), vftovp(1).

AUTHORS
       Donald E. Knuth wrote the program, based in part on an idea of David Fuchs, starting with the code for pltotf(1).  Karl Berry adapted it for compilation with web2c.

Web2C 2019/dev                                                                         16 June 2015                                                                             VPTOVF(1)
