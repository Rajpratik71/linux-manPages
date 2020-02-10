LIBGVC6-CONFIG-UPDATE(8)                                                            GRAPHVIZ CONFIGURATION MANAGEMENT                                                            LIBGVC6-CONFIG-UPDATE(8)

NAME
       libgvc6-config-update - maintain libgvc's configuration file

SYNOPSIS
       libgvc6-config-update -c

DESCRIPTION
       Graphviz tools are using a configuration file (/usr/lib/graphviz/config6 at the moment) to get some plugin options. This command is used in libgvc6 and libgvc6-*-plugin packages' maintainer
       scripts to update this configuration file when plugins are installed, updated, or removed.

NOTE
       This tool is intended to be used only in maintainer scripts and it shouldn't be needed to run it manually.

AUTHOR
       This manual page was written by Cyril Brulebois <cyril.brulebois@enst-bretagne.fr>.

       It can be distributed under the same terms as the graphviz package.

2.38.0                                                                                          2017-01-05                                                                       LIBGVC6-CONFIG-UPDATE(8)
