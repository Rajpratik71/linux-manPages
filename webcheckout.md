WEBCHECKOUT(1)                                                      webcheckout                                                     WEBCHECKOUT(1)

NAME
       webcheckout - check out repositories referenced on a web page

SYNOPSIS
       webcheckout [options] url [destdir]

DESCRIPTION
       webcheckout downloads an url and parses it, looking for version control repositories referenced by the page. It checks out each repository
       into a subdirectory of the current directory, using whatever VCS program is appropriate for that repository (git, svn, etc).

       The information about the repositories is embedded in the web page using the rel=vcs-* microformat, which is documented at
       <https://joeyh.name/rfc/rel-vcs/>.

       If the optional destdir parameter is specified, VCS programs will be asked to check out repositories into that directory. If there are
       multiple repositories to check out, each will be checked out into a separate subdirectory of the destdir.

OPTIONS
       -a, --auth
           Prefer authenticated repositories. By default, webcheckout will use anonymous repositories when possible. If you have an account that
           allows you to use authenticated repositories, you might want to use this option.

       --no-act, -n
           Do not actually check anything out, just print out the commands that would be run to check out the repositories.

       --quiet, -q
           Quiet mode. Do not print out the commands being run. (The VCS commands may still be noisy however.)

PREREQUISITES
       To use this program you will need lots of VCS programs installed, obviously. It also depends on the perl LWP and HTML::Parser modules.

       If the perl URI module is installed, webcheckout can heuristically guess what you mean by partial URLs, such as "kitenet.net/~joey"'

AUTHOR
       Copyright 2009 Joey Hess <joey@kitenet.net>

       Licensed under the GNU GPL version 2 or higher.

       This program is included in myrepos <https://myrepos.branchable.com/>

perl v5.22.1                                                        2018-08-18                                                      WEBCHECKOUT(1)
