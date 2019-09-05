CUTYCAPT(1)                                                   General Commands Manual                                                  CUTYCAPT(1)

NAME
       cutycapt - utility to capture WebKit's rendering of a web page

SYNOPSIS
       cutycapt [options] --url=http://www.someurl.com --out=output.png

DESCRIPTION
       This manual page documents briefly the cutycapt command.

       CutyCapt  is  a  small  cross-platform command-line utility to capture WebKit's rendering of a web page into a variety of vector and bitmap
       formats, including SVG, PDF, PS, PNG, JPEG, TIFF, GIF, and BMP.

OPTIONS
       A summary of options is included below.

       --help Show summary of options.

       --url=<url>
              The URL to capture (http:...|file:...|...)

       --out=<path>
              The target file (.png|pdf|ps|svg|jpeg|...)

       --out-format=<f>
              Like extension in --out, overrides heuristic

       --min-width=<int>
              Minimal width for the image (default: 800)

       --min-height=<int>
              Minimal height for the image (default: 600)

       --max-wait=<ms>
              Don't wait more than (default: 90000, infinite: 0)

       --delay=<ms>
              After successful load, wait (default: 0)

       --user-style-path=<path>
              Location of user style sheet file, if any

       --user-style-string=<css>
              User style rules specified as text

       --header=<name>:<value>
              Request header; repeatable; some can't be set

       --method=<get|post|put>
              Specifies the request method (default: get)

       --body-string=<string>
              Unencoded request body (default: none)

       --body-base64=<base64>
              Base64-encoded request body (default: none)

       --app-name=<name>
              Application name used in User-Agent; default is none

       --app-version=<version>
              Application version used in User-Agent; default is none

       --user-agent=<string>
              Override the User-Agent header Qt would set

       --javascript=<on|off>
              JavaScript execution (default: on)

       --java=<on|off>
              Java execution (default: unknown)

       --plugins=<on|off>
              Plugin execution (default: unknown)

       --private-browsing=<on|off>
              Private browsing (default: unknown)

       --auto-load-images=<on|off>
              Automatic image loading (default: on)

       --js-can-open-windows=<on|off>
              Script can open windows? (default: unknown)

       --js-can-access-clipboard=<on|off>
              Script clipboard privs (default: unknown)

       --print-backgrounds=<on|off>
              Backgrounds in PDF/PS output (default: off)

       --zoom-factor=<float>
              Page zoom factor (default: no zooming)

       --zoom-text-only=<on|off>
              Whether to zoom only the text (default: off)

       --http-proxy=<url>
              Address for HTTP proxy server (default: none)

AUTHOR
       CutyCapt was written by Björn Höhrmann <bjoern@hoehrmann.de>.

       This manual page was written by David Paleino <dapal@debian.org>, for the Debian project (and may be used by others), and is licensed under
       the GNU General Public License, version 2 or later.

                                                                   June 28, 2010                                                       CUTYCAPT(1)
