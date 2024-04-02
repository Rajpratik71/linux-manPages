RDFLIB(1)                                                          Debian Manual                                                         RDFLIB(1)

NAME
       rdflib - manage a library file for use with ldrdf(1)

SYNOPSIS
       rdflib command arguments

DESCRIPTION
       rdflib  manages  a library file which can be used by ldrdf(1).  It is supplied with a shell script makelib which should probably be used to
       create libraries.

COMMANDS
       c library-file
              Create (or truncate) a library.

       a library-file object-file module
              Add the object-file to the library under the name module.

       x library-file module object-file
              Extract a module from the library to the file object-file.

       t  library-file
              Display a list of modules in the library.

NOTES
       A remove command will be added soon.

AUTHORS
       Julian Hall <jules@earthcorp.com>.

       This manual page was written by Matej Vela <vela@debian.org>.

Debian Project                                                   September 6, 1999                                                       RDFLIB(1)
