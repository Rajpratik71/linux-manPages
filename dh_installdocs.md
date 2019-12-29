DH_INSTALLDOCS(1)                              Debhelper                             DH_INSTALLDOCS(1)

NAME
       dh_installdocs - install documentation into package build directories

SYNOPSIS
       dh_installdocs [debhelper options] [-A] [-Xitem] [file ...]

DESCRIPTION
       dh_installdocs is a debhelper program that is responsible for installing documentation into
       usr/share/doc/package in package build directories.

       In compat 10 and earlier, dh_install(1) may be a better tool for handling the upstream
       documentation, when upstream's own build system installs all the desired documentation
       correctly.  In this case, dh_installdocs is still useful for installing packaging related
       documentation (e.g. the debian/copyright file).

       From debhelper compatibility level 11 on, dh_install will fall back to looking in debian/tmp
       for files, if it does not find them in the current directory (or wherever you've told it to
       look using --sourcedir).

       In compat 11 and later, dh_installdocs offers many of the features that dh_install(1) also has.
       Furthermore, dh_installdocs also supports the nodoc build profile to exclude documentation
       (regardless of compat level).

FILES
       debian/package.docs
           List documentation files to be installed into package.

       debian/copyright
           The copyright file is installed into all packages, unless a more specific copyright file is
           available.

       debian/package.copyright
       debian/package.README.Debian
       debian/package.TODO
           Each of these files is automatically installed if present for a package.

       debian/README.Debian
       debian/TODO
           These files are installed into the first binary package listed in debian/control.

           Note that README.debian files are also installed as README.Debian, and TODO files will be
           installed as TODO.Debian in non-native packages.

       debian/package.doc-base
           Installed as doc-base control files. Note that the doc-id will be determined from the
           Document: entry in the doc-base control file in question. In the event that multiple doc-
           base files in a single source package share the same doc-id, they will be installed to
           usr/share/doc-base/package instead of usr/share/doc-base/doc-id.

       debian/package.doc-base.*
           If your package needs to register more than one document, you need multiple doc-base files,
           and can name them like this. In the event that multiple doc-base files of this style in a
           single source package share the same doc-id, they will be installed to
           usr/share/doc-base/package-* instead of usr/share/doc-base/doc-id.

OPTIONS
       -A, --all
           Install all files specified by command line parameters in ALL packages acted on.

       -Xitem, --exclude=item
           Exclude files that contain item anywhere in their filename from being installed. Note that
           this includes doc-base files.

       --sourcedir=dir
           Look in the specified directory for files to be installed.  This option requires compat 11
           or later (it is silently ignored in compat 10 or earlier).

           Note that this is not the same as the --sourcedirectory option used by the dh_auto_*
           commands. You rarely need to use this option, since dh_installman automatically looks for
           files in debian/tmp in debhelper compatibility level 11 and above.

       --doc-main-package=main-package
           Set the main package for a documentation package.  This is used to install the
           documentation of the documentation package in /usr/share/doc/main-package as recommended by
           the Debian policy manual 3.9.7 in §12.3.

           In compat 11 (or later), this option is only useful if debhelper's auto-detection of the
           main package is wrong.  The option can also be used to silence a warning from debhelper
           when the auto-detection fails but the default happens to be correct.

           This option cannot be used when dh_installdocs is instructed to act on multiple packages.
           If you need this option, you will generally need to combine it with -p to ensure exactly
           one package is acted on.

           Please keep in mind that some documentation (the copyright file, README.Debian, etc.) will
           be unaffected by this option.

       --link-doc=package
           Make the documentation directory of all packages acted on be a symlink to the documentation
           directory of package. This has no effect when acting on package itself, or if the
           documentation directory to be created already exists when dh_installdocs is run. To comply
           with policy, package must be a binary package that comes from the same source package.

           debhelper will try to avoid installing files into linked documentation directories that
           would cause conflicts with the linked package. The -A option will have no effect on
           packages with linked documentation directories, and copyright, changelog, README.Debian,
           and TODO files will not be installed.

           (An older method to accomplish the same thing, which is still supported, is to make the
           documentation directory of a package be a dangling symlink, before calling dh_installdocs.)

           Please note that this option only applies to the documentation directory for the package
           itself.  When the package ships documentation for another package (e.g. see
           --doc-main-package), it will not use a symlink for the documentation of the other package.

           CAVEAT 1: If a previous version of the package was built without this option and is now
           built with it (or vice-versa), it requires a "dir to symlink" (or "symlink to dir")
           migration.  Since debhelper has no knowledge of previous versions, you have to enable this
           migration itself.

           This can be done by providing a "debian/package.maintscript" file and using
           dh_installdeb(1) to provide the relevant maintainer script snippets.

           CAVEAT 2: The use of --link-doc should only be done when the packages have same
           "architecture" type.  A link from an architecture independent package to an architecture
           dependent package (or vice versa) will not work.  Since compat 10, debhelper will actively
           reject unsupported combinations.

       file ...
           Install these files as documentation into the first package acted on. (Or in all packages
           if -A is specified).

EXAMPLES
       This is an example of a debian/package.docs file:

         README
         TODO
         debian/notes-for-maintainers.txt
         docs/manual.txt
         docs/manual.pdf
         docs/manual-html/

NOTES
       Note that dh_installdocs will happily copy entire directory hierarchies if you ask it to
       (similar to cp -a). If it is asked to install a directory, it will install the complete
       contents of the directory.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

12.6.1ubuntu2                                 2019-09-17                             DH_INSTALLDOCS(1)
