ORIGTARGZ(1)                                                                                                                          ORIGTARGZ(1)

NAME
       origtargz - fetch the orig tarball of a Debian package from various sources, and unpack it

SYNOPSIS
       origtargz [OPTIONS] [--unpack[=no|once|yes]]
       origtargz --help

DESCRIPTION
       origtargz downloads the orig tarball of a Debian package, and optionally unpacks it into the current directory. The version number to be
       used is determined from debian/changelog. The main use for origtargz is with debian-dir-only repository checkouts. It should be invoked
       from the top level directory of an unpacked Debian source package.

       Various download locations are tried:

       ·   First, an existing file is looked for.

       ·   Directories given with --path are searched.

       ·   pristine-tar is tried.

       ·   apt-get source is tried when apt-cache showsrc reports a matching version.

       ·   Finally, uscan --download-current-version is tried.

       When asked to unpack the orig tarball, origtargz will remove all files and directories from the current directory, except the debian
       directory, and the VCS repository directories. Some files outside debian/ which are often stored in VCS even for debian-dir-only
       repositories are also preserved (.bzr-builddeb, .gitignore, .hgignore). Note that this will drop all non-committed changes for the patch
       system in use (e.g. source format "3.0 (quilt)"), and will even remove all patches from the package when no patch system is in use (the
       original "1.0" source format).

       The default behavior is to unpack the orig tarball on the first invocation of origtargz in a debian-dir-only checkout.

NOTES
       Despite origtargz being called "targz", it will work with any compression scheme used for the tarball.

       A similar tool to unpack orig tarballs is uupdate(1). uupdate creates a new working directory, unpacks the tarball, and applies the Debian
       .diff.gz changes. In contrast, origtargz uses the current directory, keeping VCS metadata.

       For Debian package repositories that keep the full upstream source, other tools should be used to upgrade the repository from the new
       tarball. See git-import-orig(1) and svn-upgrade(1) for examples. origtargz is still useful for downloading the current tarball.

OPTIONS
       -p, --path directory
           Add directory to the list of locations to search for an existing tarball.  When found, a hardlink is created if possible, otherwise a
           symlink.

       -u, --unpack[=no|once|yes]
           Unpack the downloaded orig tarball to the current directory, replacing everything except the debian directory. Existing files are
           removed, except for debian/ and VCS files. Preserved are: .bzr, .bzrignore, .bzr-builddeb, .git, .gitignore, .hg, .hgignore, _darcs and
           .svn.

           no  Do not unpack the orig tarball.

           once (default when --unpack is not used)
               If the current directory contains only a debian directory (and possibly some dotfiles), unpack the orig tarball. This is the
               default behavior.

           yes (default for --unpack without argument)
               Always unpack the orig tarball.

       -d, --download-only
           Alias for --unpack=no.

       -t, --tar-only
           When using apt-get source, pass --tar-only to it. The default is to download the full source package including .dsc and .diff.gz or
           .debian.tar.gz components so debdiff can be used to diff the last upload to the next one. With --tar-only, only download the
           .orig.tar.* file.

       --clean
           Remove existing files as with --unpack. Note that like --unpack, this will remove upstream files even if they are stored in VCS.

SEE ALSO
       debcheckout(1), git-import-orig(1), pristine-tar(1), svn-upgrade(1), uupdate(1)

AUTHOR
       origtargz and this manpage have been written by Christoph Berg <myon@debian.org>.

Debian Utilities                                                    2016-03-23                                                        ORIGTARGZ(1)
