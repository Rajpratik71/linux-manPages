MIREDO-CHECKCONF(8)                                           System Manager's Manual                                          MIREDO-CHECKCONF(8)

NAME
       miredo-checkconf - Miredo configuration file syntax checking tool

SYNOPSIS
       miredo-checkconf [config_file]

DESCRIPTON
       miredo-checkconf  checks  the syntax of a configuration file for Miredo.  miredo-checkconf exits with an error code if the syntax was found
       to be incorrect, contained unused directives or if the file could not be opened.

OPTIONS
       -h or --help
              Display some help and exit.

       -V or --version
              Display program version and exit.

       config_file
              This optional argument specifies the path to the configuration file to be checked. If not given, the default /etc/miredo/miredo.conf
              will be assumed.

BUGS
       miredo-checkconf cannot check the syntax of a configuration file for miredo-server.

FILES
       /etc/miredo/miredo.conf
              The default configuration file.

SEE ALSO
       miredo.conf(5), miredo(8)

AUTHOR
       Rémi Denis-Courmont <remi at remlab dot net>

       http://www.remlab.net/miredo/

miredo                                                             February 2008                                               MIREDO-CHECKCONF(8)
