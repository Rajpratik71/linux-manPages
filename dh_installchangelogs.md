DH_INSTALLCHANGELOGS(1)                        Debhelper                       DH_INSTALLCHANGELOGS(1)

NAME
       dh_installchangelogs - install changelogs into package build directories

SYNOPSIS
       dh_installchangelogs [debhelper options] [-k] [-Xitem] [upstream]

DESCRIPTION
       dh_installchangelogs is a debhelper program that is responsible for installing changelogs into
       package build directories.

       An upstream changelog file may be specified as an option.

       If there is an upstream changelog file, it will be installed as usr/share/doc/package/changelog
       in the package build directory.

       If the specified upstream changelog is an html file (determined by file extension), it will be
       installed as usr/share/doc/package/changelog.html instead. If the html changelog is converted
       to plain text, that variant can be specified as a second upstream changelog file. When no plain
       text variant is specified, a short usr/share/doc/package/changelog is generated, pointing
       readers at the html changelog file.

FILES
       debian/changelog
       debian/NEWS
       debian/package.changelog
       debian/package.NEWS
           Automatically installed into usr/share/doc/package/ in the package build directory.

           Use the package specific name if package needs a different NEWS or changelog file.

           The changelog file is installed with a name of changelog for native packages, and
           changelog.Debian for non-native packages.  The NEWS file is always installed with a name of
           NEWS.Debian.

OPTIONS
       -k, --keep
           Keep the original name of the upstream changelog. This will be accomplished by installing
           the upstream changelog as changelog, and making a symlink from that to the original name of
           the changelog file. This can be useful if the upstream changelog has an unusual name, or if
           other documentation in the package refers to the changelog file.

       -Xitem, --exclude=item
           Exclude upstream changelog files that contain item anywhere in their filename from being
           installed.

           Note that directory name of the changelog is also part of the match.

       upstream
           Install this file as the upstream changelog.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

12.6.1ubuntu2                                 2019-09-17                       DH_INSTALLCHANGELOGS(1)
