cadaver(1)                                                         User Manuals                                                         cadaver(1)

NAME
       cadaver - A command-line WebDAV client for Unix.

SYNOPSIS
       cadaver [-trp[-r file][-p host[:port]]][-V][-h] http://hostname[:port]/path

DESCRIPTION
       cadaver  supports  file  upload,  download,  on-screen display, namespace operations (move and copy), collection creation and deletion, and
       locking operations.

       Its operation is similar to the standard BSD ftp(1) client and the Samba Project's smbclient(1).  A user familiar with these  tools  should
       be quite comfortable with cadaver.

       cadaver  supports  automatically  logging  in  to  servers requiring authentication via a .netrc file (similar to ftp(1) - see section "THE
       .netrc FILE" below).

OPTIONS
       -t, --tolerant
              Allow cd/open into non-WebDAV enabled collection; use if the server or proxy server has WebDAV compliance problems.

       -r, --rcfile=file
              Use this rcfile rather than the default of ~/.cadaverrc

       -p, --proxy=host[:port]
              Connect using the proxy host "host" and optional proxy port "port".

       -V, --version
              Display version information and exit.

       -h, --help
              Display this help message and exit.

COMMAND REFERENCE
       ls [path]
              List contents of current [or other] collection

       cd path
              Change to specified collection

       pwd    Display name of current collection

       put local [remote]
              Upload local file

       get remote [local]
              Download remote resource

       mget remote...
              Download many remote resources

       mput local...
              Upload many local files

       edit resource
              Edit given resource

       less remote...
              Display remote resource through pager

       mkcol remote...
              Create remote collection(s)

       cat remote...
              Display remote resource(s)

       delete remote...
              Delete non-collection resource(s)

       rmcol remote...
              Delete remote collections and ALL contents

       copy source... dest
              Copy resource(s) from source to dest

       move source... dest
              Move resource(s) from source to dest

       lock resource
              Lock given resource

       unlock resource
              Unlock given resource

       discover resource
              Display lock information for resource

       steal resource
              Steal lock token for resource

       showlocks
              Display list of owned locks

       propnames res
              Names of properties defined on resource

       chexec [+|-] remote
              Change isexecutable property of resource

       propget res [propname]
              Retrieve properties of resource

       propset res propname value
              Set property on resource

       set [option] [value]
              Set an option, or display options

       open URL
              Open connection to given URL

       close  Close current connection

       quit   Exit program

       unset [option] [value]
              Unsets or clears value from option.

       lcd [directory]
              Change local working directory

       lls [options]
              Display local directory listing

       lpwd   Print local working directory

       logout Logout of authentication session

       help [command]
              Display help message

THE .netrc FILE
       The file ~/.netrc may be used to automatically login to a server requiring authentication. The following tokens (separated by spaces,  tabs
       or newlines) may be used:

       machine host
              Identify  a remote machine host which is compared with the hostname given on the command line or as an argument to the open command.
              Any subsequent tokens up to the end of file or the next machine or default token are associated with this entry.

       default
              This is equivalent to the machine token but matches any hostname. Only one default token may be  used  and  it  must  be  after  all
              machine tokens.

       login username
              Specifies the username to use when logging in to the remote machine.

       password string
       passwd string
              Specifies the password to use when logging in to the remote machine.

       Any other tokens (as described in ftp(1)) are ignored.

EXAMPLES
       cadaver http://dav.example.com/
              Connects to the server myserver.example.com, opening the root collection.

       cadaver http://zope.example.com:8022/Users/fred/
              Connects to the server zope.example.com using port 8022, opening the collection "/Users/fred/".

       cadaver https://secure.example.com/
              Connects to a server called secure.example.com using SSL.

FILES
       ~/.cadaverrc
              Individual user settings that can override cadaver defaults and to script cadaver. Can be changed by the "--rcfile" option.

       ~/.netrc
              Login and initialization information used by the auto-login process. See section "THE .netrc FILE" for details.

AUTHOR
       Joe Orton <cadaver@webdav.org>

SEE ALSO
       ftp(1), smbclient(1)

Unix                                                               January 2002                                                         cadaver(1)
