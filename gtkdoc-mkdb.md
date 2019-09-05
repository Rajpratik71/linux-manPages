gtkdoc-mkdb(1)                                                General Commands Manual                                               gtkdoc-mkdb(1)

NAME
       gtkdoc-mkdb —  creates the DocBook files from the edited templates.

SYNOPSIS
       gtkdoc-mkdb [ nothing ]

DESCRIPTION
       gtkdoc-mkdb This creates the DocBook files from the edited templates.

       This binary must be used inside a Makefile and not directly in a command line. See section EXAMPLE.

NOTE
       When  creating  SGML  IDS, we append -CAPS to all all-caps identifiers to prevent name clashes. (It basically never is the case that mixed-
       case identifiers would collide.) See the CreateValidSGMLID function.

EXAMPLE
       See /usr/share/doc/gtk-doc-tools/examples, for a makefile.am and a configure.in example file.

AUTHOR
       This manual page was written by Christian Marillat marillat@debian.org for the Debian GNU/Linux system (but may be used by others).

                                                                                                                                    gtkdoc-mkdb(1)
