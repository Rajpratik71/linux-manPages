GOBJECT-QUERY(1)                             User Commands                            GOBJECT-QUERY(1)

NAME
       gobject-query - display a tree of types

SYNOPSIS
       gobject-query froots [OPTION...]

       gobject-query tree [OPTION...]

DESCRIPTION
       gobject-query is a small utility that draws a tree of types.

       gobject-query takes a mandatory argument that specifies whether it should iterate over the
       fundamental types or print a type tree.

COMMANDS
       froots
           iterate over fundamental roots

       tree
           print type tree

OPTIONS
       -r TYPE
           specify the root type

       -n
           don't descend type tree

       -b STRING
           specify indent string

       -i STRING
           specify incremental indent string

       -s NUMBER
           specify line spacing

       -h, --help
           Print brief help and exit.

       -v, --version
           Print version and exit.

GObject                                                                               GOBJECT-QUERY(1)
