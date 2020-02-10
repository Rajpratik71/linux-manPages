MK-BUILD-DEPS(1)                                                                                                                                                                         MK-BUILD-DEPS(1)

NAME
       mk-build-deps - build a package satisfying a package's build-dependencies

SYNOPSIS
       mk-build-deps --help|--version

       mk-build-deps [options] control file | package name ...

DESCRIPTION
       Given a package name and/or control file, mk-build-deps will use equivs to generate a binary package which may be installed to satisfy all the build dependencies of the given package.

       If --build-dep and/or --build-indep are given, then the resulting binary package(s) will depend solely on the Build-Depends/Build-Depends-Indep dependencies, respectively.

OPTIONS
       -i, --install
           Install the generated packages and its build-dependencies.

       -t, --tool
           When installing the generated package use the specified tool.  (default: apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends)

       -r, --remove
           Remove the package file after installing it. Ignored if used without the --install switch.

       -a foo, --arch foo
           Set the architecture of the produced binary package to foo. If this option is not given, fall back to the value given by --host-arch. If neither this option nor --host-arch are given but the
           Build-Depends contain architecture restrictions, use the value printed by `dpkg-architecture -qDEB_HOST_ARCH`.  Otherwise, use all.

           The package architecture must be equal to the host architecture except if the package architecture is all.

           The package architecture cannot be all if the build and host architecture differ.

       --host-arch foo
           Set the host architecture the binary package is built for. This defaults to the value printed by `dpkg-architecture -qDEB_HOST_ARCH`. Use this option to create a binary package that is able
           to satisfy crossbuild dependencies.

           If this option is used together with --arch, then they must be equal except if the value of --arch is all.

           If --arch is not given, then this option also sets the package architecture.

       --build-arch foo
           Set the build architecture the binary package is built for. This defaults to the value printed by `dpkg-architecture -qDEB_BUILD_ARCH`. Use this option to create a binary package that is
           able to satisfy crossbuild dependencies.

       -B, --build-dep
           Generate a package which only depends on the source package's Build-Depends dependencies.

       -A, --build-indep
           Generate a package which only depends on the source package's Build-Depends-Indep dependencies.

       -h, --help
           Show a summary of options.

       -v, --version
           Show version and copyright information.

       -s, --root-cmd
           Use the specified tool to gain root privileges before installing.  Ignored if used without the --install switch.

AUTHOR
       mk-build-deps is copyright by Vincent Fourmond and was modified for the devscripts package by Adam D. Barratt <adam@adam-barratt.org.uk>.

       This program comes with ABSOLUTELY NO WARRANTY.  You are free to redistribute this code under the terms of the GNU General Public License, version 2 or later.

Debian Utilities                                                                                2016-03-23                                                                               MK-BUILD-DEPS(1)
