RECODE(1)                                                               FSF                                                              RECODE(1)

NAME
       recode - converts files between character sets

SYNOPSIS
       recode [OPTION]... [ [CHARSET] | REQUEST [FILE]... ]

DESCRIPTION
       Free `recode' converts files between various character sets and surfaces.

       If  a  long option shows an argument as mandatory, then it is mandatory for the equivalent short option also.  Similarly for optional argu‐
       ments.

   Listings:
       -l, --list[=FORMAT]
              list one or all known charsets and aliases

       -k, --known=PAIRS
              restrict charsets according to known PAIRS list

       -h, --header[=[LN/]NAME]
              write table NAME on stdout using LN, then exit

       -F, --freeze-tables
              write out a C module holding all tables

       -T, --find-subsets
              report all charsets being subset of others

       -C, --copyright
              display Copyright and copying conditions

       --help display this help and exit

       --version
              output version information and exit

   Operation modes:
       -v, --verbose
              explain sequence of steps and report progress

       -q, --quiet, --silent
              inhibit messages about irreversible recodings

       -f, --force
              force recodings even when not reversible

       -t, --touch
              touch the recoded files after replacement

       -i, --sequence=files
              use intermediate files for sequencing passes

       --sequence=memory
              use memory buffers for sequencing passes

       -p, --sequence=pipe
              use pipe machinery for sequencing passes

   Fine tuning:
       -s, --strict
              use strict mappings, even loose characters

       -d, --diacritics
              convert only diacritics or alike for HTML/LaTeX

       -S, --source[=LN]
              limit recoding to strings and comments as for LN

       -c, --colons
              use colons instead of double quotes for diaeresis

       -g, --graphics
              approximate IBMPC rulers by ASCII graphics

       -x, --ignore=CHARSET
              ignore CHARSET while choosing a recoding path

       Option -l with no FORMAT nor CHARSET list available charsets and surfaces.  FORMAT is `decimal', `octal', `hexadecimal' or `full'  (or  one
       of  `dohf').   Unless  DEFAULT_CHARSET  is  set  in  environment,  CHARSET defaults to the locale dependent encoding, determined by LC_ALL,
       LC_CTYPE, LANG.  With -k, possible before charsets are listed for the given after CHARSET, both being tabular charsets, with PAIRS  of  the
       form  `BEF1:AFT1,BEF2:AFT2,...'  and BEFs and AFTs being codes are given as decimal numbers.  LN is some language, it may be `c', `perl' or
       `po'; `c' is the default.

       REQUEST is SUBREQUEST[,SUBREQUEST]...; SUBREQUEST is ENCODING[..ENCODING]...  ENCODING is  [CHARSET][/[SURFACE]]...;  REQUEST  often  looks
       like BEFORE..AFTER, with BEFORE and AFTER being charsets.  An omitted CHARSET implies the usual charset; an omitted [/SURFACE]... means the
       implied surfaces for CHARSET; a / with an empty surface name means no surfaces at all.  See the manual.

       If none of -i and -p are given, presume -p if no FILE, else -i.  Each FILE is recoded over itself, destroying the original.  If no FILE  is
       specified, then act as a filter and recode stdin to stdout.

AUTHOR
       Written by Franc,ois Pinard <pinard@iro.umontreal.ca>.

REPORTING BUGS
       Report bugs to <recode-bugs@iro.umontreal.ca>.

COPYRIGHT
       Copyright © 1990, 92, 93, 94, 96, 97, 99 Free Software Foundation, Inc.
       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU‐
       LAR PURPOSE.

SEE ALSO
       The full documentation for recode is maintained as a Texinfo manual.  If the info and recode programs are properly installed at your  site,
       the command

              info recode

       should give you access to the complete manual.

Free recode 3.6                                                    October 2015                                                          RECODE(1)
