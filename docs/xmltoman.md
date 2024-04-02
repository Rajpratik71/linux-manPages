xmltoman(1)                                                                                General Commands Manual                                                                                xmltoman(1)



NAME
       xmltoman - xml to man converter

SYNOPSIS
       xmltoman file.1.xml > file.1

DESCRIPTION
       xmltoman  is  a  small script to convert xml to a man page in groff format. It features the usual man page items such a description, options, see also etc. The xml format also supports converting to
       html pages.

       You will find the dtd in /usr/share/xmltoman/ on a debian system. There is also an xsl file to generate html using xsltproc(1). See also /usr/share/doc/xmltoman/examples for examples.

FILES
       /usr/share/xmltoman/xmltoman.dtd the DTD file.

       /usr/share/xmltoman/xmltoman.xsl XSLT stylesheet to generate html.

       /usr/share/xmltoman/xmltoman.css stylesheet to be used for HTML.

AUTHOR
       xmltoman was written by Oliver Kurth <oku@masqmail.cx>

SEE ALSO
       xmlmantohtml(1)

COMMENTS
       This man page was written using xmltoman(1) by the same author.



Manuals                                                                                              User                                                                                         xmltoman(1)
