find-repos-of-install(1)                                                                                                                                                             find-repos-of-install(1)



NAME
       find-repos-of-install - report which Yum repository a package was installed from

SYNOPSIS
       find-repos-of-install [options] package1 [package2...]

DESCRIPTION
       find-repos-of-install is a program which reports the Yum repository that a specified package was installed from.

OPTIONS
       --version
              Report program version and exit.

       -h, --help
              Display a help message, and then quit.

       --repoid=REPOID
              Specify repo ids to query, can be specified multiple times (default is all enabled).

       --enablerepo=ENABLEREPOS
              In addition to the default set, query the given additional repository, even if it is disabled in YUM configuration.  Can be used multiple times.

       --disablerepo=DISABLEREPOS
              Do not query the given repository, even if it is enabled in YUM configuration.  Can be used multiple times.

       --repofrompath=REPOID,PATH/URL
              Specify  a  path  or  url to a repository (same path as in a baseurl) to add to the repositories for this query. This option can be used multiple times. If you want to view only the pkgs from
              this repository combine this with --repoid. The repoid for the repository is specified by REPOID.

       -C, --cache
              Tells repoquery to run entirely from YUM cache - does not download any metadata or update the cache. Queries in this mode can fail or give partial/incorrect results if the cache  isn't  fully
              populated beforehand with eg "yum makecache".

       --tempcache
              Use a temp dir for storing/accessing yum-cache.

       --sync2yumdb
              Sync anything that is found to the yumdb, if available.


SEE ALSO
       yum.conf (5)
       http://yum.baseurl.org/


AUTHORS
       See the Authors file included with this program.



                                                                                               13 January 2013                                                                       find-repos-of-install(1)
