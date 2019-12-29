PYCOMPILE(1)                                                                              PYCOMPILE(1)

NAME
       pycompile - byte compile Python source files

SYNOPSIS
          pycompile [-V [X.Y][-][A.B]] DIR_OR_FILE [-X REGEXPR]

          pycompile -p PACKAGE

DESCRIPTION
       Wrapper around Python standard library's py_compile module to byte-compile Python files.

OPTIONS
       --version
              show program's version number and exit

       -h, --help
              show this help message and exit

       -f, --force
              force rebuild of byte-code files even if timestamps are up-to-date

       -O     byte-compile to .pyo files

       -q, --quiet
              be quiet

       -v, --verbose
              turn verbose mode on

       -p PACKAGE, --package=PACKAGE
              specify  Debian  package  name  whose  files  should  be  bytecompiled  (combining  with
              DIR_OR_FILE will additionally limit list of files)

       -V VRANGE
              force private modules to be bytecompiled with Python version from given  range,  regard‐
              less  of  the default Python version in the system. If there are no other options, byte‐
              compile all public modules for installed Python versions that match  given  range.  VER‐
              SION_RANGE examples:

                 • 2.5    version 2.5 only

                 • 2.5-   version 2.5 or newer

                 • 2.5-2.7        version 2.5 or 2.6

                 • -3.0   all supported 2.X versions

       -X REGEXPR, --exclude=REGEXPR
              exclude  items that match given REGEXPR. You may use this option multiple times to build
              up a list of things to exclude

AUTHOR
       Piotr Ożarowski, 2012-2013

                                                                                          PYCOMPILE(1)
