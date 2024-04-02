DH_STRIP(1)                                                          Debhelper                                                         DH_STRIP(1)

NAME
       dh_strip - strip executables, shared libraries, and some static libraries

SYNOPSIS
       dh_strip [debhelper options] [-Xitem] [--dbg-package=package] [--keep-debug]

DESCRIPTION
       dh_strip is a debhelper program that is responsible for stripping executables, shared libraries, and static libraries that are not used for
       debugging.

       This program examines your package build directories and works out what to strip on its own. It uses file(1) and file permissions and
       filenames to figure out what files are shared libraries (*.so), executable binaries, and static (lib*.a) and debugging libraries (lib*_g.a,
       debug/*.so), and strips each as much as is possible. (Which is not at all for debugging libraries.) In general it seems to make very good
       guesses, and will do the right thing in almost all cases.

       Since it is very hard to automatically guess if a file is a module, and hard to determine how to strip a module, dh_strip does not
       currently deal with stripping binary modules such as .o files.

OPTIONS
       -Xitem, --exclude=item
           Exclude files that contain item anywhere in their filename from being stripped. You may use this option multiple times to build up a
           list of things to exclude.

       --dbg-package=package
           This option is a now special purpose option that you normally do not need.  In most cases, there should be little reason to use this
           option for new source packages as debhelper automatically generates debug packages ("dbgsym packages").  If you have a manual
           --dbg-package that you want to replace with an automatically generated debug symbol package, please see the --dbgsym-migration option.

           Causes dh_strip to save debug symbols stripped from the packages it acts on as independent files in the package build directory of the
           specified debugging package.

           For example, if your packages are libfoo and foo and you want to include a foo-dbg package with debugging symbols, use dh_strip
           --dbg-package=foo-dbg.

           This option implies --no-automatic-dbgsym and cannot be used with --automatic-dbgsym or --dbgsym-migration.

       -k, --keep-debug
           This option is a now special purpose option that you normally do not need.  In most cases, there should be little reason to use this
           option for new source packages as debhelper automatically generates debug packages ("dbgsym packages").  If you have a manual
           --dbg-package that you want to replace with an automatically generated debug symbol package, please see the --dbgsym-migration option.

           Debug symbols will be retained, but split into an independent file in usr/lib/debug/ in the package build directory. --dbg-package is
           easier to use than this option, but this option is more flexible.

           This option implies --no-automatic-dbgsym and cannot be used with --automatic-dbgsym.

       --dbgsym-migration=package-relation
           This option is used to migrate from a manual "-dbg" package (created with --dbg-package) to an automatic generated debug symbol
           package. This option should describe a valid Replaces- and Breaks-relation, which will be added to the debug symbol package to avoid
           file conflicts with the (now obsolete) -dbg package.

           This option implies --automatic-dbgsym and cannot be used with --keep-debug, --dbg-package or --no-automatic-dbgsym.

           Examples:

             dh_strip --dbgsym-migration='libfoo-dbg (<< 2.1-3~)'

             dh_strip --dbgsym-migration='libfoo-tools-dbg (<< 2.1-3~), libfoo2-dbg (<< 2.1-3~)'

       --automatic-dbgsym, --no-automatic-dbgsym
           Control whether dh_strip should be creating debug symbol packages when possible.

           The default is to create debug symbol packages.

       --ddebs, --no-ddebs
           Historical name for --automatic-dbgsym and --no-automatic-dbgsym.

       --ddeb-migration=package-relation
           Historical name for --dbgsym-migration.

NOTES
       If the DEB_BUILD_OPTIONS environment variable contains nostrip, nothing will be stripped, in accordance with Debian policy (section 10.1
       "Binaries").  This will also inhibit the automatic creation of debug symbol packages.

       The automatic creation of debug symbol packages can also be prevented by adding noautodbgsym to the DEB_BUILD_OPTIONS environment variable.
       However, dh_strip will still add debuglinks to ELF binaries when this flag is set.  This is to ensure that the regular deb package will be
       identical with and without this flag (assuming it is otherwise "bit-for-bit" reproducible).

CONFORMS TO
       Debian policy, version 3.0.1

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                         DH_STRIP(1)
