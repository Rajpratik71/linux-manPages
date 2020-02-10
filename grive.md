GRIVE(1)                                                                                 General Commands Manual                                                                                 GRIVE(1)

NAME
       grive - Google Drive client for GNU/Linux

SYNOPSIS
       grive [OPTIONS]

DESCRIPTION
       Grive is a Google Drive (online storage service) client for GNU/Linux systems.

       It allows the synchronization of all your files on the cloud with a directory of your choice and the upload of new files to Google Drive.

       The options are as follows:

       -a, --auth
              Requests authorization token from Google

       -d, --debug
              Enable debug level messages. Implies -V

       --dry-run
              Only detect which files need to be uploaded/downloaded, without actually performing changes

       -f, --force
              Forces grive to always download a file from Google Drive instead uploading it

       -u, --upload-only
              Forces grive to not download anything from Google Drive and only upload local changes to server instead

       -n, --no-remote-new
              Forces grive to download only files that are changed in Google Drive and already exist locally

       -h, --help
              Produces help message

       --ignore <perl_regexp>
              Ignore files with relative paths matching this Perl Regular Expression.

       -l <filename>, --log <filename>
              Write log output to <filename>

       --log-http <filename_prefix>
              Log all HTTP responses in files named <filename_prefix>YYYY-MM-DD.HHMMSS.txt for debugging

       --new-rev
              Create new revisions in server for updated files

       -p <wc_path>, --path <wc_path>
              Use <wc_path> as the working copy root directory

       -s <subdir>, --dir <subdir>
              Sync a single <subdir> subdirectory. Internally converted to an ignore regexp.

       -v, --version
              Displays program version

       -P, --progress-bar
              Print ASCII progress bar for each downloaded/uploaded file.

       -V, --verbose
              Verbose mode. Enables more messages than usual.

.griveignore
       You may create .griveignore in your Grive root and use it to setup exclusion/inclusion rules.

       Rules are similar to Git's .gitignore, but may differ slightly due to the different implementation.

       ·      lines that start with # are comments

       ·      leading and trailing spaces ignored unless escaped with \

       ·      non-empty lines without ! in front are treated as "exclude" patterns

       ·      non-empty lines with ! in front are treated as "include" patterns and have a priority over all "exclude" ones

       ·      patterns are matched against the filenames relative to the grive root

       ·      a/**/b matches any number of subpaths between a and b, including 0

       ·      **/a matches `a` inside any directory

       ·      b/** matches everything inside `b`, but not b itself

       ·      * matches any number of any characters except /

       ·      ? matches any character except /

       ·      .griveignore itself isn't ignored by default, but you can include it in itself to ignore

AUTHORS
       Current maintainer is Vitaliy Filippov.

       Original author was Nestal Wan.  This manpage was written by José Luis Segura Lucas (josel.segura@gmx.es)

       The full list of contributors may be found here http://yourcmc.ru/wiki/Grive2#Full_list_of_contributors

REPORT BUGS
       https://github.com/vitalif/grive2/issues https://groups.google.com/forum/?fromgroups#!forum/grive-devel

                                                                                             January 3, 2016                                                                                     GRIVE(1)
