CHECKBOT(1p)                                            User Contributed Perl Documentation                                           CHECKBOT(1p)

NAME
       Checkbot - WWW Link Verifier

SYNOPSIS
       checkbot [--cookies] [--debug] [--file file name] [--help]
                [--mailto email addresses] [--noproxy list of domains]
                [--verbose]
                [--url start URL]
                [--match match string] [--exclude exclude string]
                [--proxy proxy URL] [--internal-only]
                [--ignore ignore string]
                [--filter substitution regular expression]
                [--style style file URL]
                [--note note] [--sleep seconds] [--timeout timeout]
                [--interval seconds] [--dontwarn HTTP responde codes]
                [--enable-virtual]
                [--language language code]
                [--suppress suppression file]
                [start URLs]

DESCRIPTION
       Checkbot verifies the links in a specific portion of the World Wide Web. It creates HTML pages with diagnostics.

       Checkbot uses LWP to find URLs on pages and to check them. It supports the same schemes as LWP does, and finds the same links that
       HTML::LinkExtor will find.

       Checkbot considers links to be either 'internal' or 'external'. Internal links are links within the web space that needs to be checked. If
       an internal link points to a web document this document is retrieved, and its links are extracted and processed. External links are only
       checked to be working.  Checkbot checks links as it finds them, so internal and external links are checked at the same time, even though
       they are treated differently.

       Options for Checkbot are:

       --cookies
           Accept cookies from the server and offer them again at later requests. This may be useful for servers that use cookies to handle
           sessions. By default Checkbot does not accept any cookies.

       --debug
           Enable debugging mode. Not really supported anymore, but it will keep some files around that otherwise would be deleted.

       --file <file name>
           Use the file file name as the basis for the summary file names. The summary page will get the file name given, and the server pages are
           based on the file name without the .html extension. For example, setting this option to "index.html" will create a summary page called
           index.html and server pages called index-server1.html and index-server2.html.

           The default value for this option is "checkbot.html".

       --help
           Shows brief help message on the standard output.

       --mailto <email address>[,<email address>]
           Send mail to the email address when Checkbot is done checking. You can give more than one address separated by commas. The notification
           email includes a small summary of the results. As of Checkbot 1.76 email is only sent if problems have been found during the Checkbot
           run.

       --noproxy <list of domains>
           Do not proxy requests to the given domains. The list of domains must be a comma-separated list. For example, so avoid using the proxy
           for the localhost and someserver.xyz, you can use "--noproxy localhost,someserver.xyz".

       --verbose
           Show verbose output while running. Includes all links checked, results from the checks, etc.

       --url <start URL>
           Set the start URL. Checkbot starts checking at this URL, and then recursively checks all links found on this page. The start URL takes
           precedence over additional URLs specified on the command line.

           If no scheme is specified for the URL, the file protocol is assumed.

       --match <match string>
           This option selects which pages Checkbot considers local. If the match string is contained within the URL, then Checkbot considers the
           page local, retrieves it, and will check all the links contained on it. Otherwise the page is considered external and it is only
           checked with a HEAD request.

           If no explicit match string is given, the start URLs (See option "--url") will be used as a match string instead. In this case the last
           page name, if any, will be trimmed. For example, a start URL like "http://some.site/index.html" will result in a default match string
           of "http://some.site/".

           The match string can be a perl regular expression.  For example, to check the main server page and all HTML pages directly underneath
           it, but not the HTML pages in the subdirectories of the server, the match string would be "www.someserver.xyz/($|[^/]+.html)".

       --exclude <exclude string>
           URLs matching the exclude string are considered to be external, even if they happen to match the match string (See option "--match").
           URLs matching the --exclude string are still being checked and will be reported if problems are found, but they will not be checked for
           further links into the site.

           The exclude string can be a perl regular expression. For example, to consider all URLs with a query string external, use "[=\?]". This
           can be useful when a URL with a query string unlocks the path to a huge database which will be checked.

       --filter <filter string>
           This option defines a filter string, which is a perl regular expression. This filter is run on each URL found, thus rewriting the URL
           before it enters the queue to be checked. It can be used to remove elements from a URL. This option can be useful when symbolic links
           point to the same directory, or when a content management system adds session IDs to URLs.

           For example "/old/new/" would replace occurrences of 'old' with 'new' in each URL.

       --ignore <ignore string>
           URLs matching the ignore string are not checked at all, they are completely ignored by Checkbot. This can be useful to ignore known
           problem links, or to ignore links leading into databases. The ignore string is matched after the filter string has been applied.

           The ignore string can be a perl regular expression.

           For example "www.server.com\/(one|two)" would match all URLs starting with either www.server.com/one or www.server.com/two.

       --proxy <proxy URL>
           This attribute specifies the URL of a proxy server. Only the HTTP and FTP requests will be sent to that proxy server.

       --internal-only
           Skip the checking of external links at the end of the Checkbot run. Only matching links are checked. Note that some redirections may
           still cause external links to be checked.

       --note <note>
           The note is included verbatim in the mail message (See option "--mailto"). This can be useful to include the URL of the summary HTML
           page for easy reference, for instance.

           Only meaningful in combination with the "--mailto" option.

       --sleep <seconds>
           Number of seconds to sleep in between requests. Default is 0 seconds, i.e. do not sleep at all between requests. Setting this option
           can be useful to keep the load on the web server down while running Checkbot. This option can also be set to a fractional number, i.e.
           a value of 0.1 will sleep one tenth of a second between requests.

       --timeout <timeout>
           Default timeout for the requests, specified in seconds. The default is 2 minutes.

       --interval <seconds>
           The maximum interval between updates of the results web pages in seconds. Default is 3 hours (10800 seconds). Checkbot will start the
           interval at one minute, and gradually extend it towards the maximum interval.

       --style <URL of style file>
           When this option is used, Checkbot embeds this URL as a link to a style file on each page it writes. This makes it easy to customize
           the layout of pages generated by Checkbot.

       --dontwarn <HTTP response codes regular expression>
           Do not include warnings on the result pages for those HTTP response codes which match the regular expression. For instance, --dontwarn
           "(301|404)" would not include 301 and 404 response codes.

           Checkbot uses the response codes generated by the server, even if this response code is not defined in RFC 2616 (HTTP/1.1). In addition
           to the normal HTTP response code, Checkbot defines a few response codes for situations which are not technically a problem, but which
           causes problems in many cases anyway. These codes are:

             901 Host name expected but not found
                 In this case the URL supports a host name, but non was found
                 in the URL. This usually indicates a mistake in the URL. An
                 exception is that this check is not applied to news: URLs.

             902 Unqualified host name found
                 In this case the host name does not contain the domain part.
                 This usually means that the pages work fine when viewed within
                 the original domain, but not when viewed from outside it.

             903 Double slash in URL path
                 The URL has a double slash in it. This is legal, but some web
                 servers cannot handle it very well and may cause Checkbot to
                 run away. See also the comments below.

             904 Unknown scheme in URL
                 The URL starts with a scheme that Checkbot does not know
                 about. This is often caused by mistyping the scheme of the URL,
                 but the scheme can also be a legal one. In that case please let
                 me know so that it can be added to Checkbot.

       --enable-virtual
           This option enables dealing with virtual servers. Checkbot then assumes that all hostnames for internal servers are unique, even though
           their IP addresses may be the same. Normally Checkbot uses the IP address to distinguish servers. This has the advantage that if a
           server has two names (e.g. www and bamboozle) its pages only get checked once. When you want to check multiple virtual servers this
           causes problems, which this feature works around by using the hostname to distinguish the server.

       --language
           The argument for this option is a two-letter language code. Checkbot will use language negotiation to request files in that language.
           The default is to request English language (language code 'en').

       --suppress
           The argument for this option is a file which contains combinations of error codes and URLs for which to suppress warnings. This can be
           used to avoid reporting of known and unfixable URL errors or warnings.

           The format of the suppression file is a simple whitespace delimited format, first listing the error code followed by the URL. Each
           error code and URL combination is listed on a new line. Comments can be added to the file by starting the line with a "#" character.

             # 301 Moved Permanently
             301   http://www.w3.org/P3P

             # 403 Forbidden
             403   http://www.herring.com/

           For further flexibility a regular expression can be used instead of a normal URL. The regular expression must be enclosed with forward
           slashes. For example, to suppress all 403 errors on wikipedia:

             403   /http:\/\/wikipedia.org\/.*/

       Deprecated options which will disappear in a future release:

       --allow-simple-hosts (deprecated)
           This option turns off warnings about URLs which contain unqualified host names. This is useful for intranet sites which often use just
           a simple host name or even "localhost" in their links.

           Use of this option is deprecated. Please use the --dontwarn mechanism for error 902 instead.

