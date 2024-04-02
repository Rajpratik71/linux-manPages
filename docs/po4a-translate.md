PO4A-TRANSLATE(1p)                                                  Po4a Tools                                                  PO4A-TRANSLATE(1p)

NAME
       po4a-translate - convert a PO file back to documentation format

SYNOPSIS
       po4a-translate -f fmt -m master.doc -p XX.po -l XX.doc

       (XX.doc is the output, all others are inputs)

DESCRIPTION
       The po4a (PO for anything) project goal is to ease translations (and more interestingly, the maintenance of translations) using gettext
       tools on areas where they were not expected like documentation.

       The po4a-translate script is in charge of converting the translation (which was done in a PO file) back into the documentation format. The
       provided PO file should be the translation of the POT file which was produced by po4a-gettextize(1).

OPTIONS
       -f, --format
           Format of the documentation you want to handle. Use the --help-format option to see the list of available formats.

       -a, --addendum
           Add a file to the resulting file (to put translator's name or a section "About this translation", for example). The first line of the
           file to insert should be a PO4A header indicating where it should be added (see section HOWTO add extra text to translations in
           po4a(7)).

       -A, --addendum-charset
           Charset of the addenda. Note that all the addenda should be in the same charset.

       -m, --master
           File containing the master document to translate.

       -M, --master-charset
           Charset of the file containing the document to translate.

       -l, --localized
           File where the localized (translated) document should be written.

       -L, --localized-charset
           Charset of the file containing the localized document.

       -p, --po
           File from which the message catalog should be read.

       -o, --option
           Extra option(s) to pass to the format plugin. Specify each option in the 'name=value' format. See the documentation of each plugin for
           more information about the valid options and their meanings.

       -k, --keep
           Minimal threshold for translation percentage to keep (i.e. write) the resulting file (default: 80). I.e. by default, files have to be
           translated at at least 80% to get written.

       -w, --width
           Column at which we should wrap the resulting file.

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

Adding content (beside translations) to generated files
       To add some extra content to the generated document beside what you translated (like the name of the translator, or a "About this
       translation" section), you should use the --addendum option.

       The first line of the addendum must be a header indicating where to put it in the document (it can be before or after a given part of the
       document).  The rest of the file will be added verbatim to the resulting file without further processing.

       Note that if po4a-translate fails to add one of the given files, it discards the whole translation (because the missing file could be the
       one indicating the author, what would prevent the users to contact him to report bugs in the translation).

       The header has a pretty rigid syntax. For more information on how to use this feature and how it works, please refer to the po4a(7) man
       page.

SEE ALSO
       po4a-gettextize(1), po4a-normalize(1), po4a-updatepo(1), po4a(7)

AUTHORS
        Denis Barbier <barbier@linuxfr.org>
        Nicolas François <nicolas.francois@centraliens.net>
        Martin Quinson (mquinson#debian.org)

COPYRIGHT AND LICENSE
       Copyright 2002-2012 by SPI, inc.

       This program is free software; you may redistribute it and/or modify it under the terms of GPL (see the COPYING file).

Po4a Tools                                                          2016-01-05                                                  PO4A-TRANSLATE(1p)
