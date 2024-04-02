DH_BUILDDEB(1)                                                       Debhelper                                                      DH_BUILDDEB(1)

NAME
       dh_builddeb - build Debian binary packages

SYNOPSIS
       dh_builddeb [debhelper options] [--destdir=directory] [--filename=name] [-- params]

DESCRIPTION
       dh_builddeb simply calls dpkg-deb(1) to build a Debian package or packages.  It will also build dbgsym packages when dh_strip(1) and
       dh_gencontrol(1) have prepared them.

       It supports building multiple binary packages in parallel, when enabled by DEB_BUILD_OPTIONS.

       When the Rules-Requires-Root field is not (effectively) binary-targets, dh_builddeb will pass --root-owner-group to dpkg-deb(1).

OPTIONS
       --destdir=directory
           Use this if you want the generated .deb files to be put in a directory other than the default of "..".

       --filename=name
           Use this if you want to force the generated .deb file to have a particular file name. Does not work well if more than one .deb is
           generated!

       -- params
           Pass params to dpkg-deb(1) when it is used to build the package.

       -uparams
           This is another way to pass params to dpkg-deb(1).  It is deprecated; use -- instead.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                      DH_BUILDDEB(1)
