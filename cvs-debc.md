CVS-DEBC(1)                                                                              General Commands Manual                                                                              CVS-DEBC(1)

NAME
       cvs-debc - view contents of a cvs-buildpackage/cvs-debuild generated package

SYNOPSIS
       cvs-debc [options] [package ...]

DESCRIPTION
       cvs-debc  is  run  from the CVS working directory after cvs-buildpackage or cvs-debuild.  It uses the cvs-buildpackage system to locate the .changes file generated in that run.  It then displays
       information about the .deb files which were generated in that run, by running dpkg-deb -I and dpkg-deb -c on every .deb archive listed in the .changes file, assuming that all  of  the  .deb  ar‐
       chives live in the same directory as the .changes file.  It is useful for ensuring that the expected files have ended up in the Debian package.

       If a list of packages is given on the command line, then only those debs with names in this list of packages will be processed.

       Note that unlike cvs-buildpackage, the only way to specify the source package name is with the -P option; you cannot simply have it as the last command-line parameter.

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
       cvs-buildpackage(1), cvs-debi(1), cvs-debuild(1), debc(1)

AUTHOR
       cvs-buildpackage was written by Manoj Srivastava, and the current version of debi was written by Julian Gilbey <jdg@debian.org>.  They have been combined into this program by Julian Gilbey.

DEBIAN                                                                                       Debian Utilities                                                                                 CVS-DEBC(1)
