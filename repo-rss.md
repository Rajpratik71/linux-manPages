repo-rss(1)                                                                                                                                                                                       repo-rss(1)



NAME
       repo-rss - generates an RSS feed from one or more Yum repositories

SYNOPSIS
       repo-rss [options] repoid1 [repoid2...]

DESCRIPTION
       repo-rss is a program for generating RSS feeds for one or more Yum repositories.

GENERAL OPTIONS
       -h, --help
              Help; display a help message and then quit.

       -f <file>
              Specify the file to which the RSS will be written.  Default is repo-rss.xml.

       -l <link>
              Specify the URL to the RSS feed.  Default is http://yum.baseurl.org/.

       -t <title>
              Specify the title for the RSS feed.  Default is "RSS Repository - Recent Packages".

       -d <description>
              Specify the description of the RSS feed.  Default is "Most recent packages in Repositories".

       -r <days>
              Specify the number of days to consider most recent.  Default is 3.

       --tempcache
              Enable the use of a temporary directory for the yum cache.  This is enabled by default for non-root users.


EXAMPLES
       Generate an RSS for the updates-released repository and save it as updates-release.xml:
              repo-rss -f updates-released.xml updates-released

FILES
       As repo-rss uses YUM libraries for retrieving all the information, it relies on YUM configuration for its default values like which repositories to use. Consult YUM documentation for details:

       /etc/yum.conf
       /etc/yum/repos.d/
       /var/cache/yum/


SEE ALSO
       yum.conf (5)
       http://yum.baseurl.org/


AUTHORS
       See the Authors file included with this program.


BUGS
       There  are  of  course  no  bugs, but should you find any, you should first consult the FAQ section on http://yum.baseurl.org/wiki/Faq and if unsuccessful in finding a resolution contact the mailing
       list: yum-devel@lists.baseurl.org.  To file a bug use http://bugzilla.redhat.com for Fedora/RHEL/Centos related bugs and http://yum.baseurl.org/report for all other bugs.




Seth Vidal                                                                                           2005                                                                                         repo-rss(1)
