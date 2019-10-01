PDFTEX(1)                                                                                         Web2C 2012                                                                                        PDFTEX(1)



NAME
       pdftex, pdfinitex, pdfvirtex - PDF output from TeX

SYNOPSIS
       pdftex [options] [&format] [file|\commands]

DESCRIPTION
       Run  the  pdfTeX  typesetter on file, usually creating file.pdf.  If the file argument has no extension, ".tex" will be appended to it.  Instead of a filename, a set of pdfTeX commands can be given,
       the first of which must start with a backslash.  With a &format argument pdfTeX uses a different set of precompiled commands, contained in format.fmt; it is usually better to  use  the  -fmt  format
       option instead.

       pdfTeX is a version of TeX, with the e-TeX extensions, that can create PDF files as well as DVI files.

       In DVI mode, pdfTeX can be used as a complete replacement for the TeX engine.

       The  typical  use  of  pdfTeX is with a pregenerated formats for which PDF output has been enabled.  The pdftex command uses the equivalent of the plain TeX format, and the pdflatex command uses the
       equivalent of the LaTeX format.  To generate formats, use the -ini switch.

       The pdfinitex and pdfvirtex commands are pdfTeX's analogues to the initex and virtex commands.  In this installation, if the links exist, they are symbolic links to the pdftex executable.

       In PDF mode, pdfTeX can natively handle the PDF, JPG, JBIG2, and PNG graphics formats.  pdfTeX cannot include PostScript or Encapsulated PostScript (EPS) graphics files; first convert  them  to  PDF
       using epstopdf(1).  pdfTeX's handling of its command-line arguments is similar to that of of the other TeX programs in the web2c implementation.

OPTIONS
       This version of pdfTeX understands the following command line options.

       -draftmode
              Sets \pdfdraftmode so pdfTeX doesn't write a PDF and doesn't read any included images, thus speeding up execution.

       -enc   Enable the encTeX extensions.  This option is only effective in combination with -ini.  For documentation of the encTeX extensions see http://www.olsak.net/enctex.html.

       -etex  Enable the e-TeX extensions.  This option is only effective in combination with -ini.  See etex(1).

       -file-line-error
              Print error messages in the form file:line:error which is similar to the way many compilers format them.

       -no-file-line-error
              Disable printing error messages in the file:line:error style.

       -file-line-error-style
              This is the old name of the -file-line-error option.

       -fmt format
              Use format as the name of the format to be used, instead of the name by which pdfTeX was called or a %& line.

       -halt-on-error
              Exit with an error code when an error is encountered during processing.

       -help  Print help message and exit.

       -ini   Start in INI mode, which is used to dump formats.  The INI mode can be used for typesetting, but no format is preloaded, and basic initializations like setting catcodes may be required.

       -interaction mode
              Sets the interaction mode.  The mode can be either batchmode, nonstopmode, scrollmode, and errorstopmode.  The meaning of these modes is the same as that of the corresponding \commands.

       -ipc   Send DVI or PDF output to a socket as well as the usual output file.  Whether this option is available is the choice of the installer.

       -ipc-start
              As -ipc, and starts the server at the other end as well.  Whether this option is available is the choice of the installer.

       -jobname name
              Use name for the job name, instead of deriving it from the name of the input file.

       -kpathsea-debug bitmask
              Sets path searching debugging flags according to the bitmask.  See the Kpathsea manual for details.

       -mktex fmt
              Enable mktexfmt, where fmt must be either tex or tfm.

       -mltex Enable MLTeX extensions.  Only effective in combination with -ini.

       -no-mktex fmt
              Disable mktexfmt, where fmt must be either tex or tfm.

       -output-comment string
              In DVI mode, use string for the DVI file comment instead of the date.  This option is ignored in PDF mode.

       -output-directory directory
              Write output files in directory instead of the current directory.  Look up input files in directory first, the along the normal search path.

       -output-format format
              Set the output format mode, where format must be either pdf or dvi.  This also influences the set of graphics formats understood by pdfTeX.

       -parse-first-line
              If the first line of the main input file begins with %& parse it to look for a dump name or a -translate-file option.

       -no-parse-first-line
              Disable parsing of the first line of the main input file.

       -progname name
              Pretend to be program name.  This affects both the format used and the search paths.

       -recorder
              Enable the filename recorder.  This leaves a trace of the files opened for input and output in a file with extension .fls.

       -shell-escape
              Enable the \write18{command} construct.  The command can be any shell command.  This construct is normally disallowed for security reasons.

       -no-shell-escape
              Disable the \write18{command} construct, even if it is enabled in the texmf.cnf file.

       -src-specials
              In DVI mode, insert source specials into the DVI file.  This option is ignored in PDF mode.

       -src-specials where
              In  DVI  mode,  insert source specials in certain placed of the DVI file.  where is a comma-separated value list: cr, display, hbox, math, par, parent, or vbox.  This option is ignored in PDF
              mode.

       -translate-file tcxname
              Use the tcxname translation table to set the mapping of input characters and re-mapping of output characters.

       -default-translate-file tcxname
              Like -translate-file except that a %& line can overrule this setting.

       -version
              Print version information and exit.