HINTS AND TIPS
       Problems with checking FTP links
           Some users may experience consistent problems with checking FTP links. In these cases it may be useful to instruct Net::FTP to use
           passive FTP mode to check files. This can be done by setting the environment variable FTP_PASSIVE to 1. For example, using the bash
           shell: "FTP_PASSIVE=1 checkbot ...". See the Net::FTP documentation for more details.

       Run-away Checkbot
           In some cases Checkbot literally takes forever to finish. There are two common causes for this problem.

           First, there might be a database application as part of the web site which generates a new page based on links on another page. Since
           Checkbot tries to travel through all links this will create an infinite number of pages. This kind of run-away effect is usually
           predictable. It can be avoided by using the --exclude option.

           Second, a server configuration problem can cause a loop in generating URLs for pages that really do not exist. This will result in URLs
           of the form http://some.server/images/images/images/logo.png, with ever more 'images' included. Checkbot cannot check for this because
           the server should have indicated that the requested pages do not exist. There is no easy way to solve this other than fixing the
           offending web server or the broken links.

       Problems with https:// links
           The error message

             Can't locate object method "new" via package "LWP::Protocol::https::Socket"

           usually means that the current installation of LWP does not support checking of SSL links (i.e. links starting with https://). This
           problem can be solved by installing the Crypt::SSLeay module.

EXAMPLES
       The most simple use of Checkbot is to check a set of pages on a server. To check my checkbot pages I would use:

           checkbot http://degraaff.org/checkbot/

       Checkbot runs can take some time so Checkbot can send a notification mail when the run is done:

           checkbot --mailto hans@degraaff.org http://degraaff.org/checkbot/

       It is possible to check a set of local file without using a web server. This only works for static files but may be useful in some cases.

           checkbot file:///var/www/documents/

PREREQUISITES
       This script uses the "LWP" modules.

COREQUISITES
       This script can send mail when "Mail::Send" is present.

AUTHOR
       Hans de Graaff <hans@degraaff.org>

       any

perl v5.14.2                                                        2008-10-15                                                        CHECKBOT(1p)
