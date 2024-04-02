GENRB(1)                                   ICU 60.2 Manual                                   GENRB(1)

NAME
       genrb - compile a resource bundle

SYNOPSIS
       genrb [ -h, -?, --help ] [ -V, --version ] [ -v, --verbose ] [ -e, --encoding encoding ] [ -j,
       --write-java [ encoding ] ] [ -s, --sourcedir source ] [ -d, --destdir  destination  ]  [  -i,
       --icudatadir directory ] bundle ...

DESCRIPTION
       genrb  converts  the  resource  bundle source files passed on the command line to their binary
       form or to a Java source file for use with ICU4J.  The resulting  binary  files  have  a  .res
       extension  while  resource  bundle  source  files typically have a .txt extension. Java source
       files have a java extension and follow the ICU4J naming conventions.

       It is customary to name the resource bundles by their locale name, i.e. to use a local identi‐
       fier  for  the bundle filename, e.g.  ja_JP.txt for Japanese (Japan) data, or root.txt for the
       root bundle.  In any case, genrb will produce a file whose base name is the name of the locale
       found in the resource file, not the base name of the resource file itself.

       The  binary  files can be read directly by ICU, or used by pkgdata(1) for incorporation into a
       larger archive or library.

OPTIONS
       -h, -?, --help
              Print help about usage and exit.

       -V, --version
              Print the version of genrb and exit.

       -v, --verbose
              Display extra informative messages during execution.

       -e, --encoding encoding
              Set the encoding used to read input files to encoding.  The  default  encoding  is  the
              invariant  (subset  of  ASCII or EBCDIC) codepage for the system (see section INVARIANT
              CHARACTERS).  The encodings UTF-8, UTF-16BE, and UTF-16LE are automatically detected if
              a byte order mark (BOM) is present.

       -j, --write-java [ encoding ]
              Generate  a Java source code for use with ICU4J. An optional encoding for the Java file
              can be given.

       -s, --sourcedir source
              Set the source directory to source.  The default source directory is specified  by  the
              environment  variable  ICU_DATA,  or the location set when ICU was built if ICU_DATA is
              not set.

       -d, --destdir destination
              Set the destination directory to destination.  The  default  destination  directory  is
              specified  by  the  environment  variable  ICU_DATA or is the location set when ICU was
              built if ICU_DATA is not set.

       -i, --icudatadir directory
              Look for any necessary ICU data files in directory.  For example, when processing  col‐
              lation overrides, the file ucadata.dat must be located.  The default ICU data directory
              is specified by the environment variable ICU_DATA.

INVARIANT CHARACTERS
       The invariant character set consists of the following set of characters, expressed as a  stan‐
       dard  POSIX regular expression: [a-z]|[A-Z]|[0-9]|_| |+|-|*|/.  This is the set which is guar‐
       anteed to be available regardless of code page.

ENVIRONMENT
       ICU_DATA  Specifies the directory containing ICU data. Defaults to  ${prefix}/share/icu/60.2/.
                 Some tools in ICU depend on the presence of the trailing slash. It is thus important
                 to make sure that it is present if ICU_DATA is set.

VERSION
       60.2

COPYRIGHT
       Copyright (C) 2000-2002 IBM, Inc. and others.

SEE ALSO
       derb(1)
       pkgdata(1)

ICU MANPAGE                                 16 April 2002                                    GENRB(1)
