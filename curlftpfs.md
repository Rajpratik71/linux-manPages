curlftpfs(1)                                                     CurlFtpFS Manual                                                     curlftpfs(1)

NAME
       curlftpfs - mount a ftp host as a local directory

SYNOPSIS
       curlftpfs [options] host path

DESCRIPTION
       The  program  curlftpfs is a tool to mount remote ftp hosts as local directories. It connects to the host FTP server and maps its directory
       structure to the path directory.

       curlftpfs is powered by libcurl for all transfer-related features. See libcurl(3) for details. The filesystem part is implemented on top of
       FUSE.  See http://fuse.sourceforge.net/ for details.

FTP OPTIONS
       -h/--help
              Print help options.

       -v/--verbose
              Make libcurl print verbose debug output.

       -V/--version
              Print curlftpfs, libcurl and fuse versions.

       -o     Options are specified with a -o flag followed by a comma separated string of options.

              cacert=<file>
                     (SSL) Pass a string naming a file holding one or more certificates to verify the peer with.

                     Note   that  option  is  by  default set to the system path where libcurl's cacert bundle is assumed to be stored, as  estab‐
                     lished at build time.

              capath=<directory>
                     (SSL) Tells curlftpfs to use the specified certificate directory to verify the peer. The certificates must be in PEM  format,
                     and  the  directory  must  have been processed using  the  c_rehash  utility supplied  with  openssl.  Using capath can allow
                     curlftpfs to make connections much more efficiently than using  cacert  if the cacert file contains many CA certificates.

              cert=<certificate>
                     (SSL) Tells curlftpfs to use the specified certificate file. The default format is "PEM" and can be changed with cert_type.

              cert_type=<type>
                     (SSL) Tells curlftpfs what certificate type the provided certificate is in.  PEM, DER and ENG are recognized types.

              ciphers=<list of ciphers>
                     (SSL) Specifies which ciphers to use in the connection. The list must be syntactically correct, it consists of  one  or  more
                     cipher  strings separated  by colons. Commas or spaces are also acceptable separators but colons are normally used, , - and +
                     can be  used  as operators.  Valid  examples  of  cipher lists include 'RC4-SHA',  ´SHA1+DES',  'TLSv1'  and  'DEFAULT'.  The
                     default list is  normally set when you compile OpenSSL.

                     Read up on SSL cipher list details on this URL: http://www.openssl.org/docs/apps/ciphers.html

              codepage=<name>
                     Sets the encoding the ftp server uses to encode file names.

              connect_timeout=<seconds>
                     Maximum  time  in  seconds  that you allow the connection to the server to take.  This only limits the connection phase, once
                     curlftpfs has connected this option is of no more use.

              custom_list=<command>
                     Command used by curlftpfs to list files. The default is "LIST -a" but some servers might require extra  options,  e.g.  "LIST
                     -la".

              disable_eprt
                     Tell  curlftpfs  to  disable  the  use of the EPRT and LPRT commands when doing active FTP transfers. Curlftpfs will normally
                     always first attempt to use EPRT, then LPRT before using PORT, but with this option, it will use PORT right  away.  EPRT  and
                     LPRT  are  extensions to the original FTP protocol, may not work on all servers but enable more functionality in a better way
                     than the traditional PORT command.

              disable_epsv
                     Tell curlftpfs to disable the use of the EPSV command when doing passive FTP transfers. This is the default.

              enable_epsv
                     Tell curlftpfs to enable the use of the EPSV command when doing passive FTP transfers. Curlftpfs will first  attempt  to  use
                     EPSV before PASV.

              engine=<name>
                     Select  the  OpenSSL crypto engine to use for cipher operations.  Use:
                     curl --engine list
                     to   print   a   list  of  build-time  supported engines.  Note  that  not all  (or  none) of the engines may be available at
                     run-time.

              ftpfs_debug
                     Make curlftpfs print lots of debug information. Useful only in conjunction with the -d option.

              ftp_method=<method>
                     Control what method curlftpfs should use to reach a file on the server. The method argument should be one  of  the  following
                     alternatives:

                     multicwd
                            curlftpfs  does  a single CWD operation for each path part in the given URL. For deep hierarchies this means very many
                            commands. This is how RFC1738 says it should be done. This is the default but the slowest behavior.

                     singlecwd
                            curlftpfs does one CWD with the full target directory and then operates on the file "normally" (like in  the  multicwd
                            case).

              ftp_port=<address>
                     Reverses  the  initiator/listener roles when connecting with ftp. This switch makes curlftpfs use the PORT command instead of
                     PASV. In practice, PORT tells the server to connect to the client's specified address and port, while PASV  asks  the  server
                     for an ip address and port to connect to. <address> should be one of:

                     interface
                            i.e "eth0" to specify which interface's IP address you want to use

                     IP address
                            i.e "192.168.10.1" to specify exact IP number

                     host name
                            i.e "my.host.domain" to specify machine

                     -      make curlftpfs pick the same IP address that is already used for the control connection

                     Disable the attempt to use the EPRT command instead of PORT by using disable_eprt.  EPRT is really PORT++.

              httpproxy
                     Set the proxy type to HTTP. This is the default type.

              interface=<name>
                     Pass a string as parameter. This set the interface name  to  use as  outgoing network  interface.  The  name can be an inter‐
                     face name, an IP address or a host name.

              iocharset=<name>
                     Sets the charset used by the client side for codepage to charset translation.  Default: UTF8.

              ipv4   If  libcurl  is  capable  of resolving an address to multiple IP versions (which it is if it is  ipv6-capable),  this  option
                     tells libcurl  to  resolve names  to  IPv4  addresses only.

              ipv6   If   libcurl   is   capable  of resolving an address to multiple IP versions (which it is if it is ipv6-capable), this option
                     tells libcurl  to  resolve names  to  IPv6  addresses only.

              key=<key>
                     (SSL) Private key file name. Allows you to provide your private key in this separate file. The  default format is  "PEM"  and
                     can be changed with key_type.

              key_type=<type>
                     (SSL) Pass a string in the format of your private key. Supported  formats are "PEM", "DER" and "ENG".

                     The   format   "ENG"   enables  you  to load the private key from a crypto engine.  In this case key is used as an identifier
                     passed to  the  engine.  You have to set the crypto engine with engine option.  "DER" format key file   currently   does  not
                     work because of a bug in OpenSSL.

              krb4=<level>
                     Enable  kerberos4  authentication and use. The level must be entered and should be one of 'clear', 'safe', 'confidential'  or
                     'private'.  Should  you  use  a level that is not one of these, 'private' will instead be used.

                     This option requires that the libcurl library was built  with  kerberos4 support.  This is  not  very common.

              no_verify_hostname
                     (SSL) Curlftpfs will not verify the hostname when connecting to a SSL enabled server.

              no_verify_peer
                     (SSL) Curlftpfs will not verify the certificate when connecting to a SSL enabled server.

              pass=<password>
                     (SSL) Pass phrase for the private key.

              proxy=<host[:port]>
                     Use specified HTTP proxy. If the port number is  not  specified, it is assumed at port 1080.

                     This  option  overrides existing environment variables that sets proxy to use. If  there's  an  environment   variable   set‐
                     ting  a proxy, you can set proxy to "" to override it.

                     This options implies the proxytunnel option.

                     Starting   with  libcurl  version  7.14.1, the proxy host can be specified the exact same way as the proxy environment  vari‐
                     ables,  including protocol prefix (http://) and embedded user + password.

              proxytunnel
                     Tells curlftpfs to use a tunnel proxy. This option is implied by the proxy option but you need to set it manually if you  use
                     the proxy environment variable.

              proxy_anyauth
                     Tells  curl  to  pick  a  suitable  authentication method when  communicating  with the  given  proxy.  This  will  cause  an
                     extra request/response round-trip.

              proxy_basic
                     Tells curlftpfs to use HTTP Basic authentication when communicating with the given proxy. Basic is the default authentication
                     method curlftpfs is used with proxies.

              proxy_digest
                     Tells  curlftpfs to use HTTP Digest authentication when communicating with the given proxy.

              proxy_ntlm
                     Tells curlftpfs to use HTTP NTLM  authentication  when  communicating with the given proxy.

              proxy_user=<user:password>
                     Specify user and password to use for proxy authentication.

              skip_pasv_ip
                     Tell  curlftpfs to not use the IP address the server suggests in its response to curlftpfs's PASV command when curlftpfs con‐
                     nects the data connection.  Instead curlftpfs will re-use the same IP address it already uses for the control connection.

              socks4 Set the proxy type to SOCKS4.

              socks5 Set the proxy type to SOCKS5.

              ssl    Make curlftpfs use SSL/TLS for both control and data connections.

              sslv3  Forces curlftpfs to use SSL version 3 when negotiating with a remote SSL server.

              ssl_control
                     Make curlftpfs use SSL/TLS only for the control connection.

              ssl_try
                     Curlftpfs will try to use SSL/TLS for both the control and data connections but if the server doesn't  support  it,  it  will
                     still connect unencrypted.

              tcp_nodelay
                     Turn on the TCP_NODELAY option. See the curl_easy_setopt(3) man page for details about this option.

              tlsv1  (SSL) Forces curlftpfs to use TLS version 1 when negotiating with a remote TLS server.

              transform_symlinks
                     Append  path to the absolute symlinks so that they still point inside the ftp directory structure. Otherwise those links will
                     very probably be broken.

              user=<user:password>
                     Specify  user  and  password  to  use for server authentication.  Overrides netrc configuration.

              utf8   Try to transfer file list with UTF-8 encoding. Send OPTS UTF8 ON at the beginning of file list transfer.

FUSE OPTIONS
       -d     Enable FUSE debug output. Implies -f.

       -f     Run curlftpfs in foreground mode.

       -r     Mount read-only.

       -s     Disable multi-threaded operation.

       -o     Options are specified with a -o flag followed by a comma separated string of options.

              allow_other
                     Allow access to other users. By default the mount point is only accessible to the user that mounted it and not even to root.

              allow_root
                     Allow access to root user. By default the mount point is only accessible to the user that mounted it and not even to root.

              debug  enable debug output

              direct_io
                     use direct I/O

              fsname=NAME
                     set filesystem name in mtab

              gid=N  set file group

              hard_remove
                     immediate removal (don't hide files)

              kernel_cache
                     Let the kernel VFS do some caching of the files.

              large_read
                     issue large read requests (2.4 only)

              max_read=N
                     set maximum size of read requests

              nonempty
                     allow mounts over non-empty file/dir

              readdir_ino
                     try to fill in d_ino in readdir

              uid=N  set file owner

              umask=M
                     set file permissions (octal)

              use_ino
                     let filesystem set inode numbers

AUTHORS
       Robson Braga Araujo is the author and maintainer of CurlFtpFS.

WWW
       http://curlftpfs.sourceforge.net

SEE ALSO
       mount(8)

CurlFtpFS 0.9.2                                                     25 May 2007                                                       curlftpfs(1)
