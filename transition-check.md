TRANSITION-CHECK(1)                                                                                                                                                                   TRANSITION-CHECK(1)

NAME
       transition-check - check a package list for involvement in transitions

SYNOPSIS
       transition-check --help|--version

       transition-check [-f|--filename=FILENAME] [source package list]

DESCRIPTION
       transition-check checks whether any of the listed source packages are involved in a transition for which uploads to unstable are currently blocked.

       If neither a filename nor a list of packages is supplied, transition-check will use the source package name from debian/control.

OPTIONS
       -f, --filename=filename
           Read a source package name from filename, which should be a Debian package control file or .changes file, and add that package to the list of packages to check.

EXIT STATUS
       The exit status indicates whether any of the packages examined were found to be involved in a transition.

       0   Either --help or --version was used, or none of the packages examined was involved in a transition.

       1   At least one package examined is involved in a current transition.

LICENSE
       This code is copyright by Adam D. Barratt <adam@adam-barratt.org.uk>, all rights reserved.

       This program comes with ABSOLUTELY NO WARRANTY.  You are free to redistribute this code under the terms of the GNU General Public License, version 2 or later.

AUTHOR
       Adam D. Barratt <adam@adam-barratt.org.uk>

Debian Utilities                                                                                2016-03-23                                                                            TRANSITION-CHECK(1)
