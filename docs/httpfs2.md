HTTPFS2(1)                                                                                                                              HTTPFS2(1)

NAME
       httpfs2 - mount a file from a http server into the filesystem

SYNOPSIS
       httpfs2 [OPTIONS] URL FUSE-OPTIONS httpfs2_ssl [OPTIONS] URL FUSE-OPTIONS

DESCRIPTION
       httpfs2 is a FUSE based filesystem for mounting http or https URLS as files in the filesystem. There is no notion of listable directories
       in http so only a single URL can be mounted. The server must be able to send byte ranges.

OPTIONS
       -c console
           Attempt to use the file ior device console for output after fork. The default is /dev/console.

       -f
           Do not fork, stay in foreground.

       -t timeout
           Use different timeout for connections. Default '30’s.

       URL
           The url should specify the protocol as http or https, and it may specify basic authentication username and password. Currently special
           characters like whitespace are not handled so the URL cannot contain them. See a sample URL below:

               http://user:password@server.com/dir/file

       FUSE-OPTIONS
           These options are passed to the FUSE library. At the very least the mount point should be specified.

EXIT STATUS
       0
           Successfully connected to the server

       other
           Failure (url parsing error, server error, FUSE setup error). Some FUSE errors may happen only after the process forks so they will not
           be returned in exit value.

BUGS
       The process can be stopped by typing ^Z on the terminal which may not be desirable under some circumstances.

AUTHORS
           Miklos Szeredi <miklos@szeredi.hu>
           hmb  marionraven at users.sourceforge.net
           Michal Suchanek <hramrach@centrum.cz>

COPYING
       Free use of this software is granted under the terms of the GNU General Public License (GPL).

AUTHOR
       Michal Suchanek <hramrach@centrum.cz>
           Author.

                                                                    05/28/2013                                                          HTTPFS2(1)
