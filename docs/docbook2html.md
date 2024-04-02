JW(1)                                                                                                                                                                                                   JW(1)



NAME
       jw, docbook2dvi, docbook2html, docbook2man, docbook2pdf, docbook2ps, docbook2rtf, docbook2tex, docbook2texi, docbook2txt - (Jade Wrapper) converts SGML files to other formats

SYNOPSIS
       jw [ -f frontend | --frontend frontend ]
           [ -b backend | --backend backend ]
           [ -c file | --cat file ]
           [ -n | --nostd ]
           [ -d file|default|none | --dsl file|default|none ]
           [ -l file | --dcl file ]
           [ -s path | --sgmlbase path ]
           [ -p program | --parser program ]
           [ -o directory | --output directory ]
           [ -V variable[=value] ]
           [ -u | --nochunks ] [ -i section | --include section ]
           [ -w type|list | --warning type|list ]
           [ -e type|list | --error type|list ]
           [ -h | --help ] [ -v | --version ]
           SGML-file


       docbook2dvi SGML-file


       docbook2html SGML-file


       docbook2man SGML-file


       docbook2pdf SGML-file


       docbook2ps SGML-file


       docbook2rtf SGML-file


       docbook2tex SGML-file


       docbook2texi SGML-file


       docbook2txt SGML-file


DESCRIPTION
       The  jw  shell script allows to convert a DocBook file (or some other SGML-based format) to other formats (including HTML, RTF, PS and PDF) with an easy-to-understand syntax. It hides most of Jade's
       or OpenJade complexity and adds comfortable features.

       Other scripts like docbook2html, docbook2rtf or docbook2ps provide different ways of calling jw that might be easier to remember.

       For the moment, jw does not handle XML, but only SGML.

       This utility assumes that several other components are installed. The list includes:

       · the ISO character entities for SGML

       · James Clark's DSSSL engine, jade, or an equivalent parser like OpenJade

       · the DocBook DTD from the OASIS consortium

       · Norman Walsh's DocBook modular style sheets (or some other set of DSSSL style sheets)

       · Sebastian Rahtz's jadetex set of TeX macros for jade (for backends intended to "printing" formats like PDF, RTF or PostScript)

       · A perl interpreter (for backends that use perl)

       · SGMLSpm from CPAN (for backends that use sgmls)

       · Lynx HTML browser (for the txt backend)

       The jw script is basically called like this:

       jw mydoc.sgml

       where mydoc.sgml is a SGML file.

       The command line above uses default options: it converts from DocBook (the default frontend) to HTML (the default backend), does not put the result in a subdirectory (unless specified  otherwise  in
       the style sheets), etc.

       In  this  example,  the "mydoc" file name as well as the ".sgml" extension can be replaced by anything else. Current extensions for SGML DocBook files include ".sgml", ".sgm", ".docbook", and ".db".
       The processed file mydoc.sgml can be in any other directory than the current one.

       Here we have chosen to generate HTML output. In fact we can use any of the backends stored in the backends/ subdirectory of the DocBook-utils  distribution  directory  (usually  /usr/share/sgml/doc‐
       book/utils-0.6.14).  Similarly, you can use any frontend defined in the frontends/ subdirectory to convert from another input format.

       This  sample  command  creates one or many HTML files with arbitrary file names in the current directory. This default behavior can be changed through command line options and/or customization style
       sheets.

