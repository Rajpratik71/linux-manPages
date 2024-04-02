BUILD-RDEPS(1)                                                                                                                      BUILD-RDEPS(1)

NAME
       build-rdeps - find packages that depend on a specific package to build (reverse build depends)

SYNOPSIS
       build-rdeps package

DESCRIPTION
       build-rdeps searches for all packages that build-depend on the specified package.

       The default behaviour is to just `grep` for the given dependency in the Build-Depends field of apt's Sources files.

       If the package dose-extra >= 4.0 is installed, then a more complete reverse build dependency computation is carried out. In particular,
       with that package installed, build-rdeps will find transitive reverse dependencies, respect architecture and build profile restrictions,
       take Provides relationships, Conflicts, Pre-Depends, Build-Depends-Arch and versioned dependencies into account and correctly resolve
       multiarch relationships for crossbuild reverse dependency resolution.  (This tends to be a slow process due to the complexity of the
       package interdependencies.)

OPTIONS
       -u, --update
           Run apt-get update before searching for build-depends.

       -s, --sudo
           Use sudo when running apt-get update. Has no effect if -u is omitted.

       --distribution
           Select another distribution, which is searched for build-depends.

       --only-main
           Ignore contrib and non-free

       --exclude-component
           Ignore the given component (e.g. main, contrib, non-free).

       --origin
           Restrict the search to only the specified origin (such as "Debian").

       -m, --print-maintainer
           Print the value of the maintainer field for each package.

       --host-arch
           Explicitly set the host architecture. The default is the value of `dpkg-architecture -qDEB_HOST_ARCH`. This option only works if dose-
           extra >= 4.0 is installed.

       --old
           Force the old simple behaviour without dose-ceve support even if dose-extra >= 4.0 is installed.  (This tends to be faster.)

           Notice, that the old behaviour only finds direct dependencies, ignores virtual dependencies, does not find transitive dependencies and
           does not take version relationships, architecture restrictions, build profiles or multiarch relationships into account.

       --build-arch
           Explicitly set the build architecture. The default is the value of `dpkg-architecture -qDEB_BUILD_ARCH`. This option only works if
           dose-extra >= 4.0 is installed.

       -d, --debug
           Run the debug mode

       --help
           Show the usage information.

       --version
           Show the version information.

REQUIREMENTS
       The tool requires apt Sources files to be around for the checked components.  In the default case this means that in /var/lib/apt/lists
       files need to be around for main, contrib and non-free.

       In practice this means one needs to add one deb-src line for each component, e.g.

       deb-src http://<mirror>/debian <dist> main contrib non-free

       and run apt-get update afterwards or use the update option of this tool.

LICENSE
       This code is copyright by Patrick Schoenfeld <schoenfeld@debian.org>, all rights reserved.  This program comes with ABSOLUTELEY NO
       WARRANTY.  You are free to redistribute this code under the terms of the GNU General Public License, version 2 or later.

AUTHOR
       Patrick Schoenfeld <schoenfeld@debian.org>

Debian Utilities                                                    2016-03-23                                                      BUILD-RDEPS(1)
