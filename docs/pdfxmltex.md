XMLTEX(1)                                                                                  General Commands Manual                                                                                  XMLTEX(1)



NAME
       xmltex, pdfxmltex - xml non-validating parser in TeX

SYNOPSIS
       xmltex xml file
       pdfxmltex xml file

DESCRIPTION
       This  manual  page documents briefly the xmltex, and pdfxmltex commands.  This manual page was written for the Debian GNU/Linux distribution because the original program does not have a manual page.
       Instead, it has documentation in HTML and PS format in the /usr/share/doc/xmltex directory.

       xmltex and pdfxmltex is a TeX XML parser able to transform XML documents into .dvi files.  xmltex knows nothing about your XML files.  It needs to load some special macros files,  usually  with  the
       .xmt extension.  A configuration file, either named xmltex.cfg or \jobname.cfg, is parsed.  An especially useful configuration command is \xmltraceoff which disables XML elements tracing.

       xmltex already knows about many XML schemata, such as TEI, TEI.2, MathML, SEC, HTML and XSL-FO, the support for the latest being provided by the passivetex package.

SEE ALSO
       The programs are documented fully in their own manual in the /usr/share/doc/xmltex directory.
       latex(1), tex(1)

AUTHOR
       This manual page was written by Fabien Niñoles <fabien@debian.org>, for the Debian GNU/Linux system (but may be used by others).



                                                                                                                                                                                                    XMLTEX(1)
