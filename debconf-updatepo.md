DEBCONF-UPDATEPO(1)                           po-debconf                           DEBCONF-UPDATEPO(1)

NAME
       debconf-updatepo - update PO files about debconf templates

SYNOPSIS
       debconf-updatepo [-v] [-h] [--podir=DIR] [--skip-pot] [--skip-merge]
       [--msgid-bugs-address=EMAIL]

DESCRIPTION
       This program reads po/POTFILES.in to determine which master files need to be processed, then
       extracts new gettext strings into  po/templates.pot and updates all po/*.po files.  This script
       can be called either in the top-level directory, or in the debian or debian/po subdirectories.
       It is run by developer and/or translator to update PO files when the English text is modified
       in templates files.

OPTIONS
       -h, --help
           Display a usage summary and exit.

       -v, --verbose
           Process in verbose mode.

       --podir=DIR
           Set directory for PO files.  By default PO files are searched in debian/po, po and ../po
           directories in that order.

       --skip-pot
           Do not generate a new po/templates.pot file.

       --skip-merge
           Do not merge existing PO files with po/templates.pot.

       --msgid-bugs-address=EMAIL
           Set the email address that will be specified in the POT's Report-Msgid-Bugs-To field.

           By default, this field is set to <package>@package.debian.org.

           It is intended for the maintainers of Debian based distributions, and should be used in the
           following cases:

           o   The package is not present in Debian (and thus the <package>@packages.debian.org
               address does not exist).

           o   The maintainer made significant changes in the debconf templates (or added templates to
               a Debian package without templates), and does not want to bother the Debian maintainer
               with bug reports that won't be relevant for the Debian maintainer.

           The default address is preferred to avoid corrections in the Debian based distribution
           without a notification to the Debian maintainer.

SEE ALSO
       debconf-gettextize(1), po2debconf(1), podebconf-report-po(1), po-debconf(7).

AUTHOR
         Denis Barbier <barbier@linuxfr.org>

                                              2018-11-20                           DEBCONF-UPDATEPO(1)
