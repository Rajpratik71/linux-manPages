debuild-pbuilder(1)                                                  pbuilder                                                  debuild-pbuilder(1)

NAME
       debuild-pbuilder - A "debuild" wrapper to satisfy build-dependency before debuild

SYNOPSIS
       debuild-pbuilder

DESCRIPTION
       A wrapper to "debuild" program that does Build-Dependency satisfaction.

OPTIONS
       See debuild manpage for details.

EXAMPLES
       debuild-pbuilder
              Satisfy build-dependency and run debuild.

              $ debuild-pbuilder
               -> Attempting to satisfy build-dependencies
               -> Creating pbuilder-satisfydepends-dummy package
              Package: pbuilder-satisfydepends-dummy
              Version: 0.invalid.0
                   .
                   .

AUTHOR
       Initial coding, and main maintenance is done by Junichi Uekawa <dancer@debian.org>.

       The homepage is available at http://pbuilder.alioth.debian.org

SEE ALSO
       /usr/share/doc/pbuilder/pbuilder-doc.html, debuild(1)

Debian                                                              2002 Sep 25                                                debuild-pbuilder(1)
