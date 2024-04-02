CUPS-GENPPD(8)                                                                             Gutenprint Manual Pages                                                                             CUPS-GENPPD(8)



NAME
       cups-genppd - generate Gutenprint PPD files for use with CUPS

SYNOPSIS
       cups-genppd [-c localedir] [-l locale] [-p prefix] [-q] [-v] model1 [model2, ...modeln]
       cups-genppd -L [-c localedir]
       cups-genppd -M [-v]
       cups-genppd -h
       cups-genppd -V

DESCRIPTION
       cups-genppd  generates  Gutenprint  PPD  files for use with CUPS.  The default behavior is to output PPD files for all models of printer that the Gutenprint printer driver library supports.  You may
       restrict the models by listing either the driver names or the full names of the printers you wish to generate PPD files for after any options.  Additionally, the PPD files may be localised, that is,
       translated, to use your native language rather than US English.  There are commands to find out what printer models and languages are supported.

EXAMPLES
       cups-genppd -v bjc-6200 'Epson Stylus Photo 1280' 'HP DeskJet 850C'
              verbosely generate three PPD files, listing the driver name in the first case, and the full name in the second.

       LANG=de_DE genppd -p ppd -c /usr/share/locale
              generate PPDs for all available models, in directory ppd using the locale data found under /usr/share/locale.  The language to use is taken from the environment (de_DE).

       cups-genppd -L -c /usr/local/share/locale
              list available languages using the locale data found under /usr/local/share/locale.

       cups-genppd -M -v
              list available drivers, with long model descriptions

COMMANDS
       -h     show a help message

       -L     list available translations (message catalogs).  If a locale is used for which there is not a corresponding translation, then then US English will be used.

       -M     list available printer models.  By default, only driver names are listed; if verbose mode is used, the full model name will also be printed

       -V     show version information and defaults

              The default behavior is to output PPDs if no command is given.

OPTIONS
       -c localedir
              use localedir as the base directory for locale data

       -l locale
              output  PPDs  translated  with  messages  for locale.  Note that locale must be a locale as shown by locale -a.  For example, the de translation is used by the de_DE locale; de alone will not
              work.

       -p prefix
              output PPDs in directory prefix.  Directories are not recursively created.

       -q     Quiet mode.

       -v     Verbose mode.

       models a list of printer models, either the driver or quoted full name.

SEE ALSO
       CUPS Software Administrators Manual, http://localhost:631/documentation.html

COPYRIGHT
       Copyright ©  1992-2002 Michael Sweet (mike@easysw.com)

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License, version 2, as published by the Free Software Foundation.

       This manual page was written by Roger Leigh (rleigh@debian.org).



Version 5.2.9                                                                                    07 Jul 2012                                                                                   CUPS-GENPPD(8)
