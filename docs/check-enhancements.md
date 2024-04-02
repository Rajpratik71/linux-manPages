CHECK-ENHANCEMENTS(1)                                      Debian-goodies documentation                                      CHECK-ENHANCEMENTS(1)

NAME
       check-enhancements - check-enhancements - show enhancement packages

SYNOPSIS
       check-enhancements ( -ip | -ie | -h | --verbose | --version )

OPTIONS
              Program  options  start  with  dash  or double dash, otherwise they are interpreted as package names. Only non-installed enhancement
              packages are printed out by default, use -ie to show them all.

       -ip, --ip, -installed-packages, --installed-packages

              Show enhancements of all installed packages (could be slow)

       -ie, --ie, -installed-enhancements, --installed-enhancements

              Show installed enhancement packages too

       -h, -help, --help

       -version, --version

       -verbose, --verbose

EXAMPLES
       # check enhancement packages of all installed packages

              check-enhancements -ip

       # check enhancement packages of selected packages

              check-enhancements pkg1 pkgN

check-enhancements 0.3                                             January 2015                                              CHECK-ENHANCEMENTS(1)
