UPDATE-APT-XAPIAN-INDEX(8)                                System Administration Utilities                               UPDATE-APT-XAPIAN-INDEX(8)

NAME
       update-apt-xapian-index - rebuild the Apt Xapian Index

SYNOPSIS
       update-apt-xapian-index [options]

DESCRIPTION
       Rebuild the Apt Xapian index

OPTIONS
       --version
              show program's version number and exit

       -h, --help
              show this help message and exit

       -q, --quiet
              quiet mode: only output fatal errors

       -v, --verbose
              verbose mode

       -f, --force
              force database rebuild even if it's already up to date

       --pkgfile=PKGFILE
              do not use the APT cache, but the given Package file

       --batch-mode
              use progress reporting suitable from programatic parsing.

       -u, --update
              incremental update, reindexing only those packages whose version has changed since the last run

update-apt-xapian-index 0.47                                       February 2018                                        UPDATE-APT-XAPIAN-INDEX(8)