OPTIONS
       The following options apply to the conversion script:

          -f frontend | --frontend frontend
              Allows to specify another frontend than default docbook.  The list of currently available frontends is:

              docbook
                     Converts docbook with Norman Walsh's style sheets. This frontend searches in the subdirectories of the base SGML directory  for  a  file  named  html/docbook.dsl  or  print/docbook.dsl
                     (depending on the backend's type: html or print).

          -b backend | --backend backend
              Allows to specify another backend than default HTML. The list of currently available backends is:

              dvi    Converts to DVI (DeVice Independant files) by calling Jade or OpenJade.

              html   Converts to HTML (HyperText Markup Language) by calling Jade or OpenJade.

              man    Converts a refentry to a Unix manual page by calling docbook2man. Does not work with other SGML document types than DocBook.

              pdf    Converts to PDF (Portable Document Format) by calling Jade or OpenJade.

              ps     Converts to PostScript by calling Jade or OpenJade.

              rtf    Converts to RTF (Rich Text Format) by calling Jade or OpenJade. The resulting file can then be inported into MS Word or one of its Linux replacement programs.

                     Note - The original picture must be present when RTF document is viewed, because the RTF documents created by OpenJade includes pictures by reference.

              tex    Converts to TeX by calling Jade or OpenJade.

              texi   Converts to GNU TeXinfo pages by calling docbook2texi. Does not work with other SGML document types than DocBook.

              txt    Converts to a bare text file by calling Jade or OpenJade, then Lynx.

          -c file | --cat file
              Allows to use an extra SGML Open Catalog that will list other files like customization style sheets, adaptations to the DocBook Document Type Definition, special character entities, etc. This
              catalog is added to the list of catalogs determined by the script (see option --nostd below)

          -n | --nostd
              Do not use the standard SGML Open Catalogs. Normally, the standard catalogs list is determined like this:

              · if the centralized catalog exists, then use it. The centralized catalog is a list of all catalogs that might be necessary that usually resides in /etc/sgml. Its  name  is  provided  by  the
                frontend, for example the docbook frontend returns /etc/sgml/sgml-docbook.cat.

              · Otherwise, take all the files named catalog from the subdirectories of the SGML base directory (usually /usr/share/sgml).
       This option is useful in conjunction with the --cat option to use only the catalogs that are specified on the command line.

          -d file|default|none | --dsl file|default|none
              Allows to use a customized style sheet instead of the default one.

              A  "target" starting with a hash mark "#" can be appended to the file name. As a result, only the corresponding part of the style sheet is executed (the "style specification" whose "identifi‐
              cator" is equal to the target's name). A common use of this mechanism is to define "#html" and "#print" targets to trigger the corresponding part  of a replacement style sheet which is common
              for both HTML and printout conversion.

              By replacing the file name with "default", the default style sheet provided with the frontend is used. For example, the docbook frontend returns ./docbook.dsl#html (or ./docbook.dsl#print) in
              the SGML base directory.

              By replacing the file name with "none", no replacement style sheet is used, not even the default style sheet. The style sheet which is used is also determined by the  frontend.  For  example,
              the docbook frontend returns Norman Walsh's html/docbook.dsl (or print/docbook.dsl) found somewhere below the SGML base directory.

              If no --dsl option is specified, then "--dsl default" is used.

          -l file | --dcl file
              Allows  to use a customized SGML declaration instead of the default one. The file name of the default SGML declaration is not set for SGML files, and is set to xml.dcl in the SGML base direc‐
              tory for XML files.

          -s path | --sgmlbase path
              Allows to use another location for the SGML base directory. This is the directory below which all SGML DTDs, style sheets, entities, etc are installed. The default value is /usr/share/sgml.

          -p program | --parser program
              Specify the parser to use (Jade or OpenJade) if several are installed. If this option is not specified, the script first tries to use Jade, then it tries OpenJade.

          -o directory | --output directory
              Set output directory where all the resulting files will be stored. If the style sheets define a subdirectory where to store the resulting files too, the  subdirectory  defined  by  the  style
              sheets will be placed below the subdirectory defined by this option.

          -V variable=[value]
              Set a variable (to a value, if one is specified).

          -u | --nochunks
              Output  only one big file. This option is useful only when generating HTML, because the output can be split into several files. This option overrides the setting that may be done in the style
              sheets.

          -i section | --include section
              Declare a SGML marked section as "include". A SGML marked section is a kind of conditional part of a document. If it is declared "ignore", it will be left ignored, otherwise it will  be  pro‐
              cessed. An example of such a marked section would be:

                   <DOCTYPE mydoc [
                     <!ENTITY % confidential "ignore">
                   ]>
                   <mydoc>
                     ...
                     <![ %confidential [ Some confidential text... ]]>
                     ...
                   </mydoc>


          -w type|list | --warning type|list
              Enables  or disables the display of given types of warnings.  Several -w options might be entered on the command line.  Warning types that start with "no-" disable the corresponding warnings,
              the other types enable them.

              If the warning type is replaced with "list", then a list of allowed warning types is displayed.

          -e type|list | --error type|list
              Disables given types of errors.  Several -e options might be entered on the command line.  All error types start with "no-".

              If the error type is replaced with "list", then a list of allowed error types is displayed.

          -h | --help
              Print a short help message and exit

          -v | --version
              Print the version identifier and exit

FILES
       /etc/sgml/sgml-docbook.cat
              Centralized SGML open catalog. This file name might vary if another frontend than docbook is used.

       /usr/share/sgml/docbook/utils-0.6.14/backends
              The various backends

       /usr/share/sgml/docbook/utils-0.6.14/frontends
              The various frontends

       /usr/share/sgml/docbook/utils-0.6.14/helpers
              The various helper scripts like docbook2man or docbook2texi

AUTHORS
       Eric Bischoff (jw shell script and a few backends), Jochem Huhmann (the man and texi backends)

SEE ALSO
       docbook2man-spec.pl(1), docbook2texi-spec.pl(1), install-catalog(8), nsgmls(1), docbook-utils homepage <URL:http://sources.redhat.com/docbook-tools/>.



                                                                                               11 February 2004                                                                                         JW(1)
