DH_SHLIBDEPS(1)                                                      Debhelper                                                     DH_SHLIBDEPS(1)

NAME
       dh_shlibdeps - calculate shared library dependencies

SYNOPSIS
       dh_shlibdeps [debhelper options] [-Lpackage] [-ldirectory] [-Xitem] [-- params]

DESCRIPTION
       dh_shlibdeps is a debhelper program that is responsible for calculating shared library dependencies for packages.

       This program is merely a wrapper around dpkg-shlibdeps(1) that calls it once for each package listed in the control file, passing it a list
       of ELF executables and shared libraries it has found.

OPTIONS
       -Xitem, --exclude=item
           Exclude files that contain item anywhere in their filename from being passed to dpkg-shlibdeps. This will make their dependencies be
           ignored.  This may be useful in some situations, but use it with caution. This option may be used more than once to exclude more than
           one thing.

       -- params
           Pass params to dpkg-shlibdeps(1).

       -uparams, --dpkg-shlibdeps-params=params
           This is another way to pass params to dpkg-shlibdeps(1).  It is deprecated; use -- instead.

       -ldirectory[:directory ...]
           With recent versions of dpkg-shlibdeps, this option is generally not needed.

           It tells dpkg-shlibdeps (via its -l parameter), to look for private package libraries in the specified directory (or directories --
           separate with colons). With recent versions of dpkg-shlibdeps, this is mostly only useful for packages that build multiple flavors of
           the same library, or other situations where the library is installed into a directory not on the regular library search path.

       -Lpackage, --libpackage=package
           With recent versions of dpkg-shlibdeps, this option is generally not needed, unless your package builds multiple flavors of the same
           library or is relying on debian/shlibs.local for an internal library.

           It tells dpkg-shlibdeps (via its -S parameter) to look first in the package build directory for the specified package, when searching
           for libraries, symbol files, and shlibs files.

           If needed, this can be passed multiple times with different package names.

EXAMPLES
       Suppose that your source package produces libfoo1, libfoo-dev, and libfoo-bin binary packages. libfoo-bin links against libfoo1, and should
       depend on it. In your rules file, first run dh_makeshlibs, then dh_shlibdeps:

               dh_makeshlibs
               dh_shlibdeps

       This will have the effect of generating automatically a shlibs file for libfoo1, and using that file and the libfoo1 library in the
       debian/libfoo1/usr/lib directory to calculate shared library dependency information.

       If a libbar1 package is also produced, that is an alternate build of libfoo, and is installed into /usr/lib/bar/, you can make libfoo-bin
       depend on libbar1 as follows:

               dh_shlibdeps -Llibbar1 -l/usr/lib/bar

SEE ALSO
       debhelper(7), dpkg-shlibdeps(1)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                     DH_SHLIBDEPS(1)
