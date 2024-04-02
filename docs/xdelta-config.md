XDELTA(1)                                                              1.1.1                                                             XDELTA(1)

NAME
       xdelta-config - script to get information about the installed version of Xdelta

SYNOPSIS
       xdelta-config [--prefix[=DIR]] [--exec-prefix[=DIR]] [--version] [--libs] [--cflags] [LIBRARIES]

DESCRIPTION
       xdelta-config  is  a tool that is used to configure to determine the compiler and linker flags that should be used to compile and link pro‐
       grams that use xdelta. It is also used internally to the .m4 macros for GNU autoconf that are included with xdelta.

OPTIONS
       xdelta-config accepts the following options:

       LIBRARIES
               xdelta has one library 'xdelta'.

       --version
               Print the currently installed version of xdelta on the standard output.

       --libs  Print the linker flags that are necessary to link a xdelta program.

       --cflags
               Print the compiler flags that are necessary to compile a xdelta program.

       --prefix=PREFIX
               If specified, use PREFIX instead of the installation prefix that xdelta was built with when computing the output for  the  --cflags
               and  --libs options. This option is also used for the exec prefix if --exec-prefix was not specified. This option must be specified
               before any --libs or --cflags options.

       --exec-prefix=PREFIX
               If specified, use PREFIX instead of the installation exec prefix that xdelta was built with  when  computing  the  output  for  the
               --cflags and --libs options.  This option must be specified before any --libs or --cflags options.

SEE ALSO
       glib-config(1), xdelta(1)

COPYRIGHT
       Copyright ©  1998 Owen Taylor

       Permission to use, copy, modify, and distribute this software and its documentation for any purpose and without fee is hereby granted, pro‐
       vided that the above copyright notice appear in all copies and that both that copyright notice and this permission notice  appear  in  sup‐
       porting documentation.

       This man page was modified from the glib-config man page for the Debian Project by Frederic Lepied <Lepied@Debian.org>.

Version                                                            17 June 1999                                                          XDELTA(1)
