RDF2BIN(1)                                                         Debian Manual                                                        RDF2BIN(1)

NAME
       rdf2bin, rdf2com - convert an RDOFF object file to flat binary

SYNOPSIS
       rdf2bin [-o relocation-origin] [-p segment-alignment] input-file output-file
       rdf2com [-p segment-alignment] input-file output-file

OPTIONS
       -o relocation-origin
              Relocate  at origin relocation-origin.  If invoked as rdf2com, the default relocation origin will be 0x100. Else, the default origin
              is 0.

       -p segment-alignment
              Pad segments until their size is a multiple of segment-alignment.  By default, 16 is used.

AUTHORS
       Julian Hall <jules@earthcorp.com>.

       This manual page was written by Matej Vela <vela@debian.org>.

Debian Project                                                   September 6, 1999                                                      RDF2BIN(1)
