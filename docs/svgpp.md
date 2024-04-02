SVGPP(1)                                                           User Commands                                                          SVGPP(1)

NAME
       svgpp - pretty-printer for SVG files

svgpp
       [options] <input file> [<output file>]

DESCRIPTION
       svgpp pretty-prints SVG code to standard output.

OPTIONS
       -xml-decl <string>
              The value to set to the XML declaraction.

       -system-id <string>

              The value to set to the system ID of the doctype.

       -tab-width <number>

              Sets the tabulation width. The default is 4.

       -doc-width <number>
              Sets the document preferred number of columns. The default is 80.

       -no-format
              Disables any formatting. Useful for doctype modifications, newline conversion, ...

       -public-id <string>
              The value to set to the public ID of the doctype.

       -newline (cr | cr-lf | lf)
              Specifies the type of newline to output. Possible values are: cr (mac), cr-lf (dos), lf (unix - the default).

       -doctype (change | remove)
              Removes or changes the DOCTYPE declaration. change is used in conjonction with the -public-id and -system-id options.

JAVA-WRAPPERS NOTE
       This  program  is a shell script wrapper based on java-wrappers(7).  You therefore benefit from several features; please see the java-wrap‐
       pers(7) manual page for more information about them.

AUTHORS
       svgpp is part of batik, written by the Apache Software Foundation.

       This manual page was written by Vincent Fourmond <fourmond@debian.org> for the Debian Project, but may be used by others.

SEE ALSO
       The web page of batik, http://xml.apache.org/batik

       java-wrappers(7)

Pretty printer for SVG                                             January 2008                                                           SVGPP(1)
