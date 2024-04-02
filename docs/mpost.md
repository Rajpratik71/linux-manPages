MPOST(1)                                                                         General Commands Manual                                                                         MPOST(1)

NAME
       mpost - MetaPost, a system for creating graphics

SYNOPSIS
       mpost [options] [commands]

       mpost --dvitomp dvifile[.dvi] [mpxfile[.mpx]]

DESCRIPTION
       MetaPost  interprets  the  MetaPost  language and produces PostScript (EPS) or Scalable Vector Graphics (SVG) pictures.  The MetaPost language is similar to Knuth's Metafont with
       additional features for including tex(1) or troff(1) commands and accessing features of PostScript not found in Metafont.

       MetaPost is normally used with some preloaded macros, and it will use its executable name as the name of the preload file to use.   For example, when called as mpost the mpost.mp
       file is used, which is identical to plain.mp.  When the --ini option is given, preloading does not happen.

       The  commands  given  on the command line to the MetaPost program are passed to it as the first input line.  (But it is often easier to type extended arguments as the first input
       line, since UNIX shells tend to gobble up or misinterpret MetaPost's favorite symbols, like semicolons, unless you quote them.) The normal usage is to say mpost figs  to  process
       the  file  figs.mp.   The basename of figs becomes the ``jobname'', and is used in forming output file names.  If no file is named, the jobname becomes mpout.  The default exten‐
       sion, .mp, can be overridden by specifying an extension explicitly.

       When the --dvitomp option is given, MetaPost acts as DVI-to-MPX converter only.  See dvitomp (1) for details.

       This manual page is not meant to be exhaustive.  The complete documentation for this version of MetaPost can be found in the User Manual that should  have  been  installed  along
       with the program and is also available from http://tug.org/metapost.  See the FILES section below.

       The  MetaPost language is similar to Metafont, but the manual assumes no knowledge of Metafont.  MetaPost does not have bitmap output commands or Metafont's online display mecha‐
       nism.

FILES
       plain.mp
              The standard preload file.

       mfplain.mp
              The Metafont-compatible preload file.

       $TEXMFMAIN/metapost/base/*.mp
              The standard MetaPost macros included in the original distribution.

       $TEXMFMAIN/metapost/support/*
              Various tables for handling included tex and troff.

       $TEXMFMAIN/metapost/support/trfonts.map
              Table of corresponding font names for troff and PostScript.

       psfonts.map
              Table of corresponding font names for tex and PostScript.

       $TEXMFMAIN/doc/metapost/*
              The MetaPost manual and tutorial source, also including sample figures

SUGGESTED READING
       Donald E. Knuth, The Metafontbook (Volume C of Computers and Typesetting), Addison-Wesley, 1986, ISBN 0-201-13445-4.
       TUGboat (the journal of the TeX Users Group).

SEE ALSO
       dvitomp(1), epstopdf(1), mf(1), mptopdf(1), tex(1),

       MetaPost source code ⟨http://foundry.supelec.fr/gf/project/metapost/⟩.
       MetaPost home page ⟨http://tug.org/metapost/⟩.

AUTHORS
       MetaPost was designed by John D. Hobby, incorporating algorithms from Metafont by Donald E. Knuth.  It was originally implemented on Unix, incorporating system-dependent routines
       from web2c, while not relying on it except for the actual Web-to-C translator.

       The primary author of the current MetaPost was Taco Hoekwater, with assistance from Hans Hagen and many others.  It is currently maintained by Luigi Scarso.

       Ulrik  Vieth  adapted  MetaPost  to take advantage of the advanced path searching features in more recent versions of web2c and worked towards fully integrating MetaPost into the
       canonical Unix TeX distribution.

BUGS
       The MetaPost home page is http://tug.org/metapost.

Web2C 2019/dev                                                                         16 June 2015                                                                              MPOST(1)