ENVIRONMENT
       See the Kpathsearch library documentation (the `Path specifications' node) for precise details of how the environment variables are used.  The kpsewhich utility can be used to query  the  values  of
       the variables.

       One  caveat:  In  most  pdfTeX formats, you cannot use ~ in a filename you give directly to pdfTeX, because ~ is an active character, and hence is expanded, not taken as part of the filename.  Other
       programs, such as Metafont, do not have this problem.

       TEXMFOUTPUT
              Normally, pdfTeX puts its output files in the current directory.  If any output file cannot be opened there, it tries to open it in the directory specified in the environment  variable  TEXM‐
              FOUTPUT.   There  is no default value for that variable.  For example, if you say pdftex paper and the current directory is not writable and TEXMFOUTPUT has the value /tmp, pdfTeX attempts to
              create /tmp/paper.log (and /tmp/paper.pdf, if any output is produced.)  TEXMFOUTPUT is also checked for input files, as TeX often generates files that need to be subsequently read; for input,
              no suffixes (such as ``.tex'') are added by default, the input name is simply checked as given.

       TEXINPUTS
              Search  path for \input and \openin files.  This should start with ``.'', so that user files are found before system files.  An empty path component will be replaced with the paths defined in
              the texmf.cnf file.  For example, set TEXINPUTS to ".:/home/user/tex:" to prepend the current directory and ``/home/user/tex'' to the standard search path.

       TEXFORMATS
              Search path for format files.

       TEXPOOL
              search path for pdftex internal strings.

       TEXEDIT
              Command template for switching to editor.  The default, usually vi, is set when pdfTeX is compiled.

       TFMFONTS
              Search path for font metric (.tfm) files.

FILES
       The location of the files mentioned below varies from system to system.  Use the kpsewhich utility to find their locations.

       pdftex.pool
              Text file containing pdfTeX's internal strings.

       pdftex.map
              Filename mapping definitions.

       *.tfm  Metric files for pdfTeX's fonts.

       *.fmt  Predigested pdfTeX format (.fmt) files.

NOTES
       Starting with version 1.40, pdfTeX incorporates the e-TeX extensions, and pdfeTeX is just a copy of pdfTeX.  See etex(1).  This manual page is not meant to be exhaustive.  The complete documentation
       for this version of pdfTeX can be found in the pdfTeX manual and the info manual Web2C: A TeX implementation.

BUGS
       This  version of pdfTeX implements a number of optional extensions.  In fact, many of these extensions conflict to a greater or lesser extent with the definition of pdfTeX.  When such extensions are
       enabled, the banner printed when pdfTeX starts is changed to print pdfTeXk instead of pdfTeX.

       This version of pdfTeX fails to trap arithmetic overflow when dimensions are added or subtracted.  Cases where this occurs are rare, but when it does the generated DVI file will be invalid.  Whether
       a generated PDF file would be usable is unknown.

AVAILABILITY
       pdfTeX is available for a large variety of machine architectures and operation systems.  pdfTeX is part of all major TeX distributions.

       Information on how to get pdfTeX and related information is available at the http://www.pdftex.org pdfTeX web site.

       The  following  pdfeTeX  related  mailing list is available: pdftex@tug.org.  This is a mailman list; to subscribe send a message containing subscribe to pdftex-request@tug.org.  A web interface and
       list archives can be found at the http://lists.tug.org/pdftex mailing list web site.

SEE ALSO
       epstopdf(1), etex(1), latex(1), mptopdf(1), tex(1), mf(1).  http://tug.org/applications/pdftex, http://tug.org/web2c.

AUTHORS
       The primary authors of pdfTeX are Han The Thanh, Petr Sojka, Jiri Zlatuska, and Peter Breitenlohner (eTeX).

       TeX was designed by Donald E. Knuth, who implemented it using his Web system for Pascal programs.  It was ported to Unix at Stanford by Howard Trickey, and at Cornell by Pavel Curtis.   The  version
       now offered with the Unix TeX distribution is that generated by the Web to C system (web2c), originally written by Tomas Rokicki and Tim Morgan.

       The encTeX extensions were written by Petr Olsak.



pdftex 1.40                                                                                      1 March 2011                                                                                       PDFTEX(1)
