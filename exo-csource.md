EXO-CSOURCE(1)                                                   Xfce Users Manual                                                  EXO-CSOURCE(1)

NAME
       exo-csource - C code generation utility for arbitrary data

SYNOPSIS
       exo-csource [options] [file]

       exo-csource [options] --build-list [[name] [file]...]

DESCRIPTION
       exo-csource is a small utility that generates C code containing arbitrary data, useful for compiling texts or other data directly into
       programs.

INVOCATION
       exo-csource either takes as input one file name to generate code for, or, using the --build-list option, a list of (name, file) pairs to
       generate code for a list of images into named variables.

   Options
       -h, --help
           Print brief help and exit.

       -v, --version
           Print version information and exit.

       --extern
           Generate extern symbols.

       --static
           Generate static symbols (default).

       --name=identifier
           Specifies the identifier name (prefix) for the generated variables (only used if --build-list was not specified as well).

       --build-list
           Enables (name, file) pair parsing mode.

SEE ALSO
       The gdk-pixbuf-csource utility which ships with the Gtk+ distribution, available from www.gtk.org[1].

AUTHOR
       exo-csource was written by Benedikt Meurer <benny@xfce.org>.

       This manual page was provided by Benedikt Meurer <benny@xfce.org>.

NOTES
        1. www.gtk.org
           http://www.gtk.org

Xfce                                                                08/29/2016                                                      EXO-CSOURCE(1)
