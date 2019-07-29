DRPMSYNC(8)                                                                                System Manager's Manual                                                                                DRPMSYNC(8)



NAME
       drpmsync - sync a file tree with deltarpms


SYNOPSIS
       drpmsync [-c config] [source] dir
       drpmsync [-s|-S] serverconfig
       cgi-bin/drpmsync


DESCRIPTION
       Drpmsync  keeps  a  local file system tree in sync with a remote one.  Its intended use is to work with rpm trees; the deltarpm technology can only save bandwidth if rpms get transmitted. Please use
       the rsync program for normal file trees.

       Drpmsync can run in two modes: as a client it connects to a server, receives a file list and brings the tree up to date, as a server it answers incoming requests and transmits files and rpms.


CLIENT MODE
       In this mode drpmsync updates the tree in dir.  It opens the configuration file dir/drpmsync/config to get information about which server to use and other settings.  You can specify a different con-
       figuration file with the -c option.  The following settings are understood (the default for the boolean settings is false):

       source: server1 server2...

       This is a list of servers to connect to. Drpmsync advances through this list until a working server is found. If a source is specified on the command line it is used instead of the one from the con-
       figuration. The syntax for the server entries is "host[:port]/tree".

       log: logfile

       Specifies the name of a logfile. If the name does not start with a slash, dir/drpmsync/ is prepended to it.

       generate_deltas: true|false

       Controls whether drpmsync generates a delta if it receives a new version of a rpm and the server doesn't provide a delta. This is only useful if the local tree is also exported to other clients  via
       a local drpmsync server.

       generate_delta_compression: comp

       This parameter is forwarded to the makedeltarpm program when creating deltas. An example would be gzip,gzip.

       keep_deltas: true|false

       Tell drpmsync to save received or freshly created deltas to the dir/drpmsync/delta directory. Automatically true if generate_deltas or keep_uncombined is set to true.

       keep_uncombined: true|false

       This  tells  drpmsync  to request uncombined deltas from the server instead of a precombined single delta. This makes sense if you re-export the tree and want to maximize the number of versions your
       clients can update from.

       always_get_rpm: true|false

       Configures whether drpmsync should request that the full rpm is always sent along with the delta. Only makes sense if you have a fast network connection  so  that  applydeltarpm  takes  longer  than
       transmitting the ful rpm.

       deltarpmpath: path

       Sets the directory where drpmsync searches for the deltarpm programs.  The default is to search the $PATH variable.


SERVER MODE
       Drpmsync  can  wither  work  as  CGI script or as a standalone server.  CGI script mode is automatically selected if the REQUEST_METHOD environment variable is set. In this mode drpmsync expects the
       DRPMSYNC_CONFIG environment variable to contain the path to a server config file.  For apache you can set this with the SetEnv directive.

       Standalone mode is selected with the -s or -S option. In this mode the server configuration must be specified as an argument to the drpmsync program. The -s option makes the drpmsync  program  back-
       ground itself and exit right away, while -S keeps the server in the foreground.

       The server configuration can contain the following settings:

       allow: pattern1 pattern2...
       deny: pattern1 pattern2...

       This  provides  the  access  control  for the server.  pattern can either be a simple glob pattern (only * is supported) or it can be a full regular expression if it is written as /RE/.  The regular
       expression is automatically anchored at the start and the end. Examples are 10.10.*  or /10\.10\..*/ If either the numerical ip address or the domain name of the client matches any entry of the deny
       list,  access  is  forbidden.  Otherwise the allow list is searched for a match. If none is found, access is also denied. The default setting for both lists is empty, so you have to provide an allow
       list to allow access for the clients.

       log: logfile

       Specifies the path of a logfile.

       no_combine: true|false

       If this setting is true the server does not combine deltarpms.  This increases to amount of data that has to be transferred but reduces the processor load on the server.

       tree: external_path internal_path

       This statements exports the tree located at internal_path to the clients as directory external_path.  All of the above settings are saved as settings of this particular tree, so different trees  can
       use different configurations. This also means that the configuration directives of a tree must be above the tree statement.


       The following settings are global and only needed for standalone mode:

       serverlog: logfile

       Specifies the path of a logfile used for logging server events.

       servername: hostname[:port]

       The name of the server. If hostname is empty, the fully qualified domain name is used instead. The port defaults to port 80.

       serveraddr: addr

       This address is used for binding the server's socket. If not specified, connections can come from any interface.

       serveruser: user
       servergroup: group

       Configures the user and group the servers swicthes to after binding the socket to the desired port. Examples are nobody or wwwrun.

       maxclients: num

       This settings limits the maximum number of concurrent connections to num.  The default value is 10 connections.

       deltarpmpath: path

       Sets the directory where drpmsync searches for the deltarpm programs.  The default is to search the $PATH variable.


FILES
       dir/drpmsync/deltas
              directory used to store the deltas
       dir/drpmsync/lock
              lock used to serialize syncrpm calls
       dir/drpmsync/wip
              temporary storing space for the transmitted objects
       dir/drpmsync/cache
              md5sum cache to speed up the calculation of the tree state
       dir/drpmsync/timstamp
              contains the time of the last finished sync and the last time the remote tree state was requested.

SEE ALSO
       makedeltarpm(8), combinedeltarpm(8), applydeltarpm(8),

AUTHOR
       Michael Schroeder <mls@suse.de>



                                                                                                   Jun 2005                                                                                       DRPMSYNC(8)
