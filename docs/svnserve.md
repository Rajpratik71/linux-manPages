svnserve(8)                                                   System Manager's Manual                                                  svnserve(8)

NAME
       svnserve - Server for the 'svn' repository access method

SYNOPSIS
       svnserve [options]

DESCRIPTION
       svnserve  allows  access  to Subversion repositories using the svn network protocol.  It can both run as a standalone server process, or it
       can run out of inetd.  You must choose a mode of operation when you start svnserve.  The following options are recognized:

       -d, --daemon
            Causes svnserve to run in daemon mode.  svnserve backgrounds itself and accepts and serves TCP/IP connections on the svn  port  (3690,
            by default).

       --listen-port=port
            Causes svnserve to listen on port when run in daemon mode.

       --listen-host=host
            Causes svnserve to listen on the interface specified by host, which may be either a hostname or an IP address.

       --foreground
            When used together with -d, this option causes svnserve to stay in the foreground.  This option is mainly useful for debugging.

       -i, --inetd
            Causes svnserve to use the stdin/stdout file descriptors, as is appropriate for a daemon running out of inetd.

       -h, --help
            Displays a usage summary and exits.

       --version
            Print svnserve's version and the repository filesystem back-end(s) a particular svnserve supports.

       -r root, --root=root
            Sets  the  virtual root for repositories served by svnserve.  The pathname in URLs provided by the client will be interpreted relative
            to this root, and will not be allowed to escape this root.

       -R --read-only
            Force all write operations through this svnserve instance to be forbidden, overriding all other access policy configuration.   Do  not
            use  this  option  to set general repository access policy - that is what the conf/svnserve.conf repository configuration file is for.
            This option should be used only to restrict access via a certain method of invoking svnserve - for example, to allow write access  via
            SSH, but not via a svnserve daemon, or to create a restricted SSH key which is only capable of read access.

       -t, --tunnel
            Causes  svnserve to run in tunnel mode, which is just like the inetd mode of operation (serve one connection over stdin/stdout) except
            that the connection is considered to be pre-authenticated with the username of the current uid.  This flag is selected by  the  client
            when running over a tunnel agent.

       --tunnel-user=username
            When  combined with --tunnel, overrides the pre-authenticated username with the supplied username.  This is useful in combination with
            the ssh authorized_key file's "command" directive to allow a single system account to be used by multiple committers,  each  having  a
            distinct ssh identity.

       -T, --threads
            When  running  in daemon mode, causes svnserve to spawn a thread instead of a process for each connection.  The svnserve process still
            backgrounds itself at startup time.

       --config-file=filename
            When specified, svnserve reads filename once at program startup and caches the svnserve configuration.  The password and authorization
            configurations   referenced   from  filename  will  be  loaded  on  each  connection.   svnserve  will  not  read  any  per-repository
            conf/svnserve.conf files when this option is used.  See the svnserve.conf(5) man page for details of the file format for this option.

       --pid-file=filename
            When specified, svnserve will write its process ID to filename.

       -X, --listen-once
            Causes svnserve to accept one connection on the svn port, serve it, and exit.  This option is mainly useful for debugging.

       Unless the --config-file option was specified on the command line, once the client has selected  a  repository  by  transmitting  its  URL,
       svnserve reads a file named conf/svnserve.conf in the repository directory to determine repository-specific settings such as what authenti‐
       cation database to use and what authorization policies to apply.  See the svnserve.conf(5) man page for details of that file format.

SEE ALSO
       svnserve.conf(5)

                                                                                                                                       svnserve(8)
