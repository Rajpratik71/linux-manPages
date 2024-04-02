g-ir-generate(1)                                                                           General Commands Manual                                                                           g-ir-generate(1)



NAME
       g-ir-generate - typelib generator

SYNOPSIS
       g-ir-generate [OPTION...] FILES...

DESCRIPTION
       g-ir-generate  is  an  GIR  generator, using the repository API. It generates GIR files from a raw typelib or in a shared library (--shlib).  The output will be written to standard output unless the
       --output is specified.

OPTIONS
        --help
              Show help options

        --shlib=FILENAME
              The shared library to read the symbols from.

        --output=FILENAME
              Save the resulting output in FILENAME.


       BUGS   Report bugs at https://gitlab.gnome.org/GNOME/gobject-introspection/issues.

HOMEPAGE and CONTACT
       http://live.gnome.org/GObjectIntrospection

AUTHORS
       Mattias Clasen



                                                                                                                                                                                             g-ir-generate(1)
