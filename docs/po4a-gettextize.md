PO4A-GETTEXTIZE(1p)                                                 Po4a Tools                                                 PO4A-GETTEXTIZE(1p)

NAME
       po4a-gettextize - convert an original file (and its translation) to a PO file

SYNOPSIS
       po4a-gettextize -f fmt -m master.doc [-l XX.doc] -p XX.po

       (XX.po is the output, all others are inputs)

DESCRIPTION
       The po4a (PO for anything) project goal is to ease translations (and more interestingly, the maintenance of translations) using gettext
       tools on areas where they were not expected like documentation.

       The po4a-gettextize script is in charge of converting documentation files to PO files.  If you start a new translation, po4a-gettextize
       will extract the translatable strings from the documentation file and write a POT file from it.

       If you already have a translated file, po4a-gettextize will try to extract the translations it contains and put them in place in the
       written PO file. Be warned that very few intelligence is used in this process: the Nth string of the translated file is supposed to be the
       translation of the Nth string in the original. If it's not the case, you're dead. That's why it is very important that both files share
       exactly the same structure.

       However, po4a-gettextize will diagnose your death by detecting any desynchronisation between files, and reporting where they occur. In that
       case, you should edit manually the files to solve the reported disparity. Even if no error were reported, you should check carefully that
       the generated PO file is correct (i.e. that each msgstr is the translation of the associated msgid, and not the one before or after).

       Even if the script manages to do its job without any apparent problem, it still marks all extracted translations as fuzzy, to make sure
       that the translator will have a look at them, and detect any remaining problem.

       If the master document has non-ASCII characters, the new generated PO file will be in UTF-8, in order to allow non-standard characters in a
       culture independent way. Else (if the master document is completely in ASCII), the generated PO will use the encoding of the translated
       input document.

OPTIONS
       -f, --format
           Format of the documentation you want to handle. Use the --help-format option to see the list of available formats.

       -m, --master
           File containing the master document to translate. You can use this option multiple times if you want to gettextize multiple documents.

       -M, --master-charset
           Charset of the file containing the document to translate.

       -l, --localized
           File containing the localized (translated) document. If you provided multiple master files, you may wish to provide multiple localized
           file by using this option more than once.

       -L, --localized-charset
           Charset of the file containing the localized document.

       -p, --po
           File where the message catalog should be written. If not given, the message catalog will be written to the standard output.

       -o, --option
           Extra option(s) to pass to the format plugin. Specify each option in the 'name=value' format. See the documentation of each plugin for
           more information about the valid options and their meanings.

       -h, --help
           Show a short help message.

       --help-format
           List the documentation formats understood by po4a.

       -V, --version
           Display the version of the script and exit.

       -v, --verbose
           Increase the verbosity of the program.

       -d, --debug
           Output some debugging information.

       --msgid-bugs-address email@address
           Set the report address for msgid bugs. By default, the created POT files have no Report-Msgid-Bugs-To fields.

       --copyright-holder string
           Set the copyright holder in the POT header. The default value is "Free Software Foundation, Inc."

       --package-name string
           Set the package name for the POT header. The default is "PACKAGE".

       --package-version string
           Set the package version for the POT header. The default is "VERSION".

SEE ALSO
       po4a-normalize(1), po4a-translate(1), po4a-updatepo(1), po4a(7)

AUTHORS
        Denis Barbier <barbier@linuxfr.org>
        Nicolas François <nicolas.francois@centraliens.net>
        Martin Quinson (mquinson#debian.org)

COPYRIGHT AND LICENSE
       Copyright 2002-2012 by SPI, inc.

       This program is free software; you may redistribute it and/or modify it under the terms of GPL (see the COPYING file).

Po4a Tools                                                          2016-01-05                                                 PO4A-GETTEXTIZE(1p)
