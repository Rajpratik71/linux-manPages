DH_LINK(1)                                                           Debhelper                                                          DH_LINK(1)

NAME
       dh_link - create symlinks in package build directories

SYNOPSIS
       dh_link [debhelper options] [-A] [-Xitem] [source destination ...]

DESCRIPTION
       dh_link is a debhelper program that creates symlinks in package build directories.

       dh_link accepts a list of pairs of source and destination files. The source files are the already existing files that will be symlinked
       from (called target by ln(1)). The destination files are the symlinks that will be created (called link name by ln(1)). There must be an
       equal number of source and destination files specified.

       Be sure you do specify the absolute path to both the source and destination files (unlike you would do if you were using something like
       ln(1)).  Please note that the leading slash is optional.

       dh_link will generate symlinks that comply with Debian policy - absolute when policy says they should be absolute, and relative links with
       as short a path as possible. It will also create any subdirectories it needs to put the symlinks in.

       Any pre-existing destination files will be replaced with symlinks.

       dh_link also scans the package build tree for existing symlinks which do not conform to Debian policy, and corrects them (v4 or later).

FILES
       debian/package.links
           Lists pairs of source and destination files to be symlinked. Each pair should be put on its own line, with the source and destination
           separated by whitespace.

           In each pair the source file (called target by ln(1)) comes first and is followed by the destination file (called link name by ln(1)).
           Thus the pairs of source and destination files in each line are give in the same order as they would be given to ln(1).

           In contrast to ln(1), source and destination paths must be absolute (the leading slash is optional).

OPTIONS
       -A, --all
           Create any links specified by command line parameters in ALL packages acted on, not just the first.

       -Xitem, --exclude=item
           Exclude symlinks that contain item anywhere in their filename from being corrected to comply with Debian policy.

       source destination ...
           Create a file named destination as a link to a file named source. Do this in the package build directory of the first package acted on.
           (Or in all packages if -A is specified.)

EXAMPLES
        dh_link usr/share/man/man1/foo.1 usr/share/man/man1/bar.1

       Make bar.1 be a symlink to foo.1

        dh_link var/lib/foo usr/lib/foo \
          usr/share/man/man1/foo.1 usr/share/man/man1/bar.1

       Make /usr/lib/foo/ be a link to /var/lib/foo/, and bar.1 be a symlink to the foo.1

        var/lib/foo usr/lib/foo
        usr/share/man/man1/foo.1 usr/share/man/man1/bar.1

       Same as above but as content for a debian/package.links file.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                          DH_LINK(1)
