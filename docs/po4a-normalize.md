PO4A-NORMALIZE(1p)                                                  Po4a Tools                                                  PO4A-NORMALIZE(1p)

NAME
       po4a-normalize - normalize a documentation file by parsing it in po4a, and writing it back

SYNOPSIS
       po4a-normalize -f fmt master.doc

DESCRIPTION
       The po4a (PO for anything) project goal is to ease translations (and more interestingly, the maintenance of translations) using gettext
       tools on areas where they were not expected like documentation.

       The po4a-normalize script is a debugging tool used to make sure that po4a don't change the document when it's not supposed to. Only use it
       if you're developing a new module, or if you doubt the sanity of the tools.

       The generated document will be written to po4a-normalize.output while the generated PO file will be written to po4a-normalize.po. No way to
       change that ;)

OPTIONS
       -o, --option
           Extra option(s) to pass to the format plugin. Specify each option in the 'name=value' format. See the documentation of each plugin for
           more information about the valid options and their meanings.

       -b, --blank
           Create an blank translated document.  The generated translated document will be generated assuming all messages are translated by a
           space or new line.

           This is useful to check what parts of the document cannot be translated.

       -h, --help
           Show a short help message.

       --help-format
           List the documentation formats understood by po4a.

       -f, --format
           Format of the documentation you want to handle. Use the --help-format option to see the list of available formats.

       -M, --master-charset
           Charset of the file containing the document to translate.

       -V, --version
           Display the version of the script and exit.

SEE ALSO
       po4a-gettextize(1), po4a-translate(1), po4a-updatepo(1), po4a(7)

AUTHORS
        Denis Barbier <barbier@linuxfr.org>
        Nicolas François <nicolas.francois@centraliens.net>
        Martin Quinson (mquinson#debian.org)

COPYRIGHT AND LICENSE
       Copyright 2002-2012 by SPI, inc.

       This program is free software; you may redistribute it and/or modify it under the terms of GPL (see the COPYING file).

Po4a Tools                                                          2016-01-05                                                  PO4A-NORMALIZE(1p)
