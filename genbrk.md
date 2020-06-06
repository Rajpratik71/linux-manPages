GENBRK(1)                                  ICU 60.2 Manual                                  GENBRK(1)

NAME
       genbrk - Compiles ICU break iteration rules source files into binary data files

SYNOPSIS
       genbrk  [  -h,  -?,  --help  ]  [  -V, --version ] [ -c, --copyright ] [ -v, --verbose ] [ -d,
       --destdir destination ] [ -i, --icudatadir directory ] -r, --rules rule-file  -o,  --out  out‐
       put-file

DESCRIPTION
       genbrk  reads  the break (boundary) rule source code from rule-file and creates a break itera‐
       tion data file. Normally this data file has the .brk extension.

       The details of the rule syntax can be found in ICU's User Guide.

OPTIONS
       -h, -?, --help
              Print help about usage and exit.

       -V, --version
              Print the version of genbrk and exit.

       -c, --copyright
              Embeds the standard ICU copyright into the output-file.

       -v, --verbose
              Display extra informative messages during execution.

       -d, --destdir destination
              Set the destination directory of the output-file to destination.

       -i, --icudatadir directory
              Look for any necessary ICU data files in directory.  For example, the  file  pnames.icu
              must be located when ICU's data is not built as a shared library.  The default ICU data
              directory is specified by the environment variable ICU_DATA.   Most  configurations  of
              ICU do not require this argument.

       -r, --rules rule-file
              The source file to read.

       -o, --out output-file
              The output data file to write.

CAVEATS
       When the rule-file contains a byte order mark (BOM) at the beginning of the file, which is the
       Unicode character U+FEFF, then the rule-file is interpreted as Unicode. Without the  BOM,  the
       file  is  interpreted in the current operating system default codepage.  In order to eliminate
       any ambiguity of the encoding for how the rule-file was written, it is  recommended  that  you
       write this file in UTF-8 with the BOM.

ENVIRONMENT
       ICU_DATA  Specifies  the directory containing ICU data. Defaults to ${prefix}/share/icu/60.2/.
                 Some tools in ICU depend on the presence of the trailing slash. It is thus important
                 to make sure that it is present if ICU_DATA is set.

AUTHORS
       George Rhoten
       Andy Heninger

VERSION
       1.0

COPYRIGHT
       Copyright (C) 2005 International Business Machines Corporation and others

SEE ALSO
       http://www.icu-project.org/userguide/boundaryAnalysis.html

ICU MANPAGE                                2 December 2005                                  GENBRK(1)
