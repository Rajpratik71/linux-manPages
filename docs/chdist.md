CHDIST(1)                                                                                                                                CHDIST(1)

NAME
       chdist - script to easily play with several distributions

SYNOPSIS
       chdist [options] [command] [command parameters]

DESCRIPTION
       chdist is a rewrite of what used to be known as 'MultiDistroTools' (or mdt). Its use is to create 'APT trees' for several distributions,
       making it easy to query the status of packages in other distribution without using chroots, for instance.

OPTIONS
       -h, --help
           Provide a usage message.

       -d, --data-dir DIR
           Choose data directory (default: $HOME/.chdist/).

       -a, --arch ARCH
           Choose architecture (default: `dpkg --print-architecture`).

       --version
           Display version information.

COMMANDS
       create DIST [URL RELEASE SECTIONS]
           Prepare a new tree named DIST

       apt-get DIST <update|source|...>
           Run apt-get inside DIST

       apt-cache DIST <show|showsrc|...>
           Run apt-cache inside DIST

       apt-file DIST <update|search|...>
           Run apt-file inside DIST

       apt-rdepends DIST [...]
           Run apt-rdepends inside DIST

       src2bin DIST SRCPKG
           List binary packages for SRCPKG in DIST

       bin2src DIST BINPKG
           List source package for BINPKG in DIST

       compare-packages DIST1 DIST2 [DIST3, ...]
       compare-bin-packages DIST1 DIST2 [DIST3, ...]
           List versions of packages in several DISTributions

       compare-versions DIST1 DIST2
       compare-bin-versions DIST1 DIST2
           Same as compare-packages/compare-bin-packages, but also runs dpkg --compare-versions and display where the package is newer.

       compare-src-bin-packages DIST
           Compare sources and binaries for DIST

       compare-src-bin-versions DIST
           Same as compare-src-bin-packages, but also run dpkg --compare-versions and display where the package is newer

       grep-dctrl-packages DIST [...]
           Run grep-dctrl on *_Packages inside DIST

       grep-dctrl-sources DIST [...]
           Run grep-dctrl on *_Sources inside DIST

       list
           List available DISTs

COPYRIGHT
       This program is copyright 2007 by Lucas Nussbaum and Luk Claes. This program comes with ABSOLUTELY NO WARRANTY.

       It is licensed under the terms of the GPL, either version 2 of the License, or (at your option) any later version.

Debian Utilities                                                    2016-03-23                                                           CHDIST(1)
