DH_GENCONTROL(1)                               Debhelper                              DH_GENCONTROL(1)

NAME
       dh_gencontrol - generate and install control file

SYNOPSIS
       dh_gencontrol [debhelper options] [-- params]

DESCRIPTION
       dh_gencontrol is a debhelper program that is responsible for generating control files, and
       installing them into the DEBIAN directory with the proper permissions.

       This program is merely a wrapper around dpkg-gencontrol(1), which calls it once for each
       package being acted on (plus related dbgsym packages), and passes in some additional useful
       flags.

       Note that if you use dh_gencontrol, you must also use dh_builddeb(1) to build the packages.
       Otherwise, your build may fail to build as dh_gencontrol (via dpkg-gencontrol(1)) declares
       which packages are built.  As debhelper automatically generates dbgsym packages, it some times
       adds additional packages, which will be built by dh_builddeb(1).

OPTIONS
       -- params
           Pass params to dpkg-gencontrol(1).

       -uparams, --dpkg-gencontrol-params=params
           This is another way to pass params to dpkg-gencontrol(1).  It is deprecated; use --
           instead.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

12.6.1ubuntu2                                 2019-09-17                              DH_GENCONTROL(1)
