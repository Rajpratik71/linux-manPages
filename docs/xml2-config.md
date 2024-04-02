GNOME-XML(1)                                    1.1.0                                    GNOME-XML(1)

NAME
       xml-config - script to get information about the installed version of GNOME-XML

SYNOPSIS
       xml-config [--prefix[=DIR]] [--libs] [--cflags] [--version] [--help]

DESCRIPTION
       xml-config  is  a  tool  that is used to determine the compile and linker flags that should be
       used to compile and link programs that use GNOME-XML.  It is highly recommended  to  use  pkg-
       config  instead  because  building  in  a multi-arch environment is not well supported in this
       script.

OPTIONS
       xml-config accepts the following options:

       --version
               Print the currently installed version of GNOME-XML on the standard  output.   Add  the
               --static  option  to  print  the  linker flags that are necessary to statically link a
               GNOME-XML program.

       --libs  Print the linker flags that are necessary to link a GNOME-XML program.

       --cflags
               Print the compiler flags that are necessary to compile a GNOME-XML program.

       --prefix=PREFIX
               If specified, use PREFIX instead of the installation prefix that GNOME-XML  was  built
               with  when  computing the output for the --cflags and --libs options. This option must
               be specified before any --libs or --cflags options.

AUTHOR
       This manual page was written by Fredrik Hallenberg  <hallon@lysator.liu.se>,  for  the  Debian
       GNU/linux system (but may be used by others).

Version                                      3 July 1999                                 GNOME-XML(1)
