show-installed(1)                                                                                                                                                                           show-installed(1)



NAME
       show-changed-rco - show changes in an RPM package

SYNOPSIS
       show-changed-rco [options]

DESCRIPTION
       show-changed-rco gives a compact description of the changes to a packages Requires, Conflicts and Obsoletes data from the installed (or old) to a specified rpm file.

OPTIONS
       -h, --help
              show this help message and exit

       -C, --cache
              Tells  repoquery to run entirely from YUM cache - does not download any metadata or update the cache. Queries in this mode can fail or give partial/incorrect results if the cache isn't
              fully populated beforehand with eg "yum makecache".

       -c <config file>, --config=<config file>
              Use alternative config file (default is /etc/yum.conf).


       --repoid=<repo>
              Specify which repository to query. Using this option disables all repositories not explicitly enabled with --repoid option (can be used multiple times). By default repoquery uses what‐
              ever repositories are enabled in YUM configuration.

       --enablerepo=<repo>
              In addition to the default set, query the given additional repository, even if it is disabled in YUM configuration.  Can be used multiple times.

       --disablerepo=<repo>
              Do not query the given repository, even if it is enabled in YUM configuration.  Can be used multiple times.

       --repofrompath=<repoid>,<path/url>
              Specify  a  path or url to a repository (same path as in a baseurl) to add to the repositories for this query. This option can be used multiple times. If you want to view only the pkgs
              from this repository combine this with --repoid. The repoid for the repository is specified by <repoid>.


       --old-packages=<pkg>
              Explicitly list the valid old packages to match the new packages against.

       --ignore-arch
              Ignore arch. so you can compare foo-2.i686 to foo-1.x86_64.

       --skip-new
              Only give output for packages which we've found an old package for.


SEE ALSO
       yum.conf (5)
       http://yum.baseurl.org/


AUTHORS
       See the Authors file included with this program.


BUGS
       There are of course no bugs, but should you find any, you should first consult the FAQ section on http://yum.baseurl.org/wiki/Faq and if unsuccessful in finding a resolution contact the mail‐
       ing list: yum-devel@lists.baseurl.org.  To file a bug use http://bugzilla.redhat.com for Fedora/RHEL/Centos related bugs and http://yum.baseurl.org/report for all other bugs.




James Antill                                                                                    30 March 2011                                                                               show-installed(1)
