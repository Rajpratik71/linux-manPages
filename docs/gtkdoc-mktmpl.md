gtkdoc-mktmpl(1)                                              General Commands Manual                                             gtkdoc-mktmpl(1)

NAME
       gtkdoc-mktmpl —  GTK DocBook documentation generator.

SYNOPSIS
       gtkdoc-mktmpl [ See below ]

DESCRIPTION
       gtkdoc-mktmpl This creates or updates the template files which contain the manually-edited documentation. (A template is a simple text form
       which is filled in with the description of a function, macro, enum, or struct.  For functions  and  macros  it  also  contains  fields  for
       describing the parameters.)

       This script reads in the existing templates, found in tmpl/*.sgml, moves these files to tmpl/*.sgml.bak, and then recreates the .sgml files
       according to the structure given in the file MODULE-sections.txt.

       Any new templates added, or new function parameters, are marked with FIXME so you can do a grep to see which parts need updating.

       Any templates which are no longer used (i.e. they are remove from MODULE-sections.txt) are placed in the  file  tmpl/MODULE-unused.txt.  If
       they are included again later they are automatically copied back into position.  If you are certain that these templates will never be used
       again you can delete them from MODULE-unused.txt.

       Any parameters to functions which are no longer used are separated from the rest of the parameters with the line <!-- # Unused Parameters #
       -->.  It  may  be  that  the parameter name has just been changed, in which case you can copy the description to the parameter with the new
       name. You can delete the unused parameter descriptions when no longer needed.

EXAMPLE
       See /usr/share/doc/gtk-doc-tools/examples, for a makefile.am and a configure.in example file.

AUTHOR
       This manual page was written by Christian Marillat marillat@debian.org for the Debian GNU/Linux system (but may be used by others).

                                                                                                                                  gtkdoc-mktmpl(1)
