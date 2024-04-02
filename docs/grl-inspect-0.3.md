grl-inspect(1)                                                                             General Commands Manual                                                                             grl-inspect(1)



NAME
       grl-inspect - show information about Grilo sources and keys

SYNOPSIS
       grl-inspect [options] [source|key]

DESCRIPTION
       This manual page documents briefly the grl-inspect command.

       grl-inspect  is  a  tool  that prints out information on available Grilo sources and metadata keys. When executed with no SOURCE argument, grl-inspect will print the list of all plugins and sources.
       When executed with a SOURCE, grl-inspect will print information about that source.

       Alternatively, using -k prints out information about the available metadata keys.

OPTIONS
       -h, --help
              Show summary of grl-inspect options.

       --help-grl
              Show summary of Grilo options.

       --help-all
              Show summary of all options.

       -k     Show information about metadata keys

       -d, --delay seconds
              Wait for some seconds before showing results. Useful when plugins may need some time for the source discovery process (example: UPnP).  If not specified, by default it waits 1 second.

       -c, --config config-file
              Configuration file to use with the plugins.

AUTHOR
       This manual page was written by Alberto Garcia <berto@igalia.com>.



                                                                                                June 28, 2011                                                                                  grl-inspect(1)
