CHECK-SYMBOLS(1)                                              General Commands Manual                                             CHECK-SYMBOLS(1)

NAME
       check-symbols - verify symbols exported by a new library version

SYNOPSIS
       check-symbols <source-package> [DEBDIR]

DESCRIPTION
       To  verify the symbols exported by a new library version, run check-symbols with the name of the source package as argument.  check-symbols
       will first determine the symbols exported by the existing and installed library version, then install the new library and compare the  sym‐
       bols  exported  by the new library version with the symbols exported by the old version.  For each of the symbols found, check-symbols will
       list if the symbol is new, unchanged or has been removed in the new library version.

       In case the source package contains multiple binary library packages, all library files in each of the binary packages will be verified.

       check-symbols uses nm -D to determine the exported symbols of the libraries.

       If no value is given for DEBDIR, the script will assume the new library deb files are stored in /var/cache/pbuilder/result.

EXAMPLES
       check-symbols telepathy-glib .

       This will:

         · Use nm -D to determine the exported symbols of the old,
           installed versions of the libraries provided by telepathy-glib.

         · Install the binary libraries provided by the new version of
           telepathy-glib.

         · Compare the output of nm -D of the new libraries with the
           output of the old version.

         · List the result in diff format.

BUGS
       Please report bugs on:
       https://bugs.launchpad.net/ubuntu/+source/ubuntu-dev-tools/

SEE ALSO
       nm(1)

AUTHOR
       check-symbols was written by Daniel Holbach <daniel.holbach@ubuntu.com> and this manpage by Albert Damen <albrt@gmx.net>. Both are licensed
       under the GNU General Public License, version 2.

ubuntu-dev-tools                                                 December 9, 2007                                                 CHECK-SYMBOLS(1)
