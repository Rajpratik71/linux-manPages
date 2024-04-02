chromium-browser(1)                                                USER COMMANDS                                               chromium-browser(1)

NAME
       chromium-browser - the web browser from Google

SYNOPSIS
       chromium-browser [OPTION] [PATH|URL]

DESCRIPTION
       See the Google Chrome help center for help on using the browser.

              <https://support.google.com/chrome/>

       This manpage only describes invocation, environment, and arguments.

OPTIONS
       Chromium has hundreds of undocumented command-line flags that are added and removed at the whim of the developers.  Here, we document rela‐
       tively stable flags.

       --user-data-dir=DIR
              Specifies the directory that user data (your "profile") is kept in.  Defaults to $HOME/.config/chromium  .   Separate  instances  of
              Chromium  must  use  separate  user  data directories; repeated invocations of chromium-browser will reuse an existing process for a
              given user data directory.

       --app=URL
              Runs URL in "app mode": with no browser toolbars.

       --incognito
              Open in incognito mode.

       --new-window
              If PATH or URL is given, open it in a new window.

       --proxy-server=host:port
              Specify the HTTP/SOCKS4/SOCKS5 proxy server to use for requests.  This overrides any environment variables or  settings  picked  via
              the options dialog.  An individual proxy server is specified using the format:

                [<proxy-scheme>://]<proxy-host>[:<proxy-port>]

              Where <proxy-scheme> is the protocol of the proxy server, and is one of:

                "http", "socks", "socks4", "socks5".

              If the <proxy-scheme> is omitted, it defaults to "http". Also note that "socks" is equivalent to "socks5".

              Examples:

                --proxy-server="foopy:99"
                    Use the HTTP proxy "foopy:99" to load all URLs.

                --proxy-server="socks://foobar:1080"
                    Use the SOCKS v5 proxy "foobar:1080" to load all URLs.

                --proxy-server="socks4://foobar:1080"
                    Use the SOCKS v4 proxy "foobar:1080" to load all URLs.

                --proxy-server="socks5://foobar:66"
                    Use the SOCKS v5 proxy "foobar:66" to load all URLs.

              It  is  also possible to specify a separate proxy server for different URL types, by prefixing the proxy server specifier with a URL
              specifier:

              Example:

                --proxy-server="https=proxy1:80;http=socks4://baz:1080"
                    Load https://* URLs using the HTTP proxy "proxy1:80". And load http://*
                    URLs using the SOCKS v4 proxy "baz:1080".

       --no-proxy-server
              Disables the proxy server.  Overrides any environment variables or settings picked via the options dialog.

       --proxy-auto-detect
              Autodetect proxy configuration.  Overrides any environment variables or settings picked via the options dialog.

       --proxy-pac-url=URL
              Specify proxy autoconfiguration URL.  Overrides any environment variables or settings picked via the options dialog.

       --password-store=<basic|gnome|kwallet>
              Set the password store to use.  The default is to automatically detect based on the desktop environment.  basic  selects  the  built
              in, unencrypted password store.  gnome selects Gnome keyring.  kwallet selects (KDE) KWallet.  (Note that KWallet may not work reli‐
              ably outside KDE.)

       --version
              Show version information.

       As a GTK+ app, Chromium also obeys GTK+ command-line flags, such as --display.  See the GTK documentation for more:

              <http://library.gnome.org/devel/gtk/stable/gtk-running.html> <http://library.gnome.org/devel/gtk/stable/gtk-x11.html>

ENVIRONMENT
       Chromium obeys the following environment variables:

       all_proxy
              Shorthand for specifying all of http_proxy, https_proxy, ftp_proxy

       http_proxy, https_proxy, ftp_proxy
              The proxy servers used for HTTP, HTTPS, and FTP.  Note: because Gnome/KDE proxy settings may propagate into these variables in  some
              terminals,  this variable is ignored (in preference for actual system proxy settings) when running under Gnome or KDE.  Use the com‐
              mand-line flags to set these when you want to force their values.

       auto_proxy
              Specify proxy autoconfiguration.  Defined and empty autodetects; otherwise, it should be an autoconfig  URL.   But  see  above  note
              about Gnome/KDE.

       SOCKS_SERVER
              SOCKS proxy server (defaults to SOCKS v4, also set SOCKS_VERSION=5 to use SOCKS v5).

       no_proxy
              Comma separated list of hosts or patterns to bypass proxying.

FILES
       $HOME/.config/chromium
              Default directory for configuration data.

       $HOME/.cache/chromium
              Default directory for cache data.  (Why?  See <http://standards.freedesktop.org/basedir-spec/latest/> .)

BUGS
       Bug tracker:

              http://code.google.com/p/chromium/issues/list

       Be  sure  to do your search within "All Issues" before reporting bugs, and be sure to pick the "Defect on Linux" template when filing a new
       one.

AUTHOR
       The Chromium team - <http://www.chromium.org>

                                                                                                                               chromium-browser(1)
