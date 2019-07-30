MF(1)                                                                            General Commands Manual                                                                            MF(1)

NAME
       mf, inimf, mf-nowin - Metafont, a language for font and logo design

SYNOPSIS
       mf [options] [commands]

DESCRIPTION
       Metafont  reads  the  program  in  the  specified files and outputs font rasters (in gf format) and font metrics (in tfm format).  The Metafont language is described in The Meta‐
       fontbook.

       Like TeX, Metafont is normally used with a large body of precompiled macros, and font generation in particular requires the support of several macro files.  This version of Meta‐
       font  looks  at  its command line to see what name it was called under.  Both inimf and virmf are symlinks to the mf executable.  When called as inimf (or when the -ini option is
       given) it can be used to precompile macros into a .base file.  When called as virmf it will use the plain base.  When called under any other name, Metafont will use that name  as
       the name of the base to use.  For example, when called as mf the mf base is used, which is identical to the plain base.  Other bases than plain are rarely used.

       The  commands  given  on the command line to the Metafont program are passed to it as the first input line.  (But it is often easier to type extended arguments as the first input
       line, since UNIX shells tend to gobble up or misinterpret Metafont's favorite symbols, like semicolons, unless you quote them.)  As described in The Metafontbook, that first line
       should begin with a filename, a \controlsequence, or a &basename.

       The normal usage is to say

              mf  '\mode=<printengine>; [mag=magstep(n);]' input  font

       to  start processing font.mf.  The single quotes are the best way of keeping the Unix shell from misinterpreting the semicolons and from removing the \ character, which is needed
       here to keep Metafont from thinking that you want to produce a font called mode.  (Or you can just say mf and give the other stuff on the next line, without quotes.)  Other  con‐
       trol  sequences,  such as batchmode (for silent operation) can also appear.  The name font will be the ``jobname'', and is used in forming output file names.  If Metafont doesn't
       get a file name in the first line, the jobname is mfput.  The default extension, .mf, can be overridden by specifying an extension explicitly.

       A log of error messages goes into the file jobname.log.  The output files are jobname.tfm and jobname.<number>gf, where <number> depends on the resolution  and  magnification  of
       the  font.   The  mode  in  this  example is shown generically as <printengine>, a symbolic term for which the name of an actual device or, most commonly, the name localfont (see
       below) must be substituted.  If the mode is not specified or is not valid for your site, Metafont will default to proof mode which produces large character images for use in font
       design  and  refinement.  Proof mode can be recognized by the suffix .2602gf after the jobname.  Examples of proof mode output can be found in Computer Modern Typefaces (Volume E
       of Computers and Typesetting).  The system of magsteps is identical to the system used by TeX, with values generally in the range 0.5, 1.0, 2.0, 3.0, 4.0 and 5.0.  A  listing  of
       gf numbers for 118-dpi, 240-dpi and 300-dpi fonts is shown below.

           MAGSTEP        118 dpi   240 dpi   300 dpi
       mag=magstep(0)     118       240       300
       mag=magstep(0.5)   129       263       329
       mag=magstep(1)     142       288       360
       mag=magstep(2)     170       346       432
       mag=magstep(3)     204       415       518
       mag=magstep(4)     245       498       622
       mag=magstep(5)     294       597       746

       Magnification can also be specified not as a magstep but as an arbitrary value, such as 1.315, to create special character sizes.

       Before  font  production  can  begin,  it  is  necessary  to set up the appropriate base files.  The minimum set of components for font production for a given print-engine is the
       plain.mf macro file and the local mode_def file.  The macros in plain.mf can be studied in an appendix to the Metafontbook; they were developed by Donald E. Knuth, and this  file
       should  never  be  altered  except  when it is officially upgraded.  Each mode_def specification helps adapt fonts to a particular print-engine.  There is a regular discussion of
       mode_defs in TUGboat, the journal of the TeX Users Group.  The local ones in use on this computer should be in modes.mf.

       The e response to Metafont's error-recovery mode invokes the system default editor at the erroneous line of the source file.  There is an environment variable, MFEDIT, that over‐
       rides  the  default editor.  It should contain a string with "%s" indicating where the filename goes and "%d" indicating where the decimal linenumber (if any) goes.  For example,
       an MFEDIT string for the vi editor can be set with the csh command
              setenv MFEDIT "vi +%d %s"

       A convenient file in the library is null.mf, containing nothing.  When mf can't find the file it thinks you want to input, it keeps asking you for another file  name;  responding
       `null' gets you out of the loop if you don't want to input anything.

ONLINE GRAPHICS OUTPUT
       Metafont  can  use  most  modern displays, so you can see its output without printing.  Chapter 23 of The Metafontbook describes what you can do.  This implementation of Metafont
       uses environment variables to determine which display device you want to use.  First it looks for a variable MFTERM, and then for TERM.  If it  can't  find  either,  you  get  no
       online  output.   Otherwise,  the  value of the variable determines the device to use: hp2627, sun (for old SunView), tek, uniterm (for an Atari ST Tek 4014 emulator), xterm (for
       either X10 or X11).  Some of these devices may not be supported in all Metafont executables; the choice is made at compilation time.

       On some systems, there are two Metafont binaries, mf and mf-nowin.  On those systems the mf binary supports graphics, while the mf-nowin binary does not.  The mf-nowin binary  is
       used by scripts like mktexpk where graphics support is a nuisance rather than something helpful.

OPTIONS
       This version of Metafont understands the following command line options.

       -base base
              Use base as the name of the base to be used, instead of the name by which Metafont was called or a %& line.

       -file-line-error
              Print error messages in the form file:line:error which is similar to the way many compilers format them.

       -no-file-line-error
              Disable printing error messages in the file:line:error style.

       -file-line-error-style
              This is the old name of the -file-line-error option.

       -halt-on-error
              Exit with an error code when an error is encountered during processing.

       -help  Print help message and exit.

       -ini   Be inimf, for dumping bases; this is implicitly true if the program is called as inimf.

       -interaction mode
              Sets  the  interaction  mode.   The mode can be one of batchmode, nonstopmode, scrollmode, and errorstopmode.  The meaning of these modes is the same as that of the corre‐
              sponding commands.

       -jobname name
              Use name for the job name, instead of deriving it from the name of the input file.

       -kpathsea-debug bitmask
              Sets path searching debugging flags according to the bitmask.  See the Kpathsea manual for details.

       -maketex fmt
              Enable mktexfmt, where fmt must be mf.

       -no-maketex fmt
              Disable mktexfmt, where fmt must be mf.

       -output-directory directory
              Write output files in directory instead of the current directory.  Look up input files in directory first, the along the normal search path.

       -parse-first-line
              If the first line of the main input file begins with %& parse it to look for a dump name or a -translate-file option.

       -no-parse-first-line
              Disable parsing of the first line of the main input file.

       -progname name
              Pretend to be program name.  This affects both the format used and the search paths.

       -recorder
              Enable the filename recorder.  This leaves a trace of the files opened for input and output in a file with extension .fls.

       -translate-file tcxname
              Use the tcxname translation table.

       -version
              Print version information and exit.

ENVIRONMENT
       See the Kpathsearch library documentation (the `Path specifications' node) for the details of how the environment variables are use when searching.  The kpsewhich utility can  be
       used to query the values of the variables.

       If the environment variable TEXMFOUTPUT is set, Metafont attempts to put its output files in it, if they cannot be put in the current directory.  Again, see tex(1).

       MFINPUTS
              Search path for input files.

       MFEDIT Command template for switching to editor.

       MFTERM Determines  the  online  graphics  display.  If MFTERM is not set, and DISPLAY is set, the Metafont window support for X is used.  (DISPLAY must be set to a valid X server
              specification, as usual.)  If neither MFTERM nor DISPLAY is set, TERM is used to guess the window support to use.

FONT UTILITIES
       A number of utility programs are available.  The following is a partial list of available utilities and their purpose.  Consult your local Metafont guru for details.

       gftopk   Takes a gf file and produces a more tightly packed pk font file.

       gftodvi  Produces proof sheets for fonts.

       gftype   Displays the contents of a gf file in mnemonics and/or images.

       pktype   Mnemonically displays the contents of a pk file.

       mft      Formats a source file as shown in Computer Modern Typefaces.

FILES
       mf.pool
              Encoded text of Metafont's messages.

       *.base Predigested Metafont base files.

       $TEXMFMAIN/metafont/base/plain.mf
              The standard base.

       $TEXMFMAIN/metafont/misc/modes.mf
              The file of mode_defs for your site's various printers

NOTES
       This manual page is not meant to be exhaustive.  The complete documentation for this version of Metafont can be found in the info manual Web2C: A TeX implementation.

BUGS
       On January 4, 1986 the ``final'' bug in Metafont was discovered and removed.  If an error still lurks in the code, Donald E. Knuth promises to pay a finder's  fee  which  doubles
       every year to the first person who finds it.  Happy hunting.

SUGGESTED READING
       Donald E. Knuth, The Metafontbook (Volume C of Computers and Typesetting), Addison-Wesley, 1986, ISBN 0-201-13445-4.
       Donald E. Knuth, Metafont: The Program (Volume D of Computers and Typesetting), Addison-Wesley, 1986, ISBN 0-201-13438-1.
       Donald E. Knuth, Computer Modern Typefaces (Volume E of Computers and Typesetting), Addison-Wesley, 1986, ISBN 0-201-13446-2.
       TUGboat (the journal of the TeX Users Group).

COMMENTS
       Warning:  ``Type  design  can be hazardous to your other interests.  Once you get hooked, you will develop intense feelings about letterforms; the medium will intrude on the mes‐
       sages that you read.  And you will perpetually be thinking of improvements to the fonts that you see everywhere, especially those of your own design.''

SEE ALSO
       gftopk(1), gftodvi(1), gftype(1), mft(1), mpost(1), pltotf(1), tftopl(1).

AUTHORS
       Metafont was designed by Donald E. Knuth, who implemented it using his Web system for Pascal programs.  It was originally ported to Unix by Paul Richards  at  the  University  of
       Illinois at Urbana-Champaign.  This page was mostly written by Pierre MacKay.

Web2C 2019/dev                                                                       17 January 2018                                                                                MF(1)
