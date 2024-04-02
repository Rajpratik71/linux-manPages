autoopts-config(1)                                              Programmer's Manual                                             autoopts-config(1)

NAME
       autoopts-config - script to get information about installed version of autoopts

SYNOPSIS
       autoopts-config [--prefix[=DIR]] [--exec-prefix[=DIR]] [--version] [--libs] [--pkgdatadir] [--cflags] [--autogen]

DESCRIPTION
       autoopts-config  is a tool that is used by configure to determine the compile and linker flags that should be used to compile and link pro‐
       grams that use autoopts.

OPTIONS
       --prefix[=DIR]

              If specified, use PREFIX instead of the installation prefix that autoopts was built with when computing the output for the  --cflags
              and  --libs options. This option is also used for the exec prefix if --exec-prefix was not specified.  This option must be specified
              before any --libs or --cflags options.

       --exec-prefix[=DIR]

              If specified, use PREFIX instead of the installation exec prefix that autoopts was built with when  computing  the  output  for  the
              --cflags and --libs options.  This option must be specified before any --libs or --cflags options.

       --version

              Print the currently installed version of autoopts on the standard output.

       --libs

              Print the linker flags that are necessary to link an autoopts program.

       --pkgdatadir

              Print the directory containing support files used by autogen.

       --cflags

              Print the compiler flags that are necessary to compile an autoopts program.

       --autogen

              Use this option to locate the autogen binary.

SEE ALSO
       Autogen Info system documentation.

AUTHOR
       autogen is the work of Bruce Korb <bkorb@gnu.org>. Luca Filipozzi <lfilipoz@debian.org> wrote this horrid manpage for the Debian package.

       Released under the GNU General Public License.

                                                                    2001-08-12                                                  autoopts-config(1)
