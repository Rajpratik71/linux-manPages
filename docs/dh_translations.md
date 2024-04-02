DH_TRANSLATIONS(1)                                                   Debhelper                                                  DH_TRANSLATIONS(1)

NAME
       dh_translations - perform common translation related operations

SYNOPSIS
       dh_translations [debhelper options]

DESCRIPTION
       dh_translations is a debhelper program to perform common translation related operations during package build:

       ·   Try to build a current PO template.

       ·   Remove inline translations from *.desktop, *.server, *.schemas, and *.policy files and replace them with a link to the gettext domain,
           so that strings in them will get translated at runtime from *.mo files.  This allows language packs to ship updated translations.

SEE ALSO
       debhelper(1)

AUTHOR
       Martin Pitt <martin.pitt@ubuntu.com>

       Copyright (C) 2011 Canonical Ltd., licensed under the GNU GPL v2 or later.

132~cloud0                                                          2018-02-07                                                  DH_TRANSLATIONS(1)
