CVS-DEBI(1)                                                                              General Commands Manual                                                                              CVS-DEBI(1)

NAME
       cvs-debi - install cvs-buildpackage/cvs-debuild generated package

SYNOPSIS
       cvs-debi [options] [package ...]

DESCRIPTION
       cvs-debi is run from the CVS working directory after cvs-buildpackage or cvs-debuild.  It uses the cvs-buildpackage system to locate the .changes file generated in that run.  It then runs debpkg
       -i on every .deb archive listed in the .changes file to install them, assuming that all of the .deb archives live in the same directory as the .changes file.  Note that you probably  don't  want
       to run this program on a .changes file relating to a different architecture after cross-compiling the package!

       If a list of packages is given on the command line, then only those debs with names in this list of packages will be installed.

       Note that unlike cvs-buildpackage, the only way to specify the source package name is with the -P option; you cannot simply have it as the last command-line parameter.

       Since  installing  a package requires root privileges, debi calls debpkg rather than dpkg directly.  Thus debi will only be useful if it is either being run as root or debpkg can be run as root.
       See debpkg(1) for more details.

OPTIONS
       All current cvs-buildpackage options are silently accepted; however, only the ones listed below have any effect.  For more details on all of them, see the cvs-buildpackage(1) manpage.

       -adebian-architecture, -tGNU-system-type
              See dpkg-architecture(1) for a description of these options.  They affect the search for the .changes file.  They are provided to mimic the behaviour of dpkg-buildpackage when determining
              the name of the .changes file.

       -Mmodule
              The name of the CVS module.

       -Ppackage
              The name of the package.

       -Vversion
              The version number of the package.

       -Ttag  The CVS tag to use for exporting sources.

       -Rroot directory
              Root of the original sources archive.

       -Wwork directory
              The full path name for the cvs-buildpackage working directory.

       -xprefix
              This option provides the CVS default module prefix.

       --help, --version
              Show help message and version information respectively.

SEE ALSO
       cvs-buildpackage(1), cvs-debc(1), cvs-debuild(1), debi(1)

AUTHOR
       cvs-buildpackage was written by Manoj Srivastava, and the current version of debi was written by Julian Gilbey <jdg@debian.org>.  They have been combined into this program by Julian Gilbey.

DEBIAN                                                                                       Debian Utilities                                                                                 CVS-DEBI(1)
