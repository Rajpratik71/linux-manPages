MESON(1)                                                           User Commands                                                          MESON(1)

NAME
       meson - a high productivity build system

DESCRIPTION
       Meson  is  a  build system designed to optimize programmer productivity. It aims to do this by providing simple, out-of-the-box support for
       modern software development tools and practices, such as unit tests, coverage reports, Valgrind, CCache and the like.

       The main Meson executable provides many subcommands to access all the functionality.

The setup command
       Using Meson is simple and follows the common two-phase process of most build systems. First you run Meson to configure your build:

       meson setup [ options ] [ source directory ] [ build directory ]

       Note that the build directory must be different from the source directory. Meson does not support building inside the source directory  and
       attempting to do that leads to an error.

       After  a  successful  configuration  step  you can build the source by running the actual build command in the build directory. The default
       backend of Meson is Ninja, which can be invoked like this.

       ninja [ target ]

       You only need to run the Meson command once: when you first configure your build dir. After that you just run the build command. Meson will
       autodetect changes in your source tree and regenerates all files needed to build the project.

       The  setup  command is the default operation. If no actual command is specified, Meson will assume you meant to do a setup. That means that
       you can set up a build directory without the setup command like this:

       meson [ options ] [ source directory ] [ build directory ]

   options:
       --version
              print version number

       --help print command line help

The configure command
       meson configure provides a way to configure a Meson project from the command line.  Its usage is simple:

       meson configure [ build directory ] [ options to set ]

       If build directory is omitted, the current directory is used instead.

       If no parameters are set, meson configure will print the value of all build options to the console.

       To set values, use the -D command line argument like this.

       meson configure -Dopt1=value1 -Dopt2=value2

The introspect command
       Meson introspect is a command designed to make it simple to  integrate with other tools, such as IDEs. The output of  this  command  is  in
       JSON.

       meson introspect [ build directory ] [ option ]

       If build directory is omitted, the current directory is used instead.

   options:
       --targets
              print all top level targets (executables, libraries, etc)

       --target-files
              print the source files of the given target

       --buildsystem-files
              print all files that make up the build system (meson.build, meson_options.txt etc)

       --tests
              print all unit tests

       --help print command line help

The test command
       meson  test  is  a  helper tool for running test suites of projects using Meson.  The default way of running tests is to invoke the default
       build command:

       ninja [ test ]

       meson test provides a richer set of tools for invoking tests.

   options:
       --repeat
              run tests as many times as specified

       --gdb  run tests under gdb

       --list list all available tests

       --wrapper
              invoke all tests via the given wrapper (e.g. valgrind)

       -C     Change into the given directory before running tests (must be root of build directory).

       --suite
              run tests in this suite

       --no-suite
              do not run tests in this suite

       --no-stdsplit
              do not split stderr and stdout in test logs

       --benchmark
              run benchmarks instead of tests

       --logbase
              base of file name to use for writing test logs

       --num-processes
              how many parallel processes to use to run tests

       --verbose
              do not redirect stdout and stderr

       -t     a multiplier to use for test timeout values (usually something like 100 for Valgrind)

       --setup
              use the specified test setup

The wrap command
       Wraptool is a helper utility to manage source dependencies using the online wrapdb service.

       meson wrap < command > [ options ]

       You should run this command in the top level source directory of your project.

   Commands:
       list   list all available projects

       search search projects by name

       install
              install a project with the given name

       update update the specified project to latest available version

       info   show available versions of the specified project

       status show installed and available versions of currently used subprojects

EXIT STATUS
       0      Successful.

       1      Usage error, or an error parsing or executing meson.build.

       2      Internal error.

       SEE ALSO

              http://mesonbuild.com/

              https://wrapdb.mesonbuild.com/

meson 0.49.2                                                       January 2019                                                           MESON(1)
