CWEB(1)                                                                          General Commands Manual                                                                          CWEB(1)

NAME
       ctangle, cweave - translate CWEB to C and/or TeX

SYNOPSIS
       ctangle [-bhp] [+s] webfile[.w] [{changefile[.ch]|-} [outfile[.c]]]
       cweave [-befhpx] [+s] webfile[.w] [{changefile[.ch]|-} [outfile[.tex]]]

DESCRIPTION
       The  ctangle  program converts a CWEB source document into a C program that may be compiled in the usual way.  The output file includes #line specifications so that debugging can
       be done in terms of the CWEB source file.

       The cweave program converts the same CWEB file into a TeX file that may be formatted and printed in the usual way.  It takes appropriate care of  typographic  details  like  page
       layout and the use of indentation, italics, boldface, etc., and it supplies extensive cross-index information that it gathers automatically.

       CWEB  allows  you  to  prepare  a  single  document  containing all the information that is needed both to produce a compilable C program and to produce a well-formatted document
       describing the program in as much detail as the writer may desire.  The user of CWEB ought to be familiar with TeX as well as C.

       The command line should have one, two, or three names on it.  The first is taken as the CWEB file (and .w is added if there is no extension).  If that file cannot be opened,  the
       extension  .web  is  tried  instead.  (But .w is recommended, since .web usually implies Pascal.)  If there is a second name, it is a change file (and .ch is added if there is no
       extension).  The change file overrides parts of the WEB file, as described in the documentation.  If there is a third name, it overrides the default  name  of  the  output  file,
       which is ordinarily the same as the name of the input file (but on the current directory) with the extension .c or .tex.

       Options in the command line may be either turned off with - (if they are on by default) or turned on with + (if they are off by default).  In fact, the options are processed from
       left to right, so a sequence like -f +f corresponds to +f (which is the default).

       The -b option suppresses the banner line that normally appears on your terminal when ctangle or cweave begins.  The -h option suppresses the happy message that  normally  appears
       if  the  processing was successful.  The -p option suppresses progress reports (starred module numbers) as the processing takes place.  If you say -bhp, you get nothing but error
       messages.

       The +s option prints statistics about memory usage at the end of a run.

       There are three other options applicable to cweave only: -f means do not force a newline after every statement in the formatted output.  -e inhibits the enclosure  of  C material
       formatted  by cweave in brackets \PB{...}.  Such brackets are normally inserted so that special hooks can be used by cweb-latex and similar programs.  -x means omit the index and
       table of contents.

ENVIRONMENT
       The environment variable CWEBINPUTS is used to search for the input files, or the system default if CWEBINPUTS is not set.  See tex(1) for the details of the searching.

FILES
       The location of the files mentioned below varies from system to system.  Use the kpsewhich utility to find their locations.

       cwebmac.tex
              TeX macros used by cweave output.

       cwebman.tex
              The user manual.

SEE ALSO
       Literate Programming
              by D. E. Knuth.

       Weaving a Program
              by Wayne Sewell.

       The CWEB System of Structured Documentation
              by Donald E. Knuth and Silvio Levy (hardcopy version of cwebman.tex and the source code listings).

       tex(1), cc(1).

AUTHORS
       Don Knuth wrote WEB for TeX and Pascal.  Silvio Levy designed and developed CWEB by adapting the WEB conventions to C and by recoding everything in CWEB.  Knuth began using  CWEB
       and made further refinements.  Many other helpers are acknowledged in the CWEB manual.

Web2C 2019/dev                                                                       28 October 2018                                                                              CWEB(1)
