dtplite(1)                                                     Documentation toolbox                                                    dtplite(1)

__________________________________________________________________________________________________________________________________________________

NAME
       dtplite - Lightweight DocTools Markup Processor

SYNOPSIS
       dtplite -o output ?options? format inputfile

       dtplite validate inputfile

       dtplite -o output ?options? format inputdirectory

       dtplite -merge -o output ?options? format inputdirectory

__________________________________________________________________________________________________________________________________________________

DESCRIPTION
       The  application described by this document, dtplite, is the successor to the extremely simple mpexpand. Influenced in its functionality by
       the dtp doctools processor it is much more powerful than mpexpand, yet still as easy to use; definitely easier than dtp with its myriad  of
       subcommands and options.

       dtplite is based upon the package doctools, like the other two processors.

   USE CASES
       dtplite was written with the following three use cases in mind.

       [1]    Validation  of  a  single  document, i.e. checking that it was written in valid doctools format. This mode can also be used to get a
              preliminary version of the formatted output for a single document, for display in a browser, nroff, etc., allowing  proofreading  of
              the formatting.

       [2]    Generation of the formatted documentation for a single package, i.e. all the manpages, plus a table of contents and an index of key‐
              words.

       [3]    An extension of the previous mode of operation, a method for the easy generation of one documentation tree for several packages, and
              especially of a unified table of contents and keyword index.

       Beyond  the  above  we  also  want  to make use of the customization features provided by the HTML formatter. It is not the only format the
       application should be able to generate, but we anticipiate it to be the most commonly used, and it is one of the few which do provide  cus‐
       tomization hooks.

       We  allow the caller to specify a header string, footer string, a stylesheet, and data for a bar of navigation links at the top of the gen‐
       erated document.  While all can be set as long as the formatting engine provides an appropriate engine parameter (See section OPTIONS)  the
       last two have internal processing which make them specific to HTML.

   COMMAND LINE
       dtplite -o output ?options? format inputfile
              This is the form for use case [1]. The options will be explained later, in section OPTIONS.

              path output (in)
                     This  argument  specifies  where  to write the generated document. It can be the path to a file or directory, or -.  The last
                     value causes the application to write the generated documented to stdout.

                     If the output does not exist then [file dirname $output] has to exist and must be a writable directory.  The generated  docu‐
                     ment  will  be written to a file in that directory, and the name of that file will be derived from the inputfile, the format,
                     and the value given to option -ext (if present).

              (path|handle) format (in)
                     This argument specifies the formatting engine to use when processing the input, and thus the format of  the  generated  docu‐
                     ment. See section FORMATS for the possibilities recognized by the application.

              path inputfile (in)
                     This argument specifies the path to the file to process. It has to exist, must be readable, and written in doctools format.

       dtplite validate inputfile
              This is a simpler form for use case [1]. The "validate" format generates no output at all, only syntax checks are performed. As such
              the specification of an output file or other options is not necessary and left out.

       dtplite -o output ?options? format inputdirectory
              This is the form for use case [2]. It differs from the form for use case [1] by having  the  input  documents  specified  through  a
              directory  instead  of a file. The other arguments are identical, except for output, which now has to be the path to an existing and
              writable directory.

              The input documents are all files in inputdirectory or any of its subdirectories which were recognized by fileutil::fileType as con‐
              taining text in doctools format.

       dtplite -merge -o output ?options? format inputdirectory
              This is the form for use case [3]. The only difference to the form for use case [2] is the additional option -merge.

              Each such call will merge the generated documents coming from processing the input documents under inputdirectory or any of its sub‐
              directories to the files under output. In this manner it is possible to incrementally build the unified documentation for any number
              of packages. Note that it is necessary to run through all the packages twice to get fully correct cross-references (for formats sup‐
              porting them).

   OPTIONS
       This section describes all the options available to the user of the application, with the exception of the options -o and -merge. These two
       were described already, in section COMMAND LINE.

       -exclude string
              This  option  specifies  an  exclude (glob) pattern. Any files identified as manpages to process which match the exclude pattern are
              ignored. The option can be provided multiple times, each usage adding an additional pattern to the list of exclusions.

       -ext string
              If the name of an output file has to be derived from the name of an input file it will use the name of the format as  the  extension
              by  default.  This option here will override this however, forcing it to use string as the file extension. This option is ignored if
              the name of the output file is fully specified through option -o.

              When used multiple times only the last definition is relevant.

       -header file
              This option can be used if and only if the selected format provides an engine parameter named "header". It takes the contents of the
              specified  file  and  assign them to that parameter, for whatever use by the engine. The HTML engine will insert the text just after
              the tag <body>.  If navigation buttons are present (see option -nav below), then the HTML generated for  them  is  appended  to  the
              header data originating here before the final assignment to the parameter.

              When used multiple times only the last definition is relevant.

       -footer file
              Like  -header,  except  that: Any navigation buttons are ignored, the corresponding required engine parameter is named "footer", and
              the data is inserted just before the tag </body>.

              When used multiple times only the last definition is relevant.

       -style file
              This option can be used if and only if the selected format provides an engine parameter named "meta". When specified it will  gener‐
              ate  a piece of HTML code declaring the file as the stylesheet for the generated document and assign that to the parameter. The HTML
              engine will insert this inot the document, just after the tag <head>.

              When processing an input directory the stylesheet file is copied into the output directory and the generated HTML will refer to  the
              copy,  to  make  the  result more self-contained. When processing an input file we have no location to copy the stylesheet to and so
              just reference it as specified.

              When used multiple times only the last definition is relevant.

       -toc path
              This option specifies a doctoc file to use for the table of contents instead of generating our own.

              When used multiple times only the last definition is relevant.

       -pre+toc label path|text

       -post+toc label path|text
              This option specifies additional doctoc files (or texts) to use in the navigation bar.

              Positioning and handling of multiple uses is like for options -prenav and -postnav, see below.

       -nav label url

       -prenav label url
              Use this option to specify a navigation button with label to display and the url to link to. This option can be used if and only  if
              the  selected  format  provides  an engine parameter named "header". The HTML generated for this is appended to whatever data we got
              from option -header before it is inserted into the generated documents.

              When used multiple times all definitions are collected and a navigation bar is created, with the first definition shown at the  left
              edge and the last definition to the right.

              The  url  can  be  relative. In that case it is assumed to be relative to the main files (TOC and Keyword index), and will be trans‐
              formed for all others to still link properly.

       -postnav label url
              Use this option to specify a navigation button with label to display and the url to link to. This option can be used if and only  if
              the  selected  format  provides  an engine parameter named "header". The HTML generated for this is appended to whatever data we got
              from option -header before it is inserted into the generated documents.

              When used multiple times all definitions are collected and a navigation bar is created, with the last definition shown at the  right
              edge and the first definition to the left.

              The  url  can  be  relative. In that case it is assumed to be relative to the main files (TOC and Keyword index), and will be trans‐
              formed for all others to still link properly.

   FORMATS
       At first the format argument will be treated as a path to a tcl file containing the code for the requested formatting engine. The  argument
       will be treated as the name of one of the predefined formats listed below if and only if the path does not exist.

       Note  a  limitation: If treating the format as path to the tcl script implementing the engine was sucessful, then this script has to imple‐
       ment not only the engine API for doctools, i.e.  doctools_api, but for doctoc_api and docidx_api as well. Otherwise the generation of a ta‐
       ble of contents and of a keyword index will fail.

       List of predefined formats, i.e. as provided by the package doctools:

       nroff  The processor generates *roff output, the standard format for unix manpages.

       html   The  processor  generates HTML output, for usage in and display by web browsers. This engine is currently the only one providing the
              various engine parameters required for the additional customaization of the output.

       tmml   The processor generates TMML output, the Tcl Manpage Markup Language, a derivative of XML.

       latex  The processor generates LaTeX output.

       wiki   The processor generates Wiki markup as understood by wikit.

       list   The processor extracts the information provided by manpage_begin.  This format is used internally to  extract  the  meta  data  from
              which both table of contents and keyword index are derived from.

       null   The processor does not generate any output. This is equivalent to validate.

   DIRECTORY STRUCTURES
       In this section we describe the directory structures generated by the application under output when processing all documents in an inputdi‐
       rectory. In other words, this is only relevant to the use cases [2] and [3].

       [2]    The following directory structure is created when processing a single set of input documents.  The file extension used is for output
              in HTML, but that is not relevant to the structure and was just used to have proper file names.

                  output/
                      toc.html
                      index.html
                      files/
                          path/to/FOO.html

              The last line in the example shows the document generated for a file FOO located at

                  inputdirectory/path/to/FOO

       [3]    When merging many packages into a unified set of documents the generated directory structure is a bit deeper:

                  output
                      .toc
                      .idx
                      .tocdoc
                      .idxdoc
                      .xrf
                      toc.html
                      index.html
                      FOO1/
                          ...
                      FOO2/
                          toc.html
                          files/
                              path/to/BAR.html

              Each of the directories FOO1, ... contains the documents generated for the package FOO1, ... and follows the structure shown for use
              case [2]. The only exception is that there is no per-package index.

              The files ".toc", ".idx", and ".xrf" contain the internal status of the whole output and will  be  read  and  updated  by  the  next
              invokation.  Their  contents will not be documented. Remove these files when all packages wanted for the output have been processed,
              i.e. when the output is complete.

              The files ".tocdoc", and ".idxdoc", are intermediate files in doctoc and docidx markup, respectively, containing the main  table  of
              contents  and  keyword  index for the set of documents before their conversion to the chosen output format.  They are left in place,
              i.e. not deleted, to serve as demonstrations of doctoc and docidx markup.

BUGS, IDEAS, FEEDBACK
       This document, and the package it describes, will undoubtedly contain bugs and other problems.  Please report such in the category doctools
       of the Tcllib Trackers [http://core.tcl.tk/tcllib/reportlist].  Please also report any ideas for enhancements you may have for either pack‐
       age and/or documentation.

SEE ALSO
       docidx introduction, doctoc introduction, doctools introduction

KEYWORDS
       HTML, TMML, conversion, docidx, doctoc, doctools, manpage, markup, nroff

CATEGORY
       Documentation tools

COPYRIGHT
       Copyright (c) 2004-2013 Andreas Kupries <andreas_kupries@users.sourceforge.net>

tcllib                                                                 1.0.5                                                            dtplite(1)
