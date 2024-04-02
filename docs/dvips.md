DVIPS(1)                                                                         General Commands Manual                                                                         DVIPS(1)

NAME
       dvips - convert a TeX DVI file to PostScript

SYNOPSIS
       dvips [OPTIONS] file[.dvi]

DESCRIPTION
       THIS MAN PAGE IS OBSOLETE!  See the Texinfo documentation instead.  You can read it either in Emacs or with the standalone info program which comes with the GNU texinfo distribu‐
       tion as ftp.gnu.org:pub/gnu/texinfo/texinfo*.tar.gz.

       The program dvips takes a DVI file file[.dvi] produced by TeX (or by some other processor such as GFtoDVI) and converts it to PostScript, sending the output to a file or directly
       to  a printer.  The DVI file may be specified without the .dvi extension.  Fonts used may either be resident in the printer or defined as bitmaps in PK files, or a `virtual' com‐
       bination of both.  If the mktexpk program is installed, dvips will automatically invoke METAFONT to generate fonts that don't already exist.

       For more information, see the Texinfo manual dvips.texi, which should be installed somewhere on your system, hopefully accessible through the standard Info tree.

OPTIONS
       -a     Conserve memory by making three passes over the .dvi file instead of two and only loading those characters actually used.  Generally only useful on machines  with  a  very
              limited amount of memory, like some PCs.

       -A     Print only odd pages (TeX pages, not sequence pages).

       -b num Generate  num  copies  of  each  page, but duplicating the page body rather than using the #numcopies option.  This can be useful in conjunction with a header file setting
              \bop-hook to do color separations or other neat tricks.

       -B     Print only even pages (TeX pages, not sequence pages).

       -c num Generate num copies of every page.  Default is 1.  (For collated copies, see the -C option below.)

       -C num Create num copies, but collated (by replicating the data in the PostScript file).  Slower than the -c option, but easier on the hands, and  faster  than  resubmitting  the
              same PostScript file multiple times.

       -d num Set  the  debug  flags.  This is intended only for emergencies or for unusual fact-finding expeditions; it will work only if dvips has been compiled with the DEBUG option.
              If nonzero, prints additional information on standard error.  For maximum information, you can use `-1'.  See the Dvips Texinfo manual for more details.

       -D num Set the resolution in dpi (dots per inch) to num.  This affects the choice of bitmap fonts that are loaded and also the  positioning  of  letters  in  resident  PostScript
              fonts.  Must  be  between 10 and 10000.  This affects both the horizontal and vertical resolution.  If a high resolution (something greater than 400 dpi, say) is selected,
              the -Z flag should probably also be used.

       -e num Make sure that each character is placed at most this many pixels from its `true' resolution-independent position on the page. The default value of this parameter is  reso‐
              lution  dependent.  Allowing individual characters to `drift' from their correctly rounded positions by a few pixels, while regaining the true position at the beginning of
              each new word, improves the spacing of letters in words.

       -E     makes dvips attempt to generate an EPSF file with a tight bounding box.  This only works on one-page files, and it only looks at marks made by characters and rules, not by
              any  included graphics.  In addition, it gets the glyph metrics from the tfm file, so characters that lie outside their enclosing tfm box may confuse it.  In addition, the
              bounding box might be a bit too loose if the character glyph has significant left or right side bearings.  Nonetheless, this option works  well  for  creating  small  EPSF
              files  for  equations  or  tables  or the like.  (Note, of course, that dvips output is resolution dependent and thus does not make very good EPSF files, especially if the
              images are to be scaled; use these EPSF files with a great deal of care.)

       -f     Run as a filter.  Read the .dvi file from standard input and write the PostScript to standard output.  The standard input must be seekable, so it cannot be a pipe.  If you
              must  use a pipe, write a shell script that copies the pipe output to a temporary file and then points dvips at this file.  This option also disables the automatic reading
              of the PRINTER environment variable, and turns off the automatic sending of control D if it was turned on with the -F option or in the configuration  file;  use  -F  after
              this option if you want both.

       -F     Causes  Control-D  (ASCII  code  4) to be appended as the very last character of the PostScript file.  This is useful when dvips is driving the printer directly instead of
              working through a spooler, as is common on extremely small systems.  NOTE! DO NOT USE THIS OPTION!

       -G     Causes dvips to shift non-printing characters to higher-numbered positions.  This may be useful sometimes.

       -h name
              Prepend file name as an additional header file. (However, if the name is simply `-' suppress all header files from the output.)  This header file gets added to  the  Post‐
              Script userdict.

       -i     Make each section be a separate file.  Under certain circumstances, dvips will split the document up into `sections' to be processed independently; this is most often done
              for memory reasons.  Using this option tells dvips to place each section into a separate file; the new file names are created replacing the suffix of the  supplied  output
              file  name  by  a  three-digit  sequence  number.   This  option  is most often used in conjunction with the -S option which sets the maximum section length in pages.  For
              instance, some phototypesetters cannot print more than ten or so consecutive pages before running out of steam; these options can be used to  automatically  split  a  book
              into ten-page sections, each to its own file.

       -j     Download  only  needed  characters from Type 1 fonts. This is the default in the current release.  Some debugging flags trace this operation.  You can also control partial
              downloading on a per-font basis, via the psfonts.map file.

       -k     Print crop marks.  This option increases the paper size (which should be specified, either with a paper size special or with the -T option) by a half inch in  each  dimen‐
              sion.  It translates each page by a quarter inch and draws cross-style crop marks.  It is mostly useful with typesetters that can set the page size automatically.

       -K     This  option  causes  comments in included PostScript graphics, font files, and headers to be removed.  This is sometimes necessary to get around bugs in spoolers or Post‐
              Script post-processing programs.  Specifically, the %%Page comments, when left in, often cause difficulties.  Use of this flag can cause some included  graphics  to  fail,
              since  the  PostScript  header macros from some software packages read portions of the input stream line by line, searching for a particular comment.  This option has been
              turned off by default because PostScript previewers and spoolers have been getting better.

       -l num The last page printed will be the first one numbered num Default is the last page in the document.  If the num is prefixed by an equals sign, then it (and any argument  to
              the  -p  option)  is  treated as a sequence number, rather than a value to compare with \count0 values.  Thus, using -l =9 will end with the ninth page of the document, no
              matter what the pages are actually numbered.

       -m     Specify manual feed for printer.

       -mode mode
              Use mode as the Metafont device name for path searching and font generation.  This overrides any value from configuration files.  With the default paths, explicitly speci‐
              fying the mode also makes the program assume the fonts are in a subdirectory named mode.

       -M     Turns off the automatic font generation facility.  If any fonts are missing, commands to generate the fonts are appended to the file missfont.log in the current directory;
              this file can then be executed and deleted to create the missing fonts.

       -n num At most num pages will be printed. Default is 100000.

       -N     Turns off structured comments; this might be necessary on some systems that try to interpret PostScript comments in weird ways, or on some PostScript printers.   Old  ver‐
              sions of TranScript in particular cannot handle modern Encapsulated PostScript.

       -noomega
              This  will disable the use of Omega extensions when interpreting DVI files.  By default, the additional opcodes 129 and 134 are recognized by dvips as Omega or pTeX exten‐
              sions and interpreted as requests to set 2-byte characters.

       -noptex
              This will disable the use of pTeX extensions when interpreting DVI files.  By default, the additional opcodes 130 and 135 are recognized by dvips as  pTeX  extensions  and
              interpreted as requests to set 3-byte characters, and 255 as request to change the typesetting direction.

              The  only  drawback  is  that  the  virtual  font  array will (at least temporarily) require 65536 or more positions instead of the default 256 positions, i.e., the memory
              requirements of dvips will be somewhat larger.  If you find this unacceptable or encounter another problem with the Omega or pTeX extensions, you can switch off  the  pTeX
              extension by using -noptex, or both by using -noomega (but please do send a bug report if you find such problems - see the bug address in the AUTHORS section below).

       -o name
              The  output will be sent to file name If no file name is given (i.e., -o is last on the command line), the default name is file.ps where the .dvi file was called file.dvi;
              if this option isn't given, any default in the configuration file is used.  If the first character of the supplied output file  name  is  an  exclamation  mark,  then  the
              remainder  will  be  used  as an argument to popen; thus, specifying !lpr as the output file will automatically queue the file for printing.  This option also disables the
              automatic reading of the PRINTER environment variable, and turns off the automatic sending of control D if it was turned on with the -F  option  or  in  the  configuration
              file; use -F after this option if you want both.

       -O offset
              Move  the origin by a certain amount.  The offset is a comma-separated pair of dimensions, such as .1in,-.3cm (in the same syntax used in the papersize special).  The ori‐
              gin of the page is shifted from the default position (of one inch down, one inch to the right from the upper left corner of the paper) by this amount.

       -p num The first page printed will be the first one numbered num.  Default is the first page in the document.  If the num is prefixed by an equals sign, then it (and any argument
              to  the  -l option) is treated as a sequence number, rather than a value to compare with \count0 values.  Thus, using -p =3 will start with the third page of the document,
              no matter what the pages are actually numbered.

       -pp pagelist
              A comma-separated list of pages and ranges (a-b) may be given, which will be interpreted as \count0 values.  Pages not specified will not be printed.  Multiple -pp options
              may be specified or all pages and page ranges can be specified with one -pp option.

       -P printername
              Sets  up  the  output for the appropriate printer.  This is implemented by reading in config.printername , which can then set the output pipe (as in, !lpr -Pprintername as
              well as the font paths and any other config.ps defaults for that printer only.  Note that config.ps is read before config.printername  In  addition,  another  file  called
              ~/.dvipsrc  is  searched for immediately after config.ps; this file is intended for user defaults.  If no -P command is given, the environment variable PRINTER is checked.
              If that variable exists, and a corresponding configuration file exists, that configuration file is read in.

       -q     Run in quiet mode.  Don't chatter about pages converted, etc.; report nothing but errors to standard error.

       -r     Stack pages in reverse order.  Normally, page 1 will be printed first.

       -R[0|1|2]
              Run securely.  -R2 disables both shell command execution in \special'{} (via backticks ` ) and config files (via the E option), and opening of any absolute filenames.  -R1
              , the default, forbids shell escapes but allows absolute filenames.  -R0 allows both.  The config file option is z

       -s     Causes  the entire global output to be enclosed in a save/restore pair.  This causes the file to not be truly conformant, and is thus not recommended, but is useful if you
              are driving the printer directly and don't care too much about the portability of the output.

       -S num Set the maximum number of pages in each `section'.  This option is most commonly used with the -i option; see that documentation above for more information.

       -t papertype
              This sets the paper type to papertype.  The papertype should be defined in one of the configuration files, along with the appropriate code to select it.  (Currently  known
              types  include  letter, legal, ledger, a4, a3).  You can also specify -t landscape, which rotates a document by 90 degrees.  To rotate a document whose size is not letter,
              you can use the -t option twice, once for the page size, and once for landscape.  You should not use any -t option when the DVI file already contains a papersize  special,
              as is done by some LaTeX packages, notably hyperref.sty.

              The  upper  left corner of each page in the .dvi file is placed one inch from the left and one inch from the top.  Use of this option is highly dependent on the configura‐
              tion file.  Note that executing the letter or a4 or other PostScript operators cause the document to be nonconforming and can cause it not to print on certain printers, so
              the paper size should not execute such an operator if at all possible.

       -T papersize
              Set the paper size to the given pair of dimensions.  This option takes its arguments in the same style as -O.  It overrides any paper size special in the dvi file.

       -u psmapfile
              Set psmapfile to be the file that dvips uses for looking up PostScript font aliases.  If psmapfile begins with a + character, then the rest of the name is used as the name
              of the map file, and the map file is appended to the list of map files (instead of replacing the list).  In either case, if psmapfile has no extension, then .map is  added
              at the end.

       -U     Disable a PostScript virtual memory saving optimization that stores the character metric information in the same string that is used to store the bitmap information.  This
              is only necessary when driving the Xerox 4045 PostScript interpreter.  It is caused by a bug in that interpreter that results in `garbage' on the bottom of each character.
              Not recommended unless you must drive this printer.

       -v     Print the dvips version number and exit.

       -V     Download  non-resident  PostScript  fonts  as  bitmaps.   This requires use of `gsftopk' or `pstopk' or some other such program(s) in order to generate the required bitmap
              fonts; these programs are supplied with dvips.

       -x num Set the magnification ratio to num/1000.  Overrides the magnification specified in the .dvi file.  Must be between 10 and 100000.  Instead of an integer, num may be a real
              number for increased precision.

       -X num Set the horizontal resolution in dots per inch to num.

       -y num Set the magnification ratio to num/1000 times the magnification specified in the .dvi file.  See -x above.

       -Y num Set the vertical resolution in dots per inch to num.

       -z     Pass  html  hyperdvi  specials through to the output for eventual distillation into PDF.  This is not enabled by default to avoid including the header files unnecessarily,
              and use of temporary files in creating the output.

       -Z     Causes bitmapped fonts to be compressed before they are downloaded, thereby reducing the size of the PostScript font-downloading information.  Especially  useful  at  high
              resolutions or when very large fonts are used.  Will slow down printing somewhat, especially on early 68000-based PostScript printers.

SEE ALSO
       mf(1), afm2tfm(1), tex(1), latex(1), lpr(1), dvips.texi, http://tug.org/dvips.

ENVIRONMENT
       Dvipsk uses the same environment variables and algorithms for finding font files as TeX and its friends do.  See the documentation for the Kpathsea library for details.  (Repeat‐
       ing it here is too cumbersome.)

       KPATHSEA_DEBUG: Trace Kpathsea lookups; set to -1 for complete tracing.

       PRINTER: see above.

NOTES
       PostScript is a registered trademark of Adobe Systems Incorporated.

AUTHOR
       Tomas Rokicki; extended to virtual fonts by Don Knuth.  Path searching and configuration modifications by Karl Berry.

       Maintained in TeX Live; please send bug reports or other correspondence to tex-k@tug.org (http://lists.tug.org/tex-k).

                                                                                     1 February 2016                                                                             DVIPS(1)
