DEBORPHAN(1)                                                                            General Commands Manual                                                                           DEBORPHAN(1)

NAME
       deborphan - Orphaned package finder

SYNOPSIS
       deborphan [OPTION]... [PACKAGE]...

DESCRIPTION
       deborphan finds packages that have no packages depending on them. The default operation is to search only within the libs and oldlibs sections to hunt down unused libraries.

       If  it  is  invoked  with an optional list of packages, only the dependencies on those packages will be checked. The results are printed to stdout as if the option --show-deps had been given.
       Searching for specific packages will show the package, regardless of its priority. It is possible to specify -, to read a list of packages from standard input.

OPTIONS
       -f, --status-file=FILE
              Use FILE as the status file.

       -h, --help
              Display a short help message and exit.

       -v, --version
              Display version information and exit.

   OUTPUT MODIFIERS
       -d, --show-deps
              Show a list of all installed packages and name the packages that depend on them.

       -P, --show-priority
              Show the priority of the packages found.

       -s, --show-section
              Show the sections the packages are in.

       --no-show-section
              Override showing sections when the default is to show them (see --all-packages).

       -z, --show-size
              Show the installed size of the packages found.

   SEARCH MODIFIERS
       -a, --all-packages
              Check all the packages, instead of only those in the libs section. Best used (if at all used) in combination with --priority. This option implies --show-section.

       -e, --exclude=LIST
              Excludes the packages named in LIST (a comma separated list) from the evaluation as if they didn't exist in the status file.

       -H, --force-hold
              Ignore "hold" dpkg-flags on packages and thus display these packages. Without this option packages with the "hold" flag set will not be displayed. Please  refer  to  dpkg(1)  for  more
              information about package flags. Due a bug in aptitude (Debian bug #137771) hold flags created by aptitude are ignored by deborphan.

       --ignore-suggests
       --ignore-recommends
              Do  not  check  if there is a package `suggesting' (--ignore-suggests) or `recommending' (--ignore-recommends) the package. When both options are used together, deborphan behaves as if
              the `nice-mode' mentioned below has been turned off.

       -n, --nice-mode
              Turn off nice-mode.  Nice-mode checks if there is a package `suggesting' or `recommending' the package.  If one is found, the package will be marked as in use, or, when --show-deps  is
              used, print out the package suggesting the package as if it were depending on it.

       -p, --priority=PRIORITY
              Show  only  those  packages  with  a priority equal to, or greater than PRIORITY. PRIORITY may be in the range of 1-5, or one of required, important, standard, optional, extra. Default
              value for PRIORITY is 2 (important).

       --find-config
              This option searches for uninstalled packages which still have configuration files on the system.  It implies the -a option.

       --libdevel
              Search in section libdevel in addition to libs and oldlibs.

   KEEP FILE MANAGEMENT
       -A, --add-keep PKG1...PKGn
              Add packages to the list of packages which are never to be reported, regardless of their state. You may specify '-' to use standard input. Note that package names are case-sensitive.

       -k, --keep-file=FILE
              Use FILE to store the list of kept-back packages.

       -L, --list-keep
              Show the list of packages that are being kept back.

       -R, --del-keep PKG1...PKGn
              Remove packages from the list of packages which are never to be reported.  You may specify '-' to use standard input.  If there are no dependencies for this package next time deborphan
              is invoked, it will be reported again.

       -Z, --zero-keep
              Purge the entire list of packages that are being kept back. The only option possible in combination with this option is -A.

   GUESSING
       --guess-*
       --no-guess-*
              deborphan  can try to guess what packages may not be of much use to you by examining the package's name and/or description. It will pretend the package is in the main/libs section, and
              report it as if it were a library. This method is in no way perfect or even reliable, so beware when using this! It is also possible to tell deborphan e.g. to  guess  all  interpreters
              but  not  Perl by using --guess-interpreters --no-guess-perl or to guess all but not Mono by using --guess-all --no-guess-mono. Please note that the --no-guess- option must occur after
              the --guess- option it modifies, this makes it possible to declare more complex things like to guess all, except interpreters but additionally try to guess perl.

       The following options are to be prefixed by --guess- or (except only) by --no-guess-:

       common This option tries to find common packages, i.e. packages with names ending in -common.

       data   This option tries to find data packages, i.e. packages with names ending in -data.

       debug  This option tries to find debugging libraries, i.e. packages with names ending in -dbg.

       dev    This option tries to find development packages, i.e. packages with names ending in -dev.  Also see option --libdevel.

       doc    This option tries to find documentation packages, i.e. packages with names ending in -doc.

       dummy  This option tries to find dummy packages, i.e. packages with dummy or transitional in their short description.

       kernel This option tries to find kernel-modules. It tries to match (-modules|^nvidia-kernel)-.*[0-9]+\.[0-9]+\.[0-9]+.

       interpreters
              Try to find all interpreter modules (i.e. imply ruby, pike, python, perl and mono).

       mono   This option tries to find mono libraries. It tries to match ^libmono.

       perl   This option tries to find perl modules. It tries to match ^lib.*-perl$.

       pike   This option tries to find pike modules. It tries to match ^pike[[:digit:]]*-.

       python This option tries to find python modules. It tries to match ^python[[:digit:]]*-.

       ruby   This option tries to find ruby modules. It tries to match ^lib.*-ruby[[:digit:].]*$.

       section
              This option tries to find libraries that were accidentally placed in the wrong section. It tries to match ^lib, but not if it ends in one of: -dbg, -doc, -perl, or -dev.

       all    Try all of the above.

       only   Ignore the package's section completely, and just go for the name and/or description. This option must be used in conjunction with one or more of the --guess options listed  above,  or
              deborphan will not display anything.

FILES
       /var/lib/dpkg/status
              Statuses of available packages. See the section INFORMATION ABOUT PACKAGES in dpkg's man-page for more information.

       /var/lib/deborphan/keep
              A newline-separated list of packages to keep. Package names are in no particular order.

SEE ALSO
       dpkg(8), dselect(8), orphaner(8), editkeep(8), cruft(8), xargs(1)

BUGS
       If you report a bug, please include your /var/lib/dpkg/status file.  That would help in reproducing the bugs.

AUTHORS
       deborphan was written by Cris van Pelt <"Cris van Pelt"@tribe.eu.org>, then maintained by Peter Palfrader <weasel@debian.org> but is nowadays maintained Carsten Hey <c.hey@web.de>

deborphan                                                                                    February 2009                                                                                DEBORPHAN(1)
