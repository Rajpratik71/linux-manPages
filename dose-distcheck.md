DISTCHECK(1)                                                        DOSE Tools                                                        DISTCHECK(1)

NAME
       dose-distcheck - check installability of packages according to metadata

SYNOPSIS
       dose-distcheck [option] ... uri
       dose-debcheck [option] ... [file]
       dose-rpmcheck [option] ... [file]
       dose-eclipsecheck [option] ... [file]

DESCRIPTION
       dose-distcheck determines, for a set of package control stanzas, called the repository, whether packages of the repository can be installed
       relative to the repository according to the inter-package relationsships expressed in the package control stanzas.  The exact set of
       relevant control fields and their meaning depends on the type of the repository. The constraint solving algorithm is complete, that is it
       finds a solution whenever there exists one, even for multiple disjunctive dependencies and deep package conflicts. This problem is
       computationally infeasible in theory (that is, NP-complete), but can be solved very efficiently for package repositories that actually
       occur in practice.

       Packages are split into foreground and background: only packages in the foreground are checked for installability, but dependencies may be
       satisfied by foreground packages and by background packages. By default, all packages are in the foreground.

Input Specification
       Currently supported input types are debian, rpm, and eclipse. The dose-distcheck tool expects its input specifiations in the form
       type://pathname where type is one of deb, synthesis, hdlist or eclipse, and pathname is the pathname of a file containing the input. The
       package metadata found in that file must correspond to the type given in the URI.

       When invoked as dose-typecheck then the type of input is assumed to be type, and repositories (in positional arguments or in the values of
       options --fg and --bg) are simply given in form of a pathname of a file containing the repository. If no positional argument is given then
       input is read from standard input.  dose-distcheck also compressed files (.gz , .bz2) as positional arguments. Input read on standard input
       cannot be in compressed form.

Input Formats
   Debian
       The input file has to contain stanzas in the format of deb-control(5), separated by one blank line. For instance, the Packages files as
       found on a Debian mirror server, or in the directory /var/lib/apt/lists/ of a Debian system, are suitable as input to dose-debcheck.
       Installability of packages is analyzed according to their Depends, Conflicts, and Provides fields with their meaning as of Debian policy
       version 3.9.0. Pre-depends are treated like Depends, and Breaks are treated like Conflicts.

       If the input contains several packages with the same values of name, version, and architecture than only the last of these is taken into
       account, and a warning is issued.

       In the case of Debian, it is not possible to install at the same time two packages with the same name but different versions.

   Rpm
       The input file can be either a synthesis file or a hdlist file.  By default dose-rpmcheck expects a synthesis file as input. To specify a
       hdlist file dose-distcheck must be invoked with a file argument of the form hdlist://

   Eclipse
       The input is an 822 file containing the encoding of OSGi plugins  content.xml files.

   Cv
       Internal use only. Undocumented.

OPTIONS
   OPTIONS CONTROLLING FOREGROUND AND BACKGROUND
       --fg=file
               Add packages in file to the foreground.

       --bg=file
               Add packages in file to the background.

       --checkonly package [,package] ...
               Takes a comma-separated list of package names, each of them possibly with a version constraint, as argument. The foreground is
               constituted of all packages that match any of the expressions, all other packages are pushed into the background. The initial
               distinction between foreground and background is ignored. This option must not be combined with --coinst.

               Example: --checkonly "libc6 , 2ping (= 1.2.3-1)"

       --coinst  package [,package] ...
               Takes a comma-separated list of package names, each of them possibly with a version constraint, as argument. If this list consists
               of n expressions, then co-installability will be checked independently for each set of n packages where the i-th element of the set
               matches the i-th expression. The initial distinction between foreground and background is ignored. This option must not be combined
               with --checkonly.

               Example: --coinst "a (>1), b"

               If we have package a in versions 1, 2 and 3, and package b in versions 11 and 12, then this will check 4 pairs of packages for co-
               installability, namely (a=2,b=11), (a=2,b=12), (a=3,b=11) and (a=3,b=12).

   DEBIAN SPECIFIC OPTIONS
       Multi-arch annotations are correctly considered by distcheck. Packages whose's architecture is neither the native architecture nor in the
       list of foreign architectures (see below) are ignored.

       --deb-native-arch=name
               Specify the native architecture. The default behavior is to deduce the native architecture from the first package stanza in the
               input that has an architecture different from all.

       --deb-foreign-archs=name [,name] ...
               Specify a comma-separated list of foreign architectures. The default is an empty list of foreign architectures.

       --deb-ignore-essential
               Do not consider essential packages as part of the installation problem.  By default all essential package are considered as part of
               the installation problem for all packages, that is a package is installable if and only if it is co-installable with all essential
               packages. This option allows the user to test the installability with no essential packages installed.

   OPTIONS FOR FILTERING THE INPUT
       --latest
               Only the latest version of each package is kept, older versions of packages are ignored.

   OPTIONS CONTROLLING OUTPUT
       -f, --failures
               List all packages that are found not to be installable.

       -s, --successes
               List all packages that are found to be installable. May be used together with --failures, in this case the value of the status
               field in the output allows one to distinguish installable from non-installable packages.

       -e, --explain
               Give explanations. If used together with --failures then the explanation consists of dependency chains leading to a conflict or a
               dependency on a missing package. If used together with --successes then the explanation consists of an installation set.

       -m, --explain-minimal
               For all packages P that are found installable, and when used in conjunction with --successes, prints a reduced installation set
               containing only those packages in the dependency cone of P. When used with Debian repositories, all essential packages and their
               dependencies that are not in the cone of P are omitted.  When used in conjunction with --failures, and --explain, all dependencies
               chains are not printed.

       --summary
               Gives a more detailed summary of the findings.

       -o file Send output to file.

   MISC OPTIONS
       -v      Enable info / warnings / debug messages.  This option may be repeated up to three times in order to increase verbosity.

       --quiet Do not print warning messages

       --progress
               Show progress bars.

       --timers
               Show timing information.

       -h, --help
               Display this list of options.

       --version
               Show program version and exit.

EXIT CODES
       Exit codes 0-63 indicate a normal termination of the program, codes 64-127 indicate abnormal termination of the program (such as parse
       errors, I/O errors).

       In case of normal program termination:

       - exit code 0 indicates that all foreground packages are found installable;

       - exit code 1 indicates that at least one foreground package is found uninstallable.

EXAMPLE
       Check which packages in a particular distribution are not installable and why:

        dose-distcheck -v -f -e \
        --bg deb:///var/lib/apt/lists/ftp.fr.debian.org_debian_dists_sid_main_binary-amd64_Packages\
        --bg deb:///var/lib/apt/lists/ftp.fr.debian.org_debian_dists_sid_non-free_binary-amd64_Packages\
        --fg deb:///var/lib/apt/lists/ftp.fr.debian.org_debian_dists_sid_contrib_binary-amd64_Packages

       where Packages is the file pertaining to that distribution, as for instance found in the directory /var/lib/apt/lists.

       Check which packages in contrib are not installable when dependencies may be satisfied from main:

         dose-debcheck --failures --bg=main_Packages contrib_Packages

NOTE
       Dose-distcheck is a complete reimplementation of edos-debcheck, written for the EDOS project.

AUTHOR
       The first version of debcheck was written by Jerome Vouillon for the EDOS project. The current version has been rewritten on the basis of
       the dose3 library by Pietro Abate.

SEE ALSO
       deb-control(5)

       <http://www.edos-project.org> is the home page of the EDOS project.

       <http://www.mancoosi.org> is the home page of the Mancoosi project.

                                                                    2016-01-03                                                        DISTCHECK(1)
