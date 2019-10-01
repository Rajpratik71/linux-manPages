ppdc(1)                                                                                           Apple Inc.                                                                                          ppdc(1)



NAME
       ppdc - cups ppd compiler

SYNOPSIS
       ppdc [ -D name[=value] ] [ -I include-directory ] [ -c message-catalog ] [ -d output-directory ] [ -l language(s) ] [-m] [-t] [ -v ] [ -z ] [ --cr ] [ --crlf ] [ --lf ] source-file

DESCRIPTION
       ppdc compiles PPDC source files into one or more PPD files. This program is deprecated and will be removed in a future release of CUPS.

       The -D option sets the named variable for use in the source file. It is equivalent to using the #define directive in the source file.

       The -I option specifies an alternate include directory; multiple -I options can be supplied to add additional directories.

       The -c option specifies a single message catalog file in GNU gettext source format (filename.po) to be used for localization.

       The -d option specifies the output directory for PPD files. The default output directory is "ppd".

       The  -l  option  specifies  one  or  more  languages  to  use  when  localizing  the  PPD  file(s).  The  default  language  is  "en"  (English). Separate multiple languages with commas, for example
       "de_DE,en_UK,es_ES,es_MX,es_US,fr_CA,fr_FR,it_IT" will create PPD files with German, UK English, Spanish (Spain, Mexico, and US), French (France and Canada), and Italian languages in each file.

       The -m option specifies that the output filename should be based on the ModelName value instead of FileName or PCFilenName.

       The -t option specifies that PPD files should be tested instead of generated.

       The -v option provides more verbose output, basically a running status of which files are being loaded or written.

       The -z option generates compressed PPD files (filename.ppd.gz).  The default is to generate uncompressed PPD files.

       The --cr, --crlf, and --lf options specify the line ending to use - carriage return, carriage return and line feed, or line feed. The default is to use the line feed character alone.

SEE ALSO
       ppdhtml(1), ppdi(1), ppdmerge(1), ppdpo(1), ppdcfile(5)
       http://localhost:631/help

COPYRIGHT
       Copyright 2007-2013 by Apple Inc.



15 February 2012                                                                                     CUPS                                                                                             ppdc(1)
