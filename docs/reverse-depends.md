reverse-depends(1)                                            General Commands Manual                                           reverse-depends(1)

NAME
       reverse-depends - List the reverse-dependencies (or build-dependencies) of a package

SYNOPSIS
       reverse-depends [options] package

DESCRIPTION
       List  reverse-dependencies  (or build-dependencies) of package.  If the package name is prefixed with src: then the reverse-dependencies of
       all the binary packages that the specified source package builds will be listed.

OPTIONS
       -r RELEASE, --release=RELEASE
              Query dependencies in RELEASE.  Default: current development release.

       -R, --without-recommends
              Only consider Depends relationships, not Recommends.

       -s, --with-suggests
              Also consider Suggests relationships.

       -b, --build-depends
              Query build dependencies.  Synonym for --arch=source.

       -a ARCH, --arch=ARCH
              Query dependencies in ARCH.  Besides valid architecture names, the special values any and source may  be  used.   any  displays  all
              reverse dependencies, the union across all architecture.  source displays build dependencies.  Default: any.

       -c COMPONENT, --component=COMPONENT
              Only consider reverse-dependencies in COMPONENT. Can be specified multiple times.  Default: all components.

       -l, --list
              Display a simple, machine-readable list.

       -u URL, --service-url=URL
              Reverse Dependencies web-service URL.  Default: UbuntuWire's service at http://qa.ubuntuwire.org/rdepends/.

       -h, --help
              Display a help message and exit

EXAMPLES
       All reverse dependencies of source package bash:

              reverse-depends src:bash

AUTHORS
       reverse-depends and this manpage were written by Stefano Rivera <stefanor@ubuntu.com>.

       Both are released under the terms of the ISC License.

ubuntu-dev-tools                                                   November 2011                                                reverse-depends(1)
