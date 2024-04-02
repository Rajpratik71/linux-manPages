pkgmaintainermangler(1)                                       General Commands Manual                                      pkgmaintainermangler(1)

NAME
       pkgmaintainermangler - change the Debian Maintainer field in a binary package during the build

SYNOPSIS
       pkgmaintainermangler directory

DESCRIPTION
       pkgmaintainermangler adjusts the maintainer field in binary packages to match a set of rules defined in the pkgmaintainermangler configura‐
       tion file, found at /etc/pkgbinarymangler/maintainermangler.conf.

       The directory option tells pkgmaintainermangler where to find the build directory which contains DEBIAN/control, so it can mangle it appro‐
       priately.   As  pkgmaintainermangler  is  generally invoked from a dpkg-deb(1) wrapper, it will also accept dpkg-deb's command-line syntax,
       ignoring superfluous options.

       By default, pkgmaintainermangler is inactive. To enable it, the enable option in the configuration file must be set to true.

ENVIRONMENT VARIABLES
       NO_PKG_MANGLE
              If this variable is set to a nonempty value, then pkgmaintainermangler is disabled. This is most useful  if  source  packages  build
              nested binary packages as part of their build.

AUTHOR
       pkgmaintainermangler is developed by Adam Conrad <adconrad@ubuntu.com>.

Adam Conrad                                                     September 06, 2006                                         pkgmaintainermangler(1)
