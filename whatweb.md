WHATWEB(1)                                                    General Commands Manual                                                   WHATWEB(1)

NAME
       WhatWeb - Web scanner to identify what websites are running.

SYNOPSIS
       whatweb [options] <URLs>

DESCRIPTION
       WhatWeb  identifies  websites.  It's goal is to answer the question, "What is that Website?". WhatWeb recognises web technologies including
       content management systems (CMS), blogging platforms,  statistic/analytics  packages,  JavaScript  libraries,  web  servers,  and  embedded
       devices.  WhatWeb  has  over  900 plugins, each to recognise something different. WhatWeb also identifies version numbers, email addresses,
       account ID's, web framework modules, SQL errors, and more.

       WhatWeb can be stealthy and fast, or thorough but slow. WhatWeb supports an aggression level to control the trade  off  between  speed  and
       reliability.  When you visit a website in your browser, the transaction includes many hints of what web technologies are powering that web‐
       site. Sometimes a single webpage visit contains enough information to identify a website but when it does not, WhatWeb can interrogate  the
       website further. The default level of aggression, called 'passive', is the fastest and requires only one HTTP request of a website. This is
       suitable for scanning public websites. More aggressive modes were developed for in penetration tests.

       Most WhatWeb plugins are thorough and recognise a range of cues from subtle to obvious. For example, most WordPress websites can be identi‐
       fied by the meta HTML tag, e.g. '<meta name="generator" content="WordPress 2.6.5">', but a minority of WordPress websites remove this iden‐
       tifying tag but this does not thwart WhatWeb. The WordPress WhatWeb plugin has over 15 tests, which include checking the  favicon,  default
       installation files, login pages, and checking for "/wp-content/" within relative links.

       Features:

            * Over 1000 plugins

            * Control the trade off between speed/stealth and reliability

            * Performance tuning. Control how many websites to scan concurrently.

            * Multiple log formats: Brief (greppable), Verbose (human readable), XML, JSON, MagicTree, RubyObject, MongoDB, SQL.

            * Proxy support including TOR

            * Custom HTTP headers

            * Basic HTTP authentication

            * Control over webpage redirection

            * Nmap-style IP ranges

            * Fuzzy matching

            * Result certainty awareness

            * Custom plugins defined on the command line

OPTIONS
       <URLs> Enter URLs, filenames or nmap-format IP ranges. Use /dev/stdin to pipe HTML directly

       --input-file=FILE -i
              Identify URLs found in FILE

       --aggression -a
              1 (Stealthy) - Makes one HTTP request per target. Also follows redirects.

              2 (Unused) -

              3  (Aggressive) - Can make a handful of HTTP requests per target. This triggers aggressive plugins for targets only when those plug‐
              ins are identified with a level 1 request first.

              4 (Heavy) - Makes a lot of HTTP requests per target. Aggressive tests from
               all plugins are used for all URLs.

       --list-plugins -l
              List the plugins

       --plugins -p
              Comma delimited set of selected plugins. Default is all.
               Each element can be a directory, file or plugin name and
               can optionally have a modifier, eg. + or -
               Examples: +/tmp/moo.rb,+/tmp/foo.rb
               title,md5,+./plugins-disabled/
               ./plugins-disabled,-md5

       --info-plugins -I
              Display information for all plugins. Optionally search
               with keywords in a comma delimited list.

       --grep -g
              Search for a string. Reports in a plugin called Grep

       --colour=[WHEN] --color=[WHEN]
              control whether colour is used. WHEN may be "never", "always", or "auto"

       --log-verbose=FILE
              Log verbose output

       --quiet, -q
              Do not display brief logging to STDOUT

       --log-brief=FILE
              Log brief, one-line output

       --log-xml=FILE
              Log XML format

       --log-json=FILE
              Log JSON format

       --log-sql=FILE
              Log SQL INSERT statements

       --log-sql-create=FILE
              Create SQL database tables

       --log-json-verbose=FILE
              Log JSON Verbose format

       --log-magictree=FILE
              Log MagicTree XML format

       --log-object=FILE
              Log Ruby object inspection format

       --log-mongo-database=NAME
              Name of the MongoDB database

       --log-mongo-collection=NAME
              Name of the MongoDB collection. Default: whatweb

       --log-mongo-host=NAME
              MongoDB hostname or IP address. Default: 0.0.0.0

       --log-mongo-username=NAME
              MongoDB username. Default: nil

       --log-mongo-password=NAME
              MongoDB password. Default: nil

       --log-errors=FILE
              Log errors

       --no-errors
              Suppress error messages

       --user-agent -U
              Identify as user-agent instead of WhatWeb/VERSION.

       --user -u <user:password>
              HTTP basic authentication

       --header -H
              Add an HTTP header. eg "Foo:Bar". Specifying a default
               header will replace it. Specifying an empty value, eg.
               "User-Agent:" will remove the header.

       --max-threads -t
              Number of simultaneous threads. Default is 25.

       --follow-redirect=WHEN
              Control when to follow redirects. WHEN may be "never", "http-only", "meta-only", "same-site", "same-domain" or "always"

       --max-redirects=NUM
              Maximum number of contiguous redirects. Default: 10

       --proxy <hostname[:port]>
              Set proxy hostname and port (default: 8080)

       --proxy-user <username:password>
              Set proxy user and password

       --open-timeout
              Time in seconds. Default: 15

       --read-timeout
              Time in seconds. Default: 30

       --wait=SECONDS
              Wait SECONDS between connections.  This is useful when using a single thread.

       --custom-plugin
              Define a custom plugin call Custom, Examples: ":text=>'powered by  abc'"  ":regexp=>/powered[  ]?by  ab[0-9]/"  ":ghdb=>'intitle:abc
              "powered by abc"'" ":md5=>'8666257030b94d3bdb46e05945f60b42'" "{:text=>'powered by abc'},{:regexp=>/abc [ ]?1/i}"

       --dorks <plugin name>
              List google dorks for the selected plugin

       --url-prefix
              Add a prefix to target URLs

       --url-suffix
              Add a suffix to target URLs

       --url-pattern
              Insert the targets into a URL. Requires --input-file, eg. www.example.com/%insert%/robots.txt

       --help -h
              Display usage

       --verbose -v
              Increase verbosity (recommended), use twice for debugging.

       --debug
              Raise errors in plugins.

       --version
              Display version information.

EXAMPLES
       Passive:
               whatweb example.com

       Passive (Verbose):
               whatweb -v example.com

       Aggressive:
               whatweb -a 3 example.com

       IP Ranges
               whatweb 192.168.1.0/24

BUGS
       Report bugs and feature requests to https://github.com/urbanadventurer/WhatWeb

AUTHOR
       WhatWeb was written by Andrew Horton aka urbanadventurer, and Brendan Coles.

HOMEPAGE
       http://www.morningstarsecurity.com/research/whatweb

                                                                  April 5th, 2011                                                       WHATWEB(1)
