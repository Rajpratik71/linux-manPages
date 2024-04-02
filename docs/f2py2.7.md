F2PY(1)                                 General Commands Manual                                F2PY(1)

NAME
       f2py - Fortran to Python interface generator

SYNOPSIS
       (1) To construct extension module sources:

       f2py  [<options>]  <fortran files> [[[only:]||[skip:]] <fortran functions> ] [: <fortran files>
       ...]

       (2) To compile fortran files and build extension modules:

       f2py -c [<options>, <config_fc options>, <extra options>] <fortran files>

       (3) To generate signature files:

       f2py -h <filename.pyf> ...< same options as in (1) >

DESCRIPTION
       This program generates a Python C/API file (<modulename>module.c) that  contains  wrappers  for
       given  Fortran  or  C functions so that they can be called from Python.  With the -c option the
       corresponding extension modules are built.

OPTIONS
       -h <filename>
              Write signatures of the fortran routines to file <filename> and exit. You can then  edit
              <filename>  and use it instead of <fortran files>. If <filename>==stdout then the signa‐
              tures are printed to stdout.

       <fortran functions>
              Names of fortran routines for which Python C/API functions will be generated. Default is
              all that are found in <fortran files>.

       skip:  Ignore fortran functions that follow until `:'.

       only:  Use only fortran functions that follow until `:'.

       :      Get back to <fortran files> mode.

       -m <modulename>
              Name of the module; f2py generates a Python/C API file <modulename>module.c or extension
              module <modulename>.  Default is ´untitled´.

       --[no-]lower
              Do [not] lower the cases in <fortran files>. By default, --lower is assumed with -h key,
              and --no-lower without -h key.

       --build-dir <dirname>
              All f2py generated files are created in <dirname>. Default is tempfile.mkdtemp().

       --overwrite-signature
              Overwrite existing signature file.

       --[no-]latex-doc
              Create (or not) <modulename>module.tex.  Default is --no-latex-doc.

       --short-latex
              Create  'incomplete'  LaTeX document (without commands \documentclass, \tableofcontents,
              and \begin{document}, \end{document}).

       --[no-]rest-doc
              Create (or not) <modulename>module.rst.  Default is --no-rest-doc.

       --debug-capi
              Create C/API code that reports the state of the wrappers during runtime. Useful for  de‐
              bugging.

       -include´<includefile>´
              Add  CPP #include statement to the C/API code.  <includefile> should be in the format of
              either `"filename.ext"' or `<filename.ext>'.  As a result <includefile> will be included
              just  before  wrapper  functions  part in the C/API code. The option is depreciated, use
              `usercode` statement in signature files instead.

       --[no-]wrap-functions
              Create Fortran subroutine wrappers to Fortran 77 functions. --wrap-functions is  default
              because it ensures maximum portability/compiler independence.

       --help-link [..]
              List  system  resources  found  by  system_info.py. [..] may contain a list of resources
              names. See also --link-<resource> switch below.

       --quiet
              Run quietly.

       --verbose
              Run with extra verbosity.

       -v     Print f2py version ID and exit.

       --include_paths path1:path2:...
              Search include files (that f2py will scan) from the given directories.

CONFIG_FC OPTIONS
       The following options are effective only when -c switch is used.

       --help-compiler
              List available Fortran compilers [DEPRECIATED].

       --fcompiler=<name>
              Specify Fortran compiler type by vendor.

       --compiler=<name>
              Specify C compiler type (as defined by distutils)

       --fcompiler-exec=<path>
              Specify the path to F77 compiler [DEPRECIATED].

       --f90compiler-exec=<path>
              Specify the path to F90 compiler [DEPRECIATED].

       --help-fcompiler
              List available Fortran compilers and exit.

       --f77exec=<path>
              Specify the path to F77 compiler.

       --f90exec=<path>
              Specify the path to F90 compiler.

       --f77flags="..."
              Specify F77 compiler flags.

       --f90flags="..."
              Specify F90 compiler flags.

       --opt="..."
              Specify optimization flags.

       --arch="..."
              Specify architecture specific optimization flags.

       --noopt
              Compile without optimization.

       --noarch
              Compile without arch-dependent optimization.

       --debug
              Compile with debugging information.

EXTRA OPTIONS
       The following options are effective only when -c switch is used.

       --link-<resource>
              Link extension module with <resource> as defined by numpy_distutils/system_info.py. E.g.
              to  link  with  optimized  LAPACK  libraries  (vecLib  on  MacOSX, ATLAS elsewhere), use
              --link-lapack_opt. See also --help-link switch.

       -L/path/to/lib/ -l<libname>

       -D<define> -U<name> -I/path/to/include/

       <filename>.o <filename>.so <filename>.a

       -DPREPEND_FORTRAN -DNO_APPEND_FORTRAN -DUPPERCASE_FORTRAN -DUNDERSCORE_G77
              Macros that might be required with non-gcc Fortran compilers.

       -DF2PY_REPORT_ATEXIT
              To print out a performance report of F2PY interface when  python  exits.  Available  for
              Linux.

       -DF2PY_REPORT_ON_ARRAY_COPY=<int>
              To  send  a  message to stderr whenever F2PY interface makes a copy of an array. Integer
              <int> sets the threshold for array sizes when a message should be shown.

REQUIREMENTS
       Python 1.5.2 or higher (2.x is supported).

       Numerical Python 13 or higher (20.x,21.x,22.x,23.x are supported).

       Optional Numarray 0.9 or higher partially supported.

       numpy_distutils from Scipy (can be downloaded from F2PY homepage)

SEE ALSO
       python(1)

BUGS
       For instructions on reporting bugs, see

         http://cens.ioc.ee/projects/f2py2e/FAQ.html

AUTHOR
       Pearu Peterson <pearu@cens.ioc.ee>

INTERNET RESOURCES
       Main website: http://cens.ioc.ee/projects/f2py2e/

       User's Guide: http://cens.ioc.ee/projects/f2py2e/usersguide/

       Mailing list: http://cens.ioc.ee/mailman/listinfo/f2py-users/

       Scipy website: http://www.numpy.org

COPYRIGHT
       Copyright (c) 1999, 2000, 2001, 2002, 2003, 2004, 2005 Pearu Peterson

LICENSE
       NumPy License

VERSION
       2.45.241

                                                                                               F2PY(1)
