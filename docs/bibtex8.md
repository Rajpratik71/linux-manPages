BIBTEX8(1)                                                                            User Commands                                                                            BIBTEX8(1)

NAME
       bibtex8 - 8-bit Big BibTeX version 0.99c

SYNOPSIS
       bibtex8 [options] aux-file

DESCRIPTION
       8-bit BibTeX is an enhanced, portable C version of BibTeX 0.99.  It has been enhanced in these areas:

       - conversion to "big" (32-bit) capacity

       - capacity selectable at run time

       - flexible support for non-English languages using 8-bit character sets

       - well matched to LateX2e and its "inputenc" package

       Oren  Patashnik,  the  creator  of BibTeX, is working on a new BibTeX 1.0 that will be a modern implementation supporting large capacities and non-English languages (see TUGboat,
       pages 269--274, volume 15, number 3, September 1994).  He is content for this version to be released, but hopes that people will eventually migrate  to  BibTeX  1.0  when  it  is
       released.  Its release date is uncertain at the moment.

OPTIONS
       -?  --help
              display this help text

       -7  --traditional
              operate in the original 7-bit mode

       -8  --8bit
              force 8-bit mode, no CS file used

       -c  --csfile FILE
              read FILE as the BibTeX character set and sort definition file

       -d  --debug TYPE
              report debugging information.  TYPE is one or more of all, csf, io, mem, misc, search.

       -s  --statistics
              report internal statistics

       -t  --trace
              report execution tracing

       -v  --version
              report BibTeX version

       -B  --big
              set large BibTeX capacity

       -H  --huge
              set huge BibTeX capacity

       -W  --wolfgang
              set really huge BibTeX capacity for Wolfgang

       -M  --min_crossrefs ##
              set min_crossrefs to ##

       --mcites ##
              allow ## \cites in the .aux files

       --mentints ##
              allow ## integer entries in the .bib databases

       --mentstrs ##
              allow ## string entries in the .bib databases

       --mfields ##
              allow ## fields in the .bib databases

       --mpool ##
              set the string pool to ## bytes

       --mstrings ##
              allow ## unique strings

       --mwizfuns ##
              allow ## wizard functions

AUTHORS
       bibtex8  was written by Niel Kempson <kempson@snowyowl.co.uk> and Alejandro Aguilar-Sierra <asierra@servidor.unam.mx>. This manpage was written by Norbert Preining for Debian/GNU
       Linux and may be used, modified and/or distributed freely by anyone.

bibtex8 3.71                                                                            April 2006                                                                             BIBTEX8(1)
