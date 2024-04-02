RDX(1)                                                             Debian Manual                                                            RDX(1)

NAME
       rdx - load and execute an RDOFF object

SYNOPSIS
       rdx object

DESCRIPTION
       rdx  loads  an  RDOFF object, and then calls `_main', which it expects to be a C-style function, accepting two parameters, argc and argv in
       normal C style.

AUTHORS
       Julian Hall <jules@earthcorp.com>.

       This manual page was written by Matej Vela <vela@debian.org>.

Debian Project                                                   September 6, 1999                                                          RDX(1)
