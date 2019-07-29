NIKTO(1)                                                                                                                                  NIKTO(1)

NAME
       nikto - Scan web server for known vulnerabilities

SYNOPSIS
       /usr/local/bin/nikto [options...]

DESCRIPTION
       Examine a web server to find potential problems and security vulnerabilities, including:

       ·   Server and software misconfigurations

       ·   Default files and programs

       ·   Insecure files and programs

       ·   Outdated servers and programs

       Nikto is built on LibWhisker (by RFP) and can run on any platform which has a Perl environment. It supports SSL, proxies, host
       authentication, IDS evasion and more. It can be updated automatically from the command-line, and supports the optional submission of
       updated version data back to the maintainers.

OPTIONS
       Below are all of the Nikto command line options and explanations. A brief version of this text is available by running Nikto with the -h
       (-help) option.

       -Cgidirs
           Scan these CGI directories. Special words "none" or "all" may be used to scan all CGI directories or none, (respectively). A literal
           value for a CGI directory such as "/cgi-test/" may be specified (must include trailing slash). If this is option is not specified, all
           CGI directories listed in config.txt will be tested.

       -config
           Specify an alternative config file to use instead of the config.txt located in the install directory.

       -dbcheck
           Check the scan databases for syntax errors.

       -Display
           Control the output that Nikto shows. See Chapter 5 for detailed information on these options. Use the reference number or letter to
           specify the type, multiple may be used:

           1 - Show redirects

           2 - Show cookies received

           3 - Show all 200/OK responses

           4 - Show URLs which require authentication

           D - Debug Output

           V - Verbose Output

       -evasion
           Specify the LibWhisker IDS evasion technique to use (see the LibWhisker docs for detailed information on these). Use the reference
           number to specify the type, multiple may be used:

           1 - Random URI encoding (non-UTF8)

           2 - Directory self-reference (/./)

           3 - Premature URL ending

           4 - Prepend long random string

           5 - Fake parameter

           6 - TAB as request spacer

           7 - Change the case of the URL

           8 - Use Windows directory separator (\)

       -findonly
           Only discover the HTTP(S) ports, do not perform a security scan. This will attempt to connect with HTTP or HTTPS, and report the Server
           header.

       -Format
           Save the output file specified with -o (-output) option in this format. If not specified, the default will be taken from the file
           extension specified in the -output option. Valid formats are:

           csv - a comma-seperated list

           htm - an HTML report

           txt - a text report

           xml - an XML report

       -host
           Host(s) to target. Can be an IP address, hostname or text file of hosts. A single dash (-) maybe used for stdout. Can also parse nmap
           -oG style output

       -Help
           Display extended help information.

       -id
           ID and password to use for host Basic host authentication. Format is "id:password".

       -list-plugins
           Will list all plugins that Nikto can run against targets and then will exit without performing a scan. These can be tuned for a session
           using the -plugins option.

           The output format is:

           Plugin name

            full name - description

            Written by author, Copyright (C) copyright

       -mutate
           Specify mutation technique. A mutation will cause Nikto to combine tests or attempt to guess values. These techniques may cause a
           tremendous amount of tests to be launched against the target. Use the reference number to specify the type, multiple may be used:

           1 - Test all files with all root directories

           2 - Guess for password file names

           3 - Enumerate user names via Apache (/~user type requests)

           4 - Enumerate user names via cgiwrap (/cgi-bin/cgiwrap/~user type requests)

           5 - Attempt to brute force sub-domain names, assume that the host name is the parent domain

           6 - Attempt to guess directory names from the supplied dictionary file

       -mutate-options
           Provide extra information for mutates, e.g. a dictionary file

       -nolookup
           Do not perform name lookups on IP addresses.

       -nossl
           Do not use SSL to connect to the server.

       -no404
           Disable 404 (file not found) checking. This will reduce the total number of requests made to the webserver and may be preferable when
           checking a server over a slow link, or an embedded device. This will generally lead to more false positives being discovered.

       -output
           Write output to the file specified. The format used will be taken from the file extension. This can be over-riden by using the -Format
           option (e.g. to write text files with a different extenstion. Existing files will have new information appended.

       -plugins
           Select which plugins will be run on the specified targets. A comma separated list should be provided which lists the names of the
           plugins. The names can be found by using -list-plugins.

           There are two special entries: ALL, which specifies all plugins shall be run and NONE, which specifies no plugins shall be run. The
           default is ALL

       -port
           TCP port(s) to target. To test more than one port on the same host, specify the list of ports in the -p (-port) option. Ports can be
           specified as a range (i.e., 80-90), or as a comma-delimited list, (i.e., 80,88,90). If not specified, port 80 is used.

       -Pause
           Seconds to delay between each test.

       -root
           Prepend the value specified to the beginning of every request. This is useful to test applications or web servers which have all of
           their files under a certain directory.

       -ssl
           Only test SSL on the ports specified. Using this option will dramatically speed up requests to HTTPS ports, since otherwise the HTTP
           request will have to timeout first.

       -Single
           Perform a single request to a target server. Nikto will prompt for all options which can be specified, and then report the detailed
           output. See Chapter 5 for detailed information.

       -timeout
           Seconds to wait before timing out a request. Default timeout is 10 seconds.

       -Tuning
           Tuning options will control the test that Nikto will use against a target. By default, if any options are specified, only those tests
           will be performed. If the "x" option is used, it will reverse the logic and exclude only those tests. Use the reference number or
           letter to specify the type, multiple may be used:

           0 - File Upload

           1 - Interesting File / Seen in logs

           2 - Misconfiguration / Default File

           3 - Information Disclosure

           4 - Injection (XSS/Script/HTML)

           5 - Remote File Retrieval - Inside Web Root

           6 - Denial of Service

           7 - Remote File Retrieval - Server Wide

           8 - Command Execution / Remote Shell

           9 - SQL Injection

           a - Authentication Bypass

           b - Software Identification

           c - Remote Source Inclusion

           x - Reverse Tuning Options (i.e., include all except specified)

           The given string will be parsed from left to right, any x characters will apply to all characters to the right of the character.

       -useproxy
           Use the HTTP proxy defined in the configuration file.

       -update
           Update the plugins and databases directly from cirt.net.

       -Version
           Display the Nikto software, plugin and database versions.

       -vhost
           Specify the Host header to be sent to the target.

FILES
       nikto.conf
           The Nikto configuration file. This sets Nikto´s global options. Several nikto.conf files may exist and are parsed in the below order.
           As each configuration file is loaded is supersedes any previously set configuration:

           ·   System wide (e.g. /etc/nikto.conf)

           ·   Home directory (e.g. $HOME/nikto.conf)

           ·   Current directory (e.g. ./nikto.conf)

       ${NIKTO_DIR}/plugins/db*
           db files are the databases that nikto uses to check for vulnerabilities and issues within the web server.

       ${NIKTO_DIR}/plugins/*.plugin
           All nikto´s plugins exist here. Nikto itself is just a wrapper script to manage CLI and pass through to the plugins.

       ${NIKTO_DIR}/templates
           Contains the templates for nikto´s output formats.

BUGS
       The current features are not supported:

       ·   SOCKS Proxies

AUTHORS
       Nikto was originally written and maintained by Sullo, CIRT, Inc. It is currently maintained by David Lodge. See the main documentation for
       other contributors.

       All code is (C) CIRT, Inc., except LibWhisker which is (C) rfp.labs (wiretrip.net). Other portions of code may be (C) as specified.

SEE ALSO
       Nikto Homepage[1]

NOTES
        1. Nikto Homepage
           http://www.cirt.net/

                                                                    01/19/2010                                                            NIKTO(1)
