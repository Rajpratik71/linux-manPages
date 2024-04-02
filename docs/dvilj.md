DVILJ(1)                                                                                 TeX-Live                                                                                DVILJ(1)

NAME
       dvilj4, dvilj4l, dvilj2p, dvilj - convert a TeX DVI file to PCL, for HP LaserJet printers

SYNOPSIS
        dvilj [--Dnumber] [-ccopies] [-dmode] [-D] [-E] [-eoutputfile]
              [-ffrompage] [-g] [-hheaderfile] [-l] [-Mflag] [-mmag] [-ppages]
              [-q] [-r] [-ttopage] [-spagesize] [-v] [-Vmode] [-w] [-xxoff(mm)]
              [-yyoff(mm)] [-Xxoff(dots)] [-Yyoff(dots)] [-z] [filename]

DESCRIPTION
       dvilj and siblings convert TeX-output ".dvi" files into PCL (the Hewlett-Packard Printer Control Language) commands suitable for printing on a HP LaserJet+, HP LaserJet IIP
       (using dvilj2p), HP LaserJet 4 (using dvilj4), and fully compatible printers.

       dvilj4 also provides support for the builtin Intellifont and TrueType fonts; TFM and VF files are provided in the distribution.  Virtual fonts are not supported directly by
       dvilj, so you must run dvicopy(1) first, or otherwise expand the virtual fonts

       All programs are generated from one source file dvi2xx.c. They are usually called via a shell script or as a line printer filter. One such script, dvihp(1), is included in the
       distribution. It provides command-line options similar to those of dvips(1).

OPTIONS
       --Dnumber
           Debug according to the bits of number; see the kpathsea(3) manual for values. Also turns on general verbosity.

       -cnumber
           Print each page number times (including original)

       -dnumber
           print in duplex mode. The option -d1 means long edge binding, -d2 stands for short edge binding. This option is only selectable in dvilj4 and dvilj2p.

       -D[-12]
           Double-sided printing - see below; -D1 prints odd sides only, -D2 is for even pages, a trailing - suppresses printing of empty padding pages.

       -E  Switch printer into econo mode (dvilj4 only).

       -eoutfile
           Send output to outfile instead of the basename of dvi file extended with ".lj". If outfile is - (as in "-e-") the output is directed to standard output and can be directly
           piped into a spooler.

       -fpagenum
           Print pages with TeX page numbers greater than or equal to pagenum.

       -g  Go mode: do not reset printer at start of job.

       -hheaderfile
           Copy headerfile to output before translation of the DVI file. Used to send arbitrary commands to the laserprinter.

       -l  Print output in landscape mode; supported only by dvilj2p and dvilj4.

       -Mflag
           Do (not) call mktexpk(1) to generate fonts on demand. -M1 and -M are equivalent. -M0 enables invoking mktexpk(1). (This is the same as in dvips(1).) The default behavior
           (i.e., if no -M option is given) is chosen at compile-time; as distributed, mktexpk is enabled.

       -mmagnification
           Specify the magnification to use. The following are available:

             -m#usermag e.g., #900
             -m0 equivalent to -m#1000
             -mh equivalent to -m#1095
             -m1 equivalent to -m#1200
             -mq equivalent to -m#1250
             -m2 equivalent to -m#1440
             -m3 equivalent to -m#1728
             -m4 equivalent to -m#2074
             -m5 equivalent to -m#2488

       -ppagecount
           Print pagecount pages after the starting page.

       -q  Quiet operation: omit final statistics, etc.

       -r  Toggle page reversal.

       -spagesize
           Specify the page size:

             -s1: Executive (7.25" x 10.5")
             -s2: Letter (8.5" x 11")
             -s3: Legal (8.5" x 14")
             -s6: Ledger (11" x 17")
             -s25: A5 paper (148mm x 210mm)
             -s26: A4 paper (210mm x 297mm)
             -s27: A3 (297mm x 420mm)
             -s45: JIS B5 paper (182mm x 257mm)
             -s46: JIS B4 paper (250mm x 354mm)
             -s71: Hagaki postcard (100mm x 148mm)
             -s72: Oufuku-Hagaki postcard (200mm x 148mm)
             -s80: Monarch Envelope (3 7/8" x 7 1/2")
             -s81: Commercial Envelope 10 (4 1/8" x 9 1/2")
             -s90: International DL (110mm x 220mm)
             -s91: International C5 (162mm x 229mm)
             -s100: International B5 (176mm x 250mm)

           These values are from the PCL 5 technical reference manual. If the -s commandline option is omitted, no clipping is performed at the bottom of the page. (But printing below
           the paper bottom should not disturb any correctly behaving PCL printer.) Please remember that the correct paper tray must be installed for selected paper size, so use this
           option only if you have full control over your print destination.

       -tpagenum
           Print pages with TeX page numbers less than or equal to pagenum.

       -v  Verbose mode: list fonts used, etc.

       -Vmode
           Compatibility mode. As mode, use "K" for Kyocera, "B" for Brother, 6 for LJ6 printers.

       -w  Omit warnings.

       -xoffset
           Global x-offset in mm on output page relative to 1 inch/1 inch origin.

       -yoffset
           Global y-offset in mm on output page relative to 1 inch/1 inch origin.

       -Xoffset
           Global x-offset in dots on output page (overrides 1 inch/1 inch origin).

       -Yoffset
           Global y-offset in dots on output page (overrides 1 inch/1 inch origin).

       -z  Print a test page with the page counter at end of job.

