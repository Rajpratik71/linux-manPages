xslt-config(1)                                  1.0.0                                  xslt-config(1)

NAME
       xslt-config - script to get information about the installed version of libxslt

SYNOPSIS
       xslt-config [--prefix[=DIR]] [--libs] [--cflags] [--version] [--help]

DESCRIPTION
       xslt-config  is  a  tool that is used to determine the compile and linker flags that should be
       used to compile and link programs that use libxslt.

OPTIONS
       xslt-config accepts the following options:

       --version
               Print the currently installed version of libxslt on the standard output.

       --libs  Print the linker flags that are necessary to link a libxslt program.

       --cflags
               Print the compiler flags that are necessary to compile a libxslt program.

       --prefix=PREFIX
               If specified, use PREFIX instead of the installation prefix  that  libxslt  was  built
               with  when  computing the output for the --cflags and --libs options. This option must
               be specified before any --libs or --cflags options.

AUTHOR
       This manual page was adapted from the xml-config by Will Newton <will@misconeption.org.uk>.

       The xml-config manual page was written by Fredrik Hallenberg <hallon@lysator.liu.se>, for  the
       Debian GNU/linux system (but may be used by others).

Version                                      8 March 2002                              xslt-config(1)
