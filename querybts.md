querybts(1)                                                   General Commands Manual                                                  querybts(1)

NAME
       querybts - view outstanding bug reports on a debbugs server

SYNOPSIS
       querybts [options] <package | number [number2]...>

DESCRIPTION
       querybts  is  designed  to provide a convenient and easy-to-use interface to the Debbugs bug tracking system, as used by Debian and several
       other projects.  You can specify a package name or one or more report numbers.

OPTIONS
       The program follows the usual GNU command line syntax, with long options starting with  two  dashes  (`--').   A  summary  of  options  are
       included below.

       -h, --help
              Show summary of options.

       --version
              Show the version of querybts and exit.

       -A, --archive
              Browse  archived  bugs instead of current reports.  Debbugs servers clear out closed reports after 28 days and place them in a sepa‐
              rate archive; this option allows those older, resolved reports to be viewed (at least for servers that maintain an archive).

       -B SYSTEM, --bts=SYSTEM
              Instead of the Debian bug server, use the server specified by SYSTEM.  Valid options are default and debian but check --help for  an
              updated list.

       -b, --buglist
              Display a bugs list for the given package.

       --latest-first
              Display the bug reports list sorted and with the latest reports at the top.

       --mbox-reader-cmd=MBOX_READER_CMD
              Specify  a command to open the bug reports mbox file. You can use %s to substitute the mbox file to be used, and %% to insert a lit‐
              eral percent sign. If no %s is specified, the mbox file name is supplied at the end of the argument list.

       -m, --mbox
              Retrieve the given bug number(s) or package name(s) as a mailbox file, instead of viewing it. It will be dumped to standard output.

       --proxy=PROXY, --http_proxy=PROXY
              Specify the WWW proxy server to use to handle the queries to the bug tracking system.  You should only need this  parameter  if  you
              are behind a firewall.

       -s, --source
              Query on source packages, rather than binary packages.

       --timeout=SECONDS
              Specify  the network timeout, the number of seconds to wait for a resource to respond. If nothing is specified, a default timeout of
              1 minute is selected.

              In case of a network error, there are chances it's due to a too low timeout: try passing the --timeout option with  a  higher  value
              than default.

       -u INTERFACE, --ui=INTERFACE, --interface=INTERFACE
              Specify the user interface to use.  Valid options are text, urwid, gtk2; default is taken from the reportbug configuration files.

       -w, --web
              Launch  a  web browser to view bug reports, instead of using the internal interface.  This will also allow you to see the whole dis‐
              cussion about a particular bug at once, instead of one message at a time as querybts would do.  (Only the first bug  number  on  the
              command line will be opened.)

CONFIGURATION FILES
       querybts supports a simple run control file syntax.  Commands are read from /etc/reportbug.conf and $HOME/.reportbugrc with commands in the
       latter overriding those in the former.

       Commands are not case sensitive, and currently take 0 or 1 argument; arguments containing whitespace must be enclosed in quotes.

       Any line starting with # is taken to be a comment and will be ignored.

       Generally, options corresponding to the long  options  for  querybts  are  supported,  without  leading  --  sequences.   See  the  default
       /etc/reportbug.conf for all acceptable options and reportbug.conf(5) for all acceptable options and detailed information.

       Options only supported by reportbug will be silently ignored.

ENVIRONMENT
       http_proxy
              Provides  the  address of a proxy server to handle the BTS query.  This should be a valid http URL for a proxy server, including any
              required port number (simply specifying a hostname, or omitting a port other than 80, WILL NOT WORK).

SEE ALSO
       reportbug(1), reportbug.conf(5)

AUTHOR
       Chris Lawrence <lawrencc@debian.org>, Sandro Tosi <morph@debian.org>.

                                                                                                                                       querybts(1)
