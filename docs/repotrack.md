repotrack(1)                                                                                                                                                                                     repotrack(1)



NAME
       repotrack - track a package and its dependencies and download them

SYNOPSIS
       repotrack [options] package1 [package2...]

DESCRIPTION
       repotrack is a program for keeping track of a particular package and its dependencies. It will download one or more packages and all dependencies.

OPTIONS
       -h, --help
              Display a help message, and then quit.

       -c CONFIG, --config=CONFIG
              Config file to use (defaults to /etc/yum.conf).

       -a ARCH, --arch=ARCH
              Act as if running the specified arch (default: current arch).

       -r REPOID, --repoid=REPOID
              Specify repo ids to query, can be specified multiple times (default is all enabled).

       --repofrompath=<repoid>,<path/url>
              Specify repoid & paths of additional repositories - unique repoid and complete path required, can be specified multiple times.  Example: --repofrompath=myrepo,/path/to/repo

       -t, --tempcache
              Use a temp dir for storing/accessing yum-cache.

       -p DESTDIR, --download_path=DESTDIR
              Path to download packages to.

       -u, --urls
              Instead of downloading RPMs, list the URLs that would be downloaded.

       -n, --newest
              Toggle downloading only the newest packages (defaults to newest-only).

       -q, --quiet
              Output as little information as possible.


SEE ALSO
       yum.conf (5)
       http://yum.baseurl.org/


AUTHORS
       See the Authors file included with this program.



                                                                                               13 January 2013                                                                                   repotrack(1)
