WRAP-AND-SORT(1)                                              General Commands Manual                                             WRAP-AND-SORT(1)

NAME
       wrap-and-sort - wrap long lines and sort items in Debian packaging files

SYNOPSIS
       wrap-and-sort [options]

DESCRIPTION
       wrap-and-sort  wraps the package lists in Debian control files. By default the lists will only split into multiple lines if the entries are
       longer than the maximum line length limit of 79 characters. wrap-and-sort sorts the package lists in Debian control files  and  all  .dirs,
       .docs,  .examples,  .info,  .install, .links, .maintscript, and .manpages files. Beside that wrap-and-sort removes trailing spaces in these
       files.

       This script should be run in the root of a Debian package tree. It searches for control, control*.in, copyright, copyright.in, install, and
       *.install in the debian directory.

OPTIONS
       -h, --help
              Show this help message and exit.

       -a, --wrap-always
              Wrap all package lists in the Debian control file even if they do not exceed the line length limit and could fit in one line.

       -s, --short-indent
              Only indent wrapped lines by one space (default is in-line with the field name).

       -b, --sort-binary-packages
              Sort binary package paragraphs by name.

       -k, --keep-first
              When sorting binary package paragraphs, leave the first one at the top.  Unqualified debhelper(7) configuration files are applied to
              the first package.

       -n, --no-cleanup
              Do not remove trailing whitespaces.

       -t, --trailing-comma
              Add a trailing comma at the end of the sorted fields. This minimizes future differences in the VCS commits when additional dependen‐
              cies are appended or removed.

       -d path, --debian-directory=path
              Location of the debian directory (default: ./debian).

       -f file, --file=file
              Wrap  and sort only the specified file.  You can specify this parameter multiple times.  All supported files will be processed if no
              files are specified.

       -v, --verbose
              Print all files that are touched.

       --max-line-length=max_line_length
              Set the maximum allowed line length. Package lists in the Debian control file that exceed this length limit  will  be  wrapped.  The
              default maximum line length is 79 characters.

AUTHORS
       wrap-and-sort and this manpage have been written by Benjamin Drung <bdrung@debian.org>.

       Both are released under the ISC license.

DEBIAN                                                           Debian Utilities                                                 WRAP-AND-SORT(1)
