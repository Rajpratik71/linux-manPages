GENCMN(8)                                  ICU 60.2 Manual                                  GENCMN(8)

NAME
       gencmn - generate an ICU memory-mappable data file

SYNOPSIS
       gencmn  [ -h, -?, --help ] [ -v, --verbose ] [ -c, --copyright | -C, --comment comment ] [ -d,
       --destdir destination ] [ -n, --name name ] [ -t, --type fileext ] [  -S,  --source  ]  [  -e,
       --entrypoint name ] maxsize [ listfilename ]

DESCRIPTION
       gencmn takes a set of files and packages them as an ICU memory-mappable data file. The result‐
       ing data file can then be used directly by ICU.

       gencmn reads a list of files to be packaged from either the  supplied  listfilename  file,  or
       from  its  standard  output.  It packages all the files from the list that are not bigger than
       maxsize bytes, except if maxsize is 0, which indicates that there is no size limit on files.

OPTIONS
       -h, -?, --help
              Print help about usage and exit.

       -v, --verbose
              Display extra informative messages during execution.

       -c,--copyright
              Include the ICU copyright notice in the resulting data.

       -C, --comment comment
              Include the specified comment in the  resulting  data  instead  of  the  ICU  copyright
              notice.

       -d, --destdir destination
              Set  the  destination  directory  to destination.  The default destination directory is
              specified by the environment variable ICU_DATA.

       -n, --name name
              Set the data name to name instead of the default. This name is also used  as  the  base
              name  of  the  output. The default name is made of the icudt prefix, followed by a two-
              digit version number corresponding to the current version of the  ICU  release,  and  a
              single  letter indicating the endianness of the data (the letter b indicated big endian
              data, and the letter l indicates little endian ones).

       -t, --type type
              Use type as the type of the data. This type is also used as the extension of the gener‐
              ated data file. The default type ie dat.

       -S, --source
              Write a C source file with the table of contents of the data.

       -e, --entrypoint name
              Set  the  data entry point (used for linking against the data in a shared library form)
              to name.  The default entry point name is made of the  data  (set  by  the  -n,  --name
              option)  followed  by  an  underscore  and  the type of the data (set by the -t, --type
              option).

ENVIRONMENT
       ICU_DATA  Specifies the directory containing ICU data. Defaults to  ${prefix}/share/icu/60.2/.
                 Some tools in ICU depend on the presence of the trailing slash. It is thus important
                 to make sure that it is present if ICU_DATA is set.

VERSION
       60.2

COPYRIGHT
       Copyright (C) 2000-2001 IBM, Inc. and others.

SEE ALSO
       decmn(8)

ICU MANPAGE                                5 November 2001                                  GENCMN(8)
