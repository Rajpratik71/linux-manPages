LORDER(1)                BSD General Commands Manual                LORDER(1)

NAME
     lorder — list dependencies for object files

SYNOPSIS
     lorder file ...

DESCRIPTION
     The lorder utility uses nm(1) to determine interdependencies in the list
     of object files and library archives specified on the command line.  The
     lorder utility outputs a list of file names where the first file con‐
     tains a symbol which is defined by the second file.

     The output is normally used with tsort(1) when a library is created to
     determine the optimum ordering of the object modules so that all refer‐
     ences may be resolved in a single pass of the loader.

     When linking static binaries, lorder and tsort(1) can be used to prop‐
     erly order library archives automatically.

ENVIRONMENT
     NM      Path to the nm(1) binary, defaults to “nm”.

     NMFLAGS
             Flags to pass to nm(1).

EXAMPLES
           ar cr library.a `lorder ${OBJS} | tsort`
           cc -o foo ${OBJS} `lorder ${STATIC_LIBS} | tsort`

SEE ALSO
     ar(1), ld(1), nm(1), ranlib(1), tsort(1)

HISTORY
     A lorder utility appeared in Version 7 AT&T UNIX.

BSD                            August 14, 2015                            BSD
