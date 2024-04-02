DH_MD5SUMS(1)                                                        Debhelper                                                       DH_MD5SUMS(1)

NAME
       dh_md5sums - generate DEBIAN/md5sums file

SYNOPSIS
       dh_md5sums [debhelper options] [-x] [-Xitem] [--include-conffiles]

DESCRIPTION
       dh_md5sums is a debhelper program that is responsible for generating a DEBIAN/md5sums file, which lists the md5sums of each file in the
       package.  These files are used by dpkg --verify or the debsums(1) program.

       All files in DEBIAN/ are omitted from the md5sums file, as are all conffiles (unless you use the --include-conffiles switch).

       The md5sums file is installed with proper permissions and ownerships.

OPTIONS
       -x, --include-conffiles
           Include conffiles in the md5sums list. Note that this information is redundant since it is included elsewhere in Debian packages.

       -Xitem, --exclude=item
           Exclude files that contain item anywhere in their filename from being listed in the md5sums file.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                       DH_MD5SUMS(1)
