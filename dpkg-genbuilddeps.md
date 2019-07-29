DPKG-GENBUILDDEPS(1)                                          General Commands Manual                                         DPKG-GENBUILDDEPS(1)

NAME
       dpkg-genbuilddeps - generate a list of packages used to build this package

SYNOPSIS
       dpkg-genbuilddeps [arg ...]

DESCRIPTION
       This  program is a wrapper around dpkg-depcheck(1).  It should be run from the top of a Debian build tree.  It calls dpkg-buildpackage with
       any arguments given on the command line, and by tracing the execution of this, it determines which non-essential packages were used  during
       the package building.  This can be useful in determining what the Build-Depends control fields should contain.  It does not determine which
       packages were used for the arch independent parts of the build and which for the arch dependent parts, not does  it  attempt  to  determine
       which versions of packages are required.  It should be able to run under fakeroot rather than being run as root, as fakeroot dpkg-genbuild‐
       deps, or dpkg-genbuilddeps -rfakeroot.

       This program requires the build-essential package to be installed.  If it is not, please use dpkg-depcheck directly, with a command such as
         dpkg-depcheck --all dpkg-buildpackage -us -uc -b -rfakeroot ...
       All this program itself does is essentially to run the command:
         dpkg-depcheck -b dpkg-buildpackage -us -uc -b -rfakeroot [arg ...]

SEE ALSO
       dpkg-depcheck(1), fakeroot(1)

       The Debian Policy Manual, sections on Build-Depends etc.

AUTHOR
       The original dpkg-genbuilddeps was written by Ben Collins <bcollins@debian.org>.  The current version is  a  simple  wrapper  around  dpkg-
       depcheck written by Bill Allombert <ballombe@debian.org>.  This manual page was written by Julian Gilbey <jdg@debian.org>.

DEBIAN                                                           Debian Utilities                                             DPKG-GENBUILDDEPS(1)
