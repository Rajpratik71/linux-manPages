gtkdoc-scan(1)                                                General Commands Manual                                               gtkdoc-scan(1)

NAME
       gtkdoc-scan —  Extracts declarations of functions, macros, enums, structs and unions from header files.

SYNOPSIS
       gtkdoc-scan [ MODULE name ]  [ source directory (optional) ]  [ output directory (optional) ]  [ header file ]

DESCRIPTION
       gtkdoc-scan Extracts declarations of functions, macros, enums, structs and unions from header files.

       It is called with a module name, an optional source directory, an optional output directory, and the header files to scan.

       It outputs all declarations found to a file named MODULE-decl.txt, and the list of declarations to another file MODULE-decl-list.txt

       This second list file is typically copied to SGML pages.

       This binary must be used inside a Makefile and not directly in a command line. See section EXAMPLE.

EXAMPLE
       See /usr/share/doc/gtk-doc-tools/examples, for a makefile.am and a configure.in example file.

AUTHOR
       This manual page was written by Christian Marillat marillat@debian.org for the Debian GNU/Linux system (but may be used by others).

                                                                                                                                    gtkdoc-scan(1)
