GENCFU(1)                                  ICU 60.2 Manual                                  GENCFU(1)

NAME
       gencfu - Generates Unicode Confusable data files

SYNOPSIS
       gencfu  [  -h,  -?,  --help  ]  [  -V, --version ] [ -c, --copyright ] [ -v, --verbose ] [ -d,
       --destdir destination ] [ -i, --icudatadir directory ] -r,  --rules  rule-file  -w,  --wsrules
       whole-script-rule-file -o, --out output-file

DESCRIPTION
       gencfu  reads  confusable  character definitions in the input file, which are plain text files
       containing confusable character definitions in the input format defined by Unicode  UAX39  for
       the  files  confusables.txt and confusablesWholeScript.txt.  This source (.txt) format is also
       accepted by ICU spoof detectors.  The files must be encoded in utf-8 format, with or without a
       BOM.  Normally the output data file has the .cfu extension.

OPTIONS
       -h, -?, --help
              Print help about usage and exit.

       -V, --version
              Print the version of gencfu and exit.

       -c, --copyright
              Embeds the standard ICU copyright into the output-file.

       -v, --verbose
              Display extra informative messages during execution.

       -d, --destdir destination
              Set the destination directory of the output-file to destination.

       -i, --icudatadir directory
              Look  for  any necessary ICU data files in directory.  For example, the file pnames.icu
              must be located when ICU's data is not built as a shared library.  The default ICU data
              directory  is  specified  by the environment variable ICU_DATA.  Most configurations of
              ICU do not require this argument.

       -r, --rules rule-file
              The source file to read.

       -w, --wsrules whole-script-rule-file
              The whole script source file to read.

       -o, --out output-file
              The output data file to write.

VERSION
       1.0

COPYRIGHT
       Copyright (C) 2009 International Business Machines Corporation and others

ICU MANPAGE                                  24 May 2009                                    GENCFU(1)
