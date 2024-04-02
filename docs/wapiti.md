wapiti(1)                                                 http://wapiti.sourceforge.net/                                                 wapiti(1)

NAME
       Wapiti - A web application vulnerability scanner in Python.

SYNOPSIS
       wapiti ROOT_URL [OPTIONS]

DESCRIPTION
       Wapiti allows you to audit the security of your web applications.
       It  performs  "black-box"  scans,  i.e.  it  does  not study the source code of the application but will scans the webpages of the deployed
       webapp, looking for scripts and forms where it can inject data.
       Once it gets this list, Wapiti acts like a fuzzer, injecting payloads to see if a script is vulnerable.

OPTIONS
       -s, --start=URL
              To specify an url to start with. This option can be called several times.
              Wapiti will browse these links to fond more URLs even if the specified link is not in the scope.

       -x, --exclude=URL
              To exclude an url from the scan (for example logout scripts). This option can be called several times to exclude several URLs.
              Wildcards (*) can be used in URLs as basic regex.
              Example :
                     -x "http://server/base/?page=*&module=test"
              or
                     -x http://server/base/admin/* to exclude a directory

       -b, --scope=SCOPE
              Set the scope of the scan:
                     page : to analyse only the page given as the root URL.
                     folder : to analyse all the URLs under the root URL passed to Wapiti (default).
                     domain : to analyse all the links to the pages which are in the same domain as the URL passed to Wapiti.

       -p, --proxy=PROXY_URL
              To specify a proxy. Currently supported proxies are HTTP and HTTPS.
              This option can be called twice to specify the HTTP and the HTTPS proxies.
              Example:
                     -p http://proxy:port/

       -c, --cookie=COOKIE
              To import cookies to use for the scan. The COOKIE file must be in JSON format.
              Cookies can be grabbed using the cookie.py and getcookie.py utilities (net directory).

       -t, --timeout=TIMEOUT
              Set the timeout (maximum time in seconds to wait for the server to send a response).

       -a, --auth=LOGIN%PASSWORD
              Set credentials for HTTP authentication ('%' is used as a separator).

       --auth-method=METHOD
              If the server requires an authentication, set the authentication method to use.
              Currently supported methods are (some require additional modules to install):
                     basic
                     digest
                     kerberos
                     ntlm

       -r, --remove=PARAM
              Automatically remove the parameter PARAM (and its values) from the URLs.

       -n, --nice=LIMIT
              Define a limit of URLs to browse with the same pattern (ie, the maximum number of unique values for the same parameter).
              Use this option to prevent endless loops during scan. LIMIT must be greater than 0.

       -m, --module=MODULE_OPTIONS
              Set the modules (and HTTP methods for each module) to use for attacks.
              Prefix a module name with a dash to deactivate the related module.
              To only browse the target (without sending any payloads), deactivate every module with -m "-all".
              If you don't specify the HTTP methods, GET and POST will be used.
              Example:
                     -m "-all,xss:get,exec:post"

       -i, --continue=FILE
              This parameter indicates to Wapiti to resume the previous scan saved in the specified XML status file.
              The file name is optional, if it is not specified, Wapiti takes the default file from the "scans" folder.

       -k, --attack=FILE
              This parameter indicates to Wapiti to resume the attacks without scanning again, loading the scan status from the specified XML sta‐
              tus file.
              The file name is optional, if it is not specified, Wapiti takes the default file from the "scans" folder.

       -u, --color
              Use colors to highlight vulnerabilities and anomalies in output.

       -v, --verbose=LEVEL
              Set the verbosity level to LEVEL.
              0: quiet (default), 1: print each URL, 2: print every attack.

       -f, --format=TYPE
              Set the format type for the report to TYPE. Currently supported formats are :
                     json: Report in JSON format
                     html : Report in HTML format (default)
                     openvas : Report in OpenVAS XML format
                     txt : Report un plain text (UTF-8)
                     vulneranet: Report in VulneraNET XML format
                     xml : Report in XML format

       -o, --output=FILE
              Write the report to FILE.
              If the selected report format is "html", this parameter will be used as a directory name.

       --verify-ssl=<0|1>
              This parameter indicates whether Wapiti must check SSL certificats.
              Default is to verify certificates.

       -h, --help
              To print this usage message.

LICENCE
       Wapiti is covered by the GNU General Public License (GPL), version 2.
       Please read the COPYING file for more information.

COPYRIGHT
       Copyright (c) 2006-2013 Nicolas Surribas.

AUTHORS
       Nicolas Surribas
       David del Pozo
       Alberto Pastor

BUG REPORTS
       If you find a bug in Wapiti please report it to http://sourceforge.net/tracker/?group_id=168625

SEE ALSO
       The README file that comes with Wapiti gives more detailed information on the options.

Version 2.3.0                                             http://wapiti.sourceforge.net/                                                 wapiti(1)
