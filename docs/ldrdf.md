LDRDF(1)                                                           Debian Manual                                                          LDRDF(1)

NAME
       ldrdf - link RDOFF objects and libraries produced by rdflib(1)

SYNOPSIS
       ldrdf [-o output-file] object-file... [-llibrary...]

DESCRIPTION
       ldrdf  is  a  version of unix ld(1) (or DOS LINK) for use with RDOFF files.  It is capable of linking RDOFF objects, and libraries produced
       with the rdflib(1) utility.

       Libraries must be specified with their path as no search is performed.  Modules in libraries are not linked to the program unless they  are
       referred to.

OPTIONS
       -o output-file
              Specify an output file.  The default output filename is 'aout.rdx'.

       -v     Increase  verbosity level.  Currently 4 verbosity levels are available: default (which only prints error information), normal (which
              prints information about the produced object, -v), medium (which prints information about what the program is doing, -v -v) and high
              (which prints all available information, -v -v -v).

       -p     Change  alignment value to which multiple segments combigned into a single segment should be aligned (must be either 1, 2, 4, 8, 16,
              32 or 256; default is 16).

AUTHORS
       Julian Hall <jules@earthcorp.com>.

       This manual page was written by Matej Vela <vela@debian.org>.

Debian Project                                                   September 6, 1999                                                        LDRDF(1)