OPERANDS
       If no operands are specified a brief usage message is displayed.

       filename
           The DVI file name that shall be converted by dvilj. It must always be seekable.

           The output file name is constructed from filename. Either an extension ".dvi" is replaced by ".lj", or the extension ".lj" is appended.

           If filename is -, the DVI file is read from standard input and the resulting PCL document is written to standard output. (Please remember that thhe DVI file must be seekable,
           even if it's stdin.)

SUPPORTED TeX \special COMMANDS
       "\special" commands supported by dvilj have the generic syntax

         \special{key1=value key1="value with space"}
         \special{key3 = value key4 = 'note optional spaces around equal sign'}

       I.e., specials are a sequence of key/value pairs, separated by an equal sign. Spaces around the equal sign are ignored. The value is either a space separated word, or a quoted
       string. Both double and single quotes can be used, alternatively. There is no support for quoting quote characters in values; if you want both double and single quotes in one
       value, you're out of luck.

       The following key/value combinations are valid:

       hpfile=file
           Insert file at the current position. file is searched with kpathsea(3), see below.

           The file content must be valid for this printer, i.e., it should contain PCL escape sequences or HP-GL/2 commands. If the file is a graphics file, this typically means that
           the upper left corner of the graphics is placed at the current position.

           PCL absolute positioning escape sequences in file are rewritten to be relative positioning commands; the lowest appearing coordinate is used as reference.

       hpfile_verbatim=file
           Insert file verbatim at the current position, without any changes of the file content. file is searched with kpathsea(3), see below.

           This is mostly used to keep absolute positions in PCL files.

       psfile=file llx=x0 lly=y0 urx=x1 ury=y1 rwi=s
           Convert Postscript file file to HP PCL, by Ghostscript with device "ljetplus", and insert the resulting graphics file at the current position, rewriting absolute position
           escape sequences. file is searched with kpathsea(3), see below.

           The accompanying key/value pairs are mandatory, they can be specified in an arbitrary order. Values x0, x1, y0, y1, and s are integers. (x0,y0) is the lower left corner,
           (x1,y1) the upper right corner of the image.

           Please note: The specific semantics of this special is not known.  In particular, the rwi parameter is some scale factor; but even looking at the source code it is not quite
           clear what the special's author intended to implement here. In addition, it is unclear what dimensions are used to specify the corners, Postscript points or PCL dots.

           If you happen to know the psfile semantics, or if you spent the work analyzing them, please inform us at tex-k@tug.org, so that we can update this man page with the relevant
           information.

       dvilj-psfile-syntax=syntax
           where syntax is either "dvilj" or "ignore". This is a very crude way to tell the driver what to do with psfile specials.

           If the value is "ignore", all psfile specials that are processed afterwards are ignored, until the next dvilj-psfile-syntax special is processed.

           If the value is "dvilj", psfiles specials are processed as explained above, until the next dvilj-psfile-syntax special is processed.

           An obvious, planned, extension is the value "dvips", but this has not been implemented yet.

           That special is not as simple as it sounds at first. Since its semantics is defined by processing order, it is only of use if it is placed on the same page as the psfile
           special. Having it once in a file (e.g., on the first page) does not help if you print just one page of the document -- dvilj does not do prescanning of first-page specials
           like some other drivers do. (Patches would be welcome, of course.)

       comment=arbitrary text
       comment arbitrary text
           This causes the rest of the special to be ignored; it may be used to add meta-information to a DVI file.

           With the first form, the comment may appear anywhere in the special.  When it appears first, the processing of this special is terminated and all other text behind is
           ignored.

           The second form is a speciality that has been introduced for compatibility with other drivers. If the first keyword of the special is comment and has no value, it is taken as
           a valid comment syntax, too; the rest of the special is ignored.

       orientation=po
           Position the page on the physical paper. The value po may be one of the following values:

             0  for portrait
             1  for landscape
             2  for reverse portrait
             3  for reverse landscape

       defpoint=n(x,y)
           Define the point number n. This point can be referred to later in other special commands to specify areas that shall be filled with some pattern. n must be between 0 and 79.

           x and y are the position of that point and have the form "?pt" where "?" is a floating point number. The positions are relative to the DVI page origin; i.e., coordinates
           increase moving right and down, the point of origin is (1in,1in) in the upper left corner, altered by options -x, -y, -X, and -Y, but not by \hoffset and \voffset.

           x and y can be omitted, i.e., the values 3 or "4(,)" are valid. Then the current page position is used as position for point n.

       resetpoints="all"
           This undefines all points again.

       gray=gray_scale
       grey=gray_scale
           This sets the fill mode for the next fill special, the area will be filled with gray color. (grey is an alias for gray.) Any pattern specification is reset.

           gray_scale is the percentage of gray that shall be used here; with 0 meaning white and 100 meaning black.

           Caveat: That special is actually a misnomer. PCL names these gray scales shading patterns and they are created by placing dots in the area. The gray scale selects how far
           spread the dots are. In the lower ranges, this doesn't look very gray on close sight, but more like a dotted background. Furthermore, the gray scales are not as fine-grained
           as the value range 0..100 might make you believe. In reality, there are only 8 different gray patterns available:

              1 -  2%
              3 - 10%
             11 - 20%
             21 - 35%
             36 - 55%
             56 - 80%
             81 - 99%
             100%

           One of these patterns is selected according to the gray_scale value.

       pattern=pat
           This sets the fill mode for the next fill special, the area will be filled with a pattern. Any gray color specification is reset.

           pat is one of the following values:

             1  horizontal lines
             2  vertical lines
             3  diagonal lines, from lower left corner to upper right corner
             4  diagonal lines, from upper right corner to lower left corner
             5  crossed lines, vertically
             6  crossed lines, diagonally

       fill=a/b
           Fill the area between the points a and b, according to the current fill mode.

           Point a must be the upper left corner and point b must be the lower left corner of the rectangle. Otherwise the result is garbage.

           The default fill mode is 10% gray color filling.

       filename
           This is a legacy special, its use is depreciated. If the special is just one word that names an existing file, that file is verbatim included. Contrary to other file
           inclusion means, the file is not searched with kpathsea(3). You are not supposed to use this special and we won't fix any problems with it.

       It should be noted that the special parser does sometimes accept constructs that are not valid as in the documentation above. Then, the output is most often damaged in some way.

   Searching for Included Files
       Proper file include specials search the file with kpathsea(3). The search path is configured by variable "DVILJINPUTS" and, if the file is not found in that search path, by
       variable "TEXINPUTS".

       Search via "DVILJINPUTS" covers the use case that one has common site-wide graphics that shall be included in documents, e.g., scanned signatures. Search via "TEXINPUTS" covers
       the use case that one has graphics as part of ones current document.

       "dvilj" is used as the ".PROGRAM" name in texmf.cnf, for all driver variants, independent of the actual program name.

   Unknown Specials and "TEX_HUSH" configuration
       Kpathsea(3) has the concept of warning suppression with the configuration variable "TEX_HUSH", please refer to its Info node TeX support / Suppressing warnings. That variable
       holds a colon-separated identifiers that specifies the to-be-suppressed warnings.

       If "special" is among the listed values, dvilj does not output warnings any more about specials that it doesn't know about. But if there is a recognized special and if that
       special has an invalid parameter, then a warning is output nevertheless, independent of the content of "TEX_HUSH".

DOUBLE PAGE PRINTING
       If the printer has a duplex unit installed, duplex printing can be demanded with the -d option.

       Otherwise, the command line option -D causes the printer to print in doublepage mode, that is, roughly speaking, printing first the even pages and then the odd pages of a
       document. If -D is used to print both even and odd pages (-D is used without the optional 1 or 2) the following will happen after half of the pages is printed: LJ: the printer
       stops, shows message "FEED" and switches on manual feed led.  The printer continues when either the printed pages are fed into the manual page feeder, or the operator pushes the
       continue button (after placing first the printed pages into the paper tray).

       If -D1 was specified only odd pages will be printed, -D2 can be used for even pages. A trailing "-" (as in -D-, -D1- or -D2-) supresses printing of empty pages which are
       generated for padding otherwise.

       The driver allows the -D option for both print-directions (front-to-back or back-to-front printing). It tries to be clever in certain cases: when a document has an odd number of
       pages it inserts in the right place an empty page when a document starts with page 0 the driver inserts an empty page after the 0-page when a piece of a document is printed that
       starts with an even page-number it prints this page at the backside of the first page to ensure that the odd sides are always on the frontside. The 0-page is treated like an odd
       page.

       The doubleside option works for all LJs, not only for the new D model with does doubleside-printing (actually, I don't know whether it makes much sense on the new LJ II D at
       all).

       Caveat on the doubleside-option: When it is used frequently or on very large files, it might become necessary to clean the printer much more frequently.

       The command line option -pX can be used to abort printing after the output of X pages (can lead to strange results together with -D). I personally dislike this option. The secure
       way of printing a part of a document is using -f (from) and -t (to).

ENVIRONMENT
       dvilj uses the same environment variables and algorithms for finding font files as TeX and its friends do. See the documentation for the kpathsea(3) library for details.
       (Repeating it here is too cumbersome.)

       "DVILJFONTS"
           If set, overrides all other font paths.

       "DVILJMAKEPK"
           If set, overrides mktexpk(1) as the name of the command to execute to create a PK file if one isn't found.

       "DVILJSIZES"
           May be set to indicate which sizes of fonts are available. It should consist of a list of numbers separated by colons. If the list begins with a colon, the system default
           sizes are used, as well. Sizes are expressed in dots per inch; decimals may be used for "pxl" files: for example, a 300 dots per inch file magnified by half a step comes out
           to 1643 dots per five inches, which should be encoded as 328.6.  dvilj tries the actual size of the font before trying any of the given sizes.

       "DVILJINPUTS"
           Primary search path for include files.

       "TEXINPUTS"
           Secondary search path for include files.

       "TEX_HUSH"
           Colon separated list of identifiers that name situations where no warning shall be output. The following identifiers are used:

             checksum  suppress mismatched font checksum warnings
             readable  suppress warnings about unreadable files
             special   suppress warnings about unknown specials
             all       suppress all warning classes above
             none      suppress no warnings

       "KPATHSEA_DEBUG"
           Trace kpathsea(3) lookups; set to -1 for complete tracing.

       "GS_PATH"
           On Windows, this may be the path to Ghostscript; there the default is gswin32c.exe.

           On Unix, this environment variable is not used. Ghostscript is called as gs(1) and must be found over $PATH.

SEE ALSO
       dvihp(1), dvicopy(1), dvips(1), xdvi(1), mktexpk(1), gs(1), kpathsea(3)

       Email bug reports to tex-k@tug.org.

       Source is at <http://mirror.ctan.org/dviware/dviljk/>; but for compilation the texk build environment is needed, from <svn://tug.org/texlive/*/Build/source>.

       As of July 2007, PCL reference documentation is found at HP's Web site at <http://h20000.www2.hp.com/bizsupport/TechSupport/Document.jsp?objectID=bpl04568>.  At the end of that
       page are links to reference manuals for PCL and PJL.

       In case that page is changed, here are the URLs of these documents.  All have the form <http://h20000.www2.hp.com/bc/docs/support/SupportManual/bpl<ID>/bpl<ID>.pdf>, where "<ID>"
       is the following document ID:

       13205
           PCL 5 Technical Quick Reference Guide. This is the 1st thing to look up if you have questions about PCL escape sequences.

       13210 and 13211
           PCL 5 Technical Reference Manual (part I and II). This is the full-detailled explanation that you need to look up if you don't understand how the printer works. Part I is the
           actual manual, part II explains HP-GL/2 and has overall tips.

       13208 and 13207
           PJL Technical Reference Manual (and addendum)

       13212
           PCL 5 Color Manual. This explains color specials for the newer HP printers. (Not of much use today; for practical purposes we would need to add color specials to dvilj
           first.)

       13206 and 13209
           Comparison Guide (and addendum) that documents which PCL escape sequences are supported on which HP printers.

AUTHOR
       dvi2xx by Gustaf Neumann, Wirtschaftsuniversitaet Wien.

       dviljk fork by Karl Berry.

       Joachim Schrod <jschrod@acm.org> supplied security fixes and updated this man page.

LICENSE
       dvi2xx is public domain software. dviljk changes are covered by the GNU General Public License.

Version 2.6p5                                                                           2012-03-12                                                                               DVILJ(1)
