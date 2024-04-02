odbc_config(1)                                                                              UnixODBC manual pages                                                                              odbc_config(1)



NAME
       odbc_config - get compile options for compiling unixODBC client


SYNOPSIS
       odbc_config [--prefix] [--exec-prefix] [--include-prefix] [--lib-prefix] [--bin-prefix] [--version] [--libs] [--static-libs] [--libtool-libs] [--cflags] [--odbcversion] [--odbcini] [--odbcinstini]
                   [--header] [--ulen]


DESCRIPTION
       odbc_config provides built-in options, specified at build time of the unixODBC suite, which are useful for building unixODBC clients and similar programs.


OPTIONS
       --prefix
              Prefix for architecture-independent file tree.


       --exec-prefix
              Prefix for architecture-dependent file tree.


       --include-prefix
              Directory with C header files for unixODBC.


       --lib-prefix
              Directory with object code (.so) libraries.


       --bin-prefix
              Location of user executables.


       --version
              unixODBC version.


       --libs Compiler flags for linking dynamic libraries.


       --static-libs
              Absolute file name of static unixODBC library.


       --libtool-libs
              Absolute file name of libtool unixODBC library.


       --cflags
              Compiler flags to find include files and critical compiler flags and defines used when compiling the libodbc library.


       --odbcversion
              Version of the ODBC specification used by the unixODBC.


       --odbcini
              Absolute file name of the system-wide DSN configuration file odbc.ini.


       --odbcinstini
              Absolute file name of the driver configuration file odbcinst.ini.


       --header
              Definitions of used C preprocessor constants. It is suitable to be piped into C header file.


       --ulen Compiler flag for defining SIZEOF_SQLULEN.


SEE ALSO
       odbcinst.ini(5), odbc.ini(5)


AUTHORS
       The authors of unixODBC are Peter Harvey ⟨pharvey@codebydesign.com⟩ and Nick Gorham ⟨nick@easysoft.com⟩.  For the full list of contributors see the AUTHORS file.


COPYRIGHT
       unixODBC is licensed under the GNU Lesser General Public License. For details about the license, see the COPYING file.



version 2.3.1                                                                                  Thu 13 Feb 2014                                                                                 odbc_config(1)
