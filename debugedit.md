DEBUGEDIT(8)                            System Manager's Manual                           DEBUGEDIT(8)

NAME
       debugedit - Debuginfo editing helper

SYNOPSIS
       debugedit [options] files...

DESCRIPTION
       This  manual  page documents briefly the debugedit command, which can be used to edit debuginfo
       section of object files (either binaries or separate debug info files).

       It is useful for producing consistent information in binaries for  debugging  regardless  build
       location.

OPTIONS
       These  programs  follow  the usual GNU command line syntax, with long options starting with two
       dashes (`-').  A summary of options is included below.  For a  complete  description,  see  the
       Info files.

       -?, --help
              Show summary of options.

       -b, --base-dir=STRING
              base build directory of objects

       -d, --dest-dir=STRING
              directory to rewrite base-dir into

       -l, --list-file=STRING
              file where to put list of source and header file names

       -i, --build-id
              recompute build ID note and print ID on stdout

EXAMPLES
       debugedit -b `pwd` -d /usr/lib/debug
           Rewrites path compliled into binary from current directory to /usr/lib/debug.

SEE ALSO
       rpm(8)

Michal Cihar                               10 September 2013                              DEBUGEDIT(8)
