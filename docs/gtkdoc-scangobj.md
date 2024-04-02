gtkdoc-scanobj(1)                                             General Commands Manual                                            gtkdoc-scanobj(1)

NAME
       gtkdoc-scanobj —  gets information about object hierarchies and signals.

SYNOPSIS
       gtkdoc-scanobj [ See section EXAMPLE ]

DESCRIPTION
       gtkdoc-scanobj  gets information about object hierarchies and signals by compiling a small C program. CFLAGS and LDFLAGS must be set appro‐
       priately before running this script.

       This binary must be used inside a Makefile and not directly in a command line. See section EXAMPLE.

EXAMPLE
       See /usr/share/doc/gtk-doc-tools/examples, for a makefile.am and a configure.in example file.

AUTHOR
       This manual page was written by Christian Marillat marillat@debian.org for the Debian GNU/Linux system (but may be used by others).

                                                                                                                                 gtkdoc-scanobj(1)
