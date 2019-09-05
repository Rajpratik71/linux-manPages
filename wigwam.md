WIGWAM(1)                                                     General Commands Manual                                                    WIGWAM(1)

NAME
       wigwam - check the Hiawatha webserver configuration for non-critical errors

SYNOPSIS
       wigwam [options]
       Options: -b <username> [<password>]: create password file entry for basic HTTP authentication.
                -c path: path to where the configrationfiles are located.
                -d <username> <realm> [<password>]: create password file entry for digest HTTP authentication.
                -h: show help and exit.
                -q: don't print the test results.
                -s: print file hashes for current directory.
                -t <toolkit_id>: test URL toolkit rule(s).
                -v: show version and exit.

DESCRIPTION
       Wigwam is a configuration validation tool for the Hiawatha webserver. Use it to check the Hiawatha main configuration for non-fatal config‐
       uration errors. This tool loads the configuration in a different way then Hiawatha does, whereby it's easier to check for  certain  errors.
       These checks have been put in a seperate program, in order to keep Hiawatha from growing too large.

URL TOOLKIT TESTING
       With the option -t, you can use Wigwam to test your URL toolkit rules. When testing URL toolkit rules, you should only enter the part after
       the hostname in the URL. For example, if  you  want  to  test  the  URL  "http://www.mydomain.com/index.php?key=value",  you  should  enter
       "/index.php?key=value".  A result shown as "old: <URL>" means nothing has been changed. When a toolkit rule has been applied, the result is
       shown as "new: <URL>".

       When testing the Header UrlToolkit rule, you can set the environment variables HTTP_HOST, HTTP_REFERER and HTTP_USER_AGENT to  emulate  the
       Host, Referer en User-Agent HTTP headers.

       To use URL toolkit testing, Hiawatha must not have been compiled with -DENABLE_TOOLKIT=off. Use 'hiawatha -v' for compile information.

SEE ALSO
       Wigwam is part of the Hiawatha webserver. See hiawatha(1) for more information about Hiawatha.

AUTHOR
       Hugo Leisink <hugo@hiawatha-webserver.org> - http://www.hiawatha-webserver.org/

                                                                                                                                         WIGWAM(1)
