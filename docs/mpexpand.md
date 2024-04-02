mpexpand(1)                                                    Documentation toolbox                                                   mpexpand(1)

__________________________________________________________________________________________________________________________________________________

NAME
       mpexpand - Markup processor

SYNOPSIS
       mpexpand ?-module module? format infile|- outfile|-

       mpexpand.all ?-verbose? ?module?

__________________________________________________________________________________________________________________________________________________

DESCRIPTION
       This  manpage  describes  a  processor / converter for manpages in the doctools format as specified in doctools_fmt. The processor is based
       upon the package doctools.

       mpexpand ?-module module? format infile|- outfile|-
              The processor takes three arguments, namely the code describing which formatting to generate as the output, the  file  to  read  the
              markup from, and the file to write the generated output into. If the infile is "-" the processor will read from stdin. If outfile is
              "-" the processor will write to stdout.

              If the option -module is present its value overrides the internal definition of the module name.

              The currently known output formats are

              nroff  The processor generates *roff output, the standard format for unix manpages.

              html   The processor generates HTML output, for usage in and display by web browsers.

              tmml   The processor generates TMML output, the Tcl Manpage Markup Language, a derivative of XML.

              latex  The processor generates LaTeX output.

              wiki   The processor generates Wiki markup as understood by wikit.

              list   The processor extracts the information provided by manpage_begin.

              null   The processor does not generate any output.

       mpexpand.all ?-verbose? ?module?
              This command uses mpexpand to generate all possible output formats for all manpages in the current directory. The manpages are  rec‐
              ognized through the extension ".man". If -verbose is specified the command will list its actions before executing them.

              The module information is passed to mpexpand.

NOTES
       Possible future formats are plain text, pdf and postscript.

BUGS, IDEAS, FEEDBACK
       This document, and the package it describes, will undoubtedly contain bugs and other problems.  Please report such in the category doctools
       of the Tcllib Trackers [http://core.tcl.tk/tcllib/reportlist].  Please also report any ideas for enhancements you may have for either pack‐
       age and/or documentation.

SEE ALSO
       expander(3tcl), format(3tcl), formatter(3tcl)

KEYWORDS
       HTML, TMML, conversion, manpage, markup, nroff

CATEGORY
       Documentation tools

COPYRIGHT
       Copyright (c) 2002 Andreas Kupries <andreas_kupries@users.sourceforge.net>
       Copyright (c) 2003 Andreas Kupries <andreas_kupries@users.sourceforge.net>

tcllib                                                                  1.0                                                            mpexpand(1)
