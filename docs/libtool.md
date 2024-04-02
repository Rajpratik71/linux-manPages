LIBTOOL(1)                                                                                      User Commands                                                                                      LIBTOOL(1)



NAME
       libtool - manual page for libtool 2.4.2

SYNOPSIS
       libtool [OPTION]... [MODE-ARG]...
       libtool [OPTION]... --mode=compile COMPILE-COMMAND... SOURCEFILE
       libtool [OPTION]... --mode=link LINK-COMMAND...
       libtool [OPTION]... --mode=execute COMMAND [ARGS]...
       libtool [OPTION]... --mode=install INSTALL-COMMAND...
       libtool [OPTION]... --mode=finish [LIBDIR]...
       libtool [OPTION]... --mode=uninstall RM [RM-OPTION]... FILE...
       libtool [OPTION]... --mode=clean RM [RM-OPTION]... FILE...

DESCRIPTION
       Provide generalized library-building support services.

       --config
              show all configuration variables

       --debug
              enable verbose shell tracing

       -n, --dry-run
              display commands without modifying any files

       --features
              display basic configuration information and exit

       --mode=MODE
              use operation mode MODE

       --preserve-dup-deps
              don't remove duplicate dependency libraries

       --quiet, --silent
              don't print informational messages

       --no-quiet, --no-silent
              print informational messages (default)

       --no-warn
              don't display warning messages

       --tag=TAG
              use configuration variables from tag TAG

       -v, --verbose
              print more informational messages than default

       --no-verbose
              don't print the extra informational messages

       --version
              print version information

       -h, --help, --help-all
              print short, long, or detailed help message

       MODE must be one of the following:

       clean  remove files from the build directory

       compile
              compile a source file into a libtool object

       execute
              automatically set library path, then run a program

       finish complete the installation of libtool libraries

       install
              install libraries or executables

       link   create a library or an executable

       uninstall
              remove libraries from an installed directory

       MODE-ARGS vary depending on the MODE.  When passed as first option, `--mode=MODE' may be abbreviated as `MODE' or a unique abbreviation of that.

       GNU libtool home page: <http://www.gnu.org/software/libtool/>.  General help using GNU software: <http://www.gnu.org/gethelp/>.

       Description of compile mode:

       Compile a source file into a libtool library object.

       This mode accepts the following additional options:

       -o OUTPUT-FILE
              set the output file name to OUTPUT-FILE

       -no-suppress
              do not suppress compiler output for multiple passes

       -prefer-pic
              try to build PIC objects only

       -prefer-non-pic
              try to build non-PIC objects only

       -shared
              do not build a `.o' file suitable for static linking

       -static
              only build a `.o' file suitable for static linking

       -Wc,FLAG
              pass FLAG directly to the compiler

       COMPILE-COMMAND is a command to be used in creating a `standard' object file from the given SOURCEFILE.

       The output file name is determined by removing the directory component from SOURCEFILE, then substituting the C source code suffix `.c' with the library object suffix, `.lo'.

       Description of link mode:

       Link object files or libraries together to form another library, or to create an executable program.

       LINK-COMMAND is a command using the C compiler that you would use to create a program from several object files.

       The following components of LINK-COMMAND are treated specially:

       -all-static
              do not do any dynamic linking at all

       -avoid-version
              do not add a version suffix if possible

       -bindir BINDIR
              specify path to binaries directory (for systems where libraries must be found in the PATH setting at runtime)

       -dlopen FILE
              `-dlpreopen' FILE if it cannot be dlopened at runtime

       -dlpreopen FILE
              link in FILE and add its symbols to lt_preloaded_symbols

       -export-dynamic
              allow symbols from OUTPUT-FILE to be resolved with dlsym(3)

       -export-symbols SYMFILE
              try to export only the symbols listed in SYMFILE

       -export-symbols-regex REGEX
              try to export only the symbols matching REGEX

       -LLIBDIR
              search LIBDIR for required installed libraries

       -lNAME OUTPUT-FILE requires the installed library libNAME

       -module
              build a library that can dlopened

       -no-fast-install
              disable the fast-install mode

       -no-install
              link a not-installable executable

       -no-undefined
              declare that a library does not refer to external symbols

       -o OUTPUT-FILE
              create OUTPUT-FILE from the specified objects

       -objectlist FILE
              Use a list of object files found in FILE to specify objects

       -precious-files-regex REGEX
              don't remove output files matching REGEX

       -release RELEASE
              specify package release information

       -rpath LIBDIR
              the created library will eventually be installed in LIBDIR

       -R[ ]LIBDIR
              add LIBDIR to the runtime path of programs and libraries

       -shared
              only do dynamic linking of libtool libraries

       -shrext SUFFIX
              override the standard shared library file extension

       -static
              do not do any dynamic linking of uninstalled libtool libraries

       -static-libtool-libs
              do not do any dynamic linking of libtool libraries

       -version-info CURRENT[:REVISION[:AGE]]
              specify library version info [each variable defaults to 0]

       -weak LIBNAME
              declare that the target provides the LIBNAME interface

       -Wc,FLAG

       -Xcompiler FLAG
              pass linker-specific FLAG directly to the compiler

       -Wl,FLAG

       -Xlinker FLAG
              pass linker-specific FLAG directly to the linker

       -XCClinker FLAG
              pass link-specific FLAG to the compiler driver (CC)

       All other options (arguments beginning with `-') are ignored.

       Every other argument is treated as a filename.  Files ending in `.la' are treated as uninstalled libtool libraries, other files are standard or library object files.

       If the OUTPUT-FILE ends in `.la', then a libtool library is created, only library objects (`.lo' files) may be specified, and `-rpath' is required, except when creating a convenience library.

       If OUTPUT-FILE ends in `.a' or `.lib', then a standard library is created using `ar' and `ranlib', or on Windows using `lib'.

       If OUTPUT-FILE ends in `.lo' or `.o', then a reloadable object file is created, otherwise an executable program is created.

       Description of execute mode:

       Automatically set library path, then run a program.

       This mode accepts the following additional options:

       -dlopen FILE
              add the directory containing FILE to the library path

       This mode sets the library path environment variable according to `-dlopen' flags.

       If any of the ARGS are libtool executable wrappers, then they are translated into their corresponding uninstalled binary, and any of their required library directories are added to the library path.

       Then, COMMAND is executed, with ARGS as arguments.

       Description of install mode:

       Install executables or libraries.

       INSTALL-COMMAND is the installation command.  The first component should be either the `install' or `cp' program.

       The following components of INSTALL-COMMAND are treated specially:

       -inst-prefix-dir PREFIX-DIR
              Use PREFIX-DIR as a staging area for installation

       The rest of the components are interpreted as arguments to that command (only BSD-compatible install options are recognized).

       Description of finish mode:

       Complete the installation of libtool libraries.

       Each LIBDIR is a directory that contains libtool libraries.

       The commands that this mode executes may require superuser privileges.  Use the `--dry-run' option if you just want to see what would be executed.

       Description of uninstall mode:

       Remove libraries from an installation directory.

       RM is the name of the program to use to delete files associated with each FILE (typically `/bin/rm').  RM-OPTIONS are options (such as `-f') to be passed to RM.

       If FILE is a libtool library, all the files associated with it are deleted.  Otherwise, only FILE itself is deleted using RM.

       Description of clean mode:

       Remove files from the build directory.

       RM is the name of the program to use to delete files associated with each FILE (typically `/bin/rm').  RM-OPTIONS are options (such as `-f') to be passed to RM.

       If FILE is a libtool library, object or program, all the files associated with it are deleted. Otherwise, only FILE itself is deleted using RM.

       When reporting a bug, please describe a test case to reproduce it and include the following information:

       host-triplet:
              x86_64-apple-darwin11.2.0

       shell: /bin/sh

       compiler:
              gcc

       compiler flags:
              -g -O2

       linker:
              /usr/llvm-gcc-4.2/libexec/gcc/i686-apple-darwin11/4.2.1/ld (gnu? no)

       libtool:
              (GNU libtool) 2.4.2

       automake:
              automake (GNU automake) 1.11.1

       autoconf:
              autoconf (GNU Autoconf) 2.68

AUTHOR
       Written by Gordon Matzigkeit <gord@gnu.ai.mit.edu>, 1996

REPORTING BUGS
       Report bugs to <bug-libtool@gnu.org>.

COPYRIGHT
       Copyright © 2011 Free Software Foundation, Inc.
       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       The full documentation for libtool is maintained as a Texinfo manual.  If the info and libtool programs are properly installed at your site, the command

              info libtool

       should give you access to the complete manual.



libtool 2.4.2                                                                                    October 2011                                                                                      LIBTOOL(1)
