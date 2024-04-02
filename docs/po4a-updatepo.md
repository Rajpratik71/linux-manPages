PO4A-UPDATEPO(1p)                                                   Po4a Tools                                                   PO4A-UPDATEPO(1p)

NAME
       po4a-updatepo - update the translation (in PO format) of documentation

SYNOPSIS
       po4a-updatepo -f fmt (-m master.docE)+ (-p XX.po)+

       (XX.po are the outputs, all others are inputs)

DESCRIPTION
       The po4a (PO for anything) project goal is to ease translations (and more interestingly, the maintenance of translations) using gettext
       tools on areas where they were not expected like documentation.

       The po4a-updatepo script is in charge of updating PO files to make them reflect the changes made to the original documentation file. For
       that, it converts the documentation file to a POT file, and call msgmerge(1) on this new POT and on the provided PO files.

       It is possible to give more than one PO file (if you want to update several languages at once), and several documentation files (if you
       want to store the translations of several documents in the same PO file).

       If the master document has non-ASCII characters, it will convert the PO files to UTF-8 (if they weren't already), in order to allow non-
       standard characters in a culture independent way.

OPTIONS
       -f, --format
           Format of the documentation you want to handle. Use the --help-format option to see the list of available formats.

       -m, --master
           File(s) containing the master document to translate.

       -M, --master-charset
           Charset of the files containing the document to translate. Note that all files must have the same charset.

       -p, --po
           PO file(s) to update. If these files do not exist, they are created by po4a-updatepo.

       -o, --option
           Extra option(s) to pass to the format plugin and other po4a internal module.  Specify each option in the 'name=value' format. See the
           documentation of each plugin for more information about the valid options and their meanings.

       --no-previous
           This option removes --previous from the options passed to msgmerge.  This permits to support versions of gettext earlier than 0.16.

       --previous
           This option adds --previous to the options passed to msgmerge.  It requires gettext 0.16 or later, and is activated by default.

       --msgmerge-opt options
           Extra options for msgmerge(1).

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

       --porefs type[,wrap|nowrap]
           Specify the reference format. Argument type can be one of none to not produce any reference, noline to not specify the line number
           (more accurately all line numbers are replaced by 1), counter to replace line number by an increasing counter, and full to include
           complete references.

           Argument can be followed by a comma and either wrap or nowrap keyword.  References are written by default on a single line.  The wrap
           option wraps references on several lines, to mimic gettext tools (xgettext and msgmerge).  This option will become the default in a
           future release, because it is more sensible.  The nowrap option is available so that users who want to keep the old behavior can do so.

       --msgid-bugs-address email@address
           Set the report address for msgid bugs. By default, the created POT files have no Report-Msgid-Bugs-To fields.

       --copyright-holder string
           Set the copyright holder in the POT header. The default value is "Free Software Foundation, Inc."

       --package-name string
           Set the package name for the POT header. The default is "PACKAGE".

       --package-version string
           Set the package version for the POT header. The default is "VERSION".

SEE ALSO
       po4a-gettextize(1), po4a-normalize(1), po4a-translate(1), po4a(7)

AUTHORS
        Denis Barbier <barbier@linuxfr.org>
        Nicolas François <nicolas.francois@centraliens.net>
        Martin Quinson (mquinson#debian.org)

COPYRIGHT AND LICENSE
       Copyright 2002-2012 by SPI, inc.

       This program is free software; you may redistribute it and/or modify it under the terms of GPL (see the COPYING file).

Po4a Tools                                                          2016-01-05                                                   PO4A-UPDATEPO(1p)
