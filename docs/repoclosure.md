repoclosure(1)                                                                                                                                                                                 repoclosure(1)



NAME
       repoclosure - display a list of unresolved dependencies for a yum repository

SYNOPSIS
       repoclosure [options]

DESCRIPTION
       repoclosure is a program that reads package metadata from one or more yum repositories, checks all dependencies, and displays a list of packages with unresolved dependencies.

OPTIONS
       -h, --help
              Display a help message, and then quit.

       -c CONFIG, --config=CONFIG
              Config file to use (defaults to /etc/yum.conf).

       -a ARCH, --arch=ARCH
              Check packages of the given archs, can be specified multiple times (default: current arch).

       --basearch=BASEARCH
              Set the basearch for yum to run as.

       -b, --builddeps
              Check build dependencies only (needs source repos enabled).

       -l LOOKASIDE, --lookaside=LOOKASIDE
              Specify a lookaside repo id to query, can be specified multiple times.

       -r REPOID, --repoid=REPOID
              Specify repo ids to query, can be specified multiple times (default is all enabled).

       -t, --tempcache
              Use a temp dir for storing/accessing yum-cache.

       -q, --quiet
              Run quietly: no warnings printed to stderr.

       -n, --newest
              Check only the newest packages in the repos.

       --repofrompath=REPOID,PATH/URL
              Specify  a  path  or  url to a repository (same path as in a baseurl) to add to the repositories for this query. This option can be used multiple times. If you want to view only the pkgs from
              this repository combine this with --repoid. The repoid for the repository is specified by REPOID.

       -p PKG, --pkg=PKG
              Check closure for this package only

       -g GROUP, --group=GROUP
              Check closure for packages in this group only


SEE ALSO
       yum.conf (5)
       http://yum.baseurl.org/


AUTHORS
       See the Authors file included with this program.



                                                                                               13 January 2013                                                                                 repoclosure(1)
