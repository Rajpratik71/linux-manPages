ARIA2C(1)                                                              aria2                                                             ARIA2C(1)

NAME
       aria2c - The ultra fast download utility

SYNOPSIS
       aria2c [<OPTIONS>] [<URI>|<MAGNET>|<TORRENT_FILE>|<METALINK_FILE>] ...

DESCRIPTION
       aria2  is  a  utility for downloading files. The supported protocols are HTTP(S), FTP, SFTP, BitTorrent, and Metalink. aria2 can download a
       file from multiple sources/protocols and tries to utilize your maximum download bandwidth. It supports downloading a file from  HTTP(S)/FTP
       /SFTP  and BitTorrent at the same time, while the data downloaded from HTTP(S)/FTP/SFTP is uploaded to the BitTorrent swarm. Using Metalink
       chunk checksums, aria2 automatically validates chunks of data while downloading a file.

OPTIONS
       NOTE:
          Most FTP related options are applicable to SFTP as well.  Some options are not effective against SFTP (e.g., --ftp-pasv)

   Basic Options
       -d, --dir=<DIR>
              The directory to store the downloaded file.

       -i, --input-file=<FILE>
              Downloads the URIs listed in FILE. You can specify multiple sources for a single entity by putting multiple URIs on  a  single  line
              separated  by  the  TAB  character.  Additionally, options can be specified after each URI line. Option lines must start with one or
              more white space characters (SPACE or TAB) and must only contain one option per line.  Input files can use gzip  compression.   When
              FILE  is  specified  as  -,  aria2  will  read  the  input  from  stdin.   See  the Input File subsection for details.  See also the
              --deferred-input option.  See also the --save-session option.

       -l, --log=<LOG>
              The file name of the log file. If - is specified, log is written to stdout. If empty string("") is  specified,  or  this  option  is
              omitted, no log is written to disk at all.

       -j, --max-concurrent-downloads=<N>
              Set the maximum number of parallel downloads for every queue item.  See also the --split option.  Default: 5

              NOTE:
                 --max-concurrent-downloads limits the number of items which are downloaded concurrently.  --split and --min-split-size affect the
                 number of connections inside each item.  Imagine that you have an input file (see --input-file option) like this:

                     http://example.com/foo
                     http://example.com/bar

                 Here is 2 download items.  aria2 can download these  items  concurrently  if  the  value  more  than  or  equal  2  is  given  to
                 --max-concurrent-downloads.   In  each  download  item,  you  can  configure  the  number  of  connections  using  --split and/or
                 --min-split-size, etc.

       -V, --check-integrity [true|false]
              Check file integrity by validating piece hashes or a hash of entire file.  This option has effect only in BitTorrent, Metalink down‐
              loads  with checksums or HTTP(S)/FTP downloads with --checksum option.  If piece hashes are provided, this option can detect damaged
              portions of a file and re-download them.  If a hash of entire file is provided, hash check is only done when file has  been  already
              download.  This  is  determined by file length. If hash check fails, file is re-downloaded from scratch.  If both piece hashes and a
              hash of entire file are provided, only piece hashes are used. Default: false

       -c, --continue [true|false]
              Continue downloading a partially downloaded file.  Use this option to resume a download started by a web browser or another  program
              which downloads files sequentially from the beginning.  Currently this option is only applicable to HTTP(S)/FTP downloads.

       -h, --help[=<TAG>|<KEYWORD>]
              The  help  messages  are  classified with tags. A tag starts with #. For example, type --help=#http to get the usage for the options
              tagged with #http. If non-tag word is given, print the usage for the options whose  name  includes  that  word.   Available  Values:
              #basic,  #advanced, #http, #https, #ftp, #metalink, #bittorrent, #cookie, #hook, #file, #rpc, #checksum, #experimental, #deprecated,
              #help, #all Default: #basic

   HTTP/FTP/SFTP Options
       --all-proxy=<PROXY>
              Use a proxy server for all protocols.  To override a previously defined proxy, use "".  You also can override this setting and spec‐
              ify a proxy server for a particular protocol using --http-proxy, --https-proxy and --ftp-proxy options.  This affects all downloads.
              The format of PROXY is [http://][USER:PASSWORD@]HOST[:PORT].  See also ENVIRONMENT section.

              NOTE:
                 If user and password are embedded in proxy URI and they are also specified by --{http,https,ftp,all}-proxy-{user,passwd} options,
                 those  specified  later override prior options. For example, if you specified http-proxy-user=myname, http-proxy-passwd=mypass in
                 aria2.conf and you specified --http-proxy="http://proxy" on the command-line, then you'd get HTTP proxy  http://proxy  with  user
                 myname and password mypass.

                 Another   example:   if  you  specified  on  the  command-line  --http-proxy="http://user:pass@proxy"  --http-proxy-user="myname"
                 --http-proxy-passwd="mypass", then you'd get HTTP proxy http://proxy with user myname and password mypass.

                 One   more   example:   if   you    specified    in    command-line    --http-proxy-user="myname"    --http-proxy-passwd="mypass"
                 --http-proxy="http://user:pass@proxy", then you'd get HTTP proxy http://proxy with user user and password pass.

       --all-proxy-passwd=<PASSWD>
              Set password for --all-proxy option.

       --all-proxy-user=<USER>
              Set user for --all-proxy option.

       --checksum=<TYPE>=<DIGEST>
              Set checksum. TYPE is hash type. The supported hash type is listed in Hash Algorithms in aria2c -v. DIGEST is hex digest.  For exam‐
              ple, setting sha-1 digest looks like this: sha-1=0192ba11326fe2298c8cb4de616f4d4140213838 This option applies  only  to  HTTP(S)/FTP
              downloads.

       --connect-timeout=<SEC>
              Set  the  connect  timeout  in  seconds  to establish connection to HTTP/FTP/proxy server. After the connection is established, this
              option makes no effect and --timeout option is used instead.  Default: 60

       --dry-run [true|false]
              If true is given, aria2 just checks whether the remote file is available and doesn't  download  data.  This  option  has  effect  on
              HTTP/FTP download.  BitTorrent downloads are canceled if true is specified.  Default: false

       --lowest-speed-limit=<SPEED>
              Close  connection if download speed is lower than or equal to this value(bytes per sec).  0 means aria2 does not have a lowest speed
              limit.  You can append K or M (1K = 1024, 1M = 1024K).  This option does not affect BitTorrent downloads.  Default: 0

       -x, --max-connection-per-server=<NUM>
              The maximum number of connections to one server for each download.  Default: 1

       --max-file-not-found=<NUM>
              If aria2 receives "file not found" status from the remote HTTP/FTP servers NUM times without getting a single byte, then  force  the
              download to fail. Specify 0 to disable this option. This options is effective only when using HTTP/FTP servers.  The number of retry
              attempt is counted toward --max-tries, so it should be configured too.

              Default: 0

       -m, --max-tries=<N>
              Set number of tries. 0 means unlimited.  See also --retry-wait.  Default: 5

       -k, --min-split-size=<SIZE>
              aria2 does not split less than 2*SIZE byte range.  For example, let's consider downloading 20MiB file. If SIZE  is  10M,  aria2  can
              split  file  into  2 range [0-10MiB) and [10MiB-20MiB) and download it using 2 sources(if --split >= 2, of course).  If SIZE is 15M,
              since 2*15M > 20MiB, aria2 does not split file and download it using 1 source.  You can append K or M (1K = 1024, 1M = 1024K).  Pos‐
              sible Values: 1M -1024M Default: 20M

       --netrc-path=<FILE>
              Specify the path to the netrc file.  Default: $(HOME)/.netrc

              NOTE:
                 Permission of the .netrc file must be 600.  Otherwise, the file will be ignored.

       -n, --no-netrc [true|false]
              Disables netrc support. netrc support is enabled by default.

              NOTE:
                 netrc  file  is  only read at the startup if --no-netrc is false.  So if --no-netrc is true at the startup, no netrc is available
                 throughout the session.  You cannot get netrc enabled even if you send --no-netrc=false using aria2.changeGlobalOption().

       --no-proxy=<DOMAINS>
              Specify a comma separated list of host names, domains and network addresses with or without a subnet mask where no proxy  should  be
              used.

              NOTE:
                 For  network  addresses  with  a subnet mask, both IPv4 and IPv6 addresses work.  The current implementation does not resolve the
                 host name in an URI to compare network addresses specified in --no-proxy.  So  it  is  only  effective  if  URI  has  numeric  IP
                 addresses.

       -o, --out=<FILE>
              The  file  name  of the downloaded file.  It is always relative to the directory given in --dir option.  When the --force-sequential
              option is used, this option is ignored.

              NOTE:
                 You cannot specify a file name for Metalink or BitTorrent downloads.  The file name specified here is only used when the URIs fed
                 to aria2 are given on the command line directly, but not when using --input-file, --force-sequential option.

                 Example:

                     $ aria2c -o myfile.zip "http://mirror1/file.zip" "http://mirror2/file.zip"

       --proxy-method=<METHOD>
              Set  the  method  to  use  in  proxy  request.  METHOD is either get or tunnel. HTTPS downloads always use tunnel regardless of this
              option.  Default: get

       -R, --remote-time [true|false]
              Retrieve timestamp of the remote file from the remote HTTP/FTP server and if it is available, apply it to the local file.   Default:
              false

       --reuse-uri [true|false]
              Reuse already used URIs if no unused URIs are left.  Default: true

       --retry-wait=<SEC>
              Set  the  seconds  to  wait  between  retries. When SEC > 0, aria2 will retry downloads when the HTTP server returns a 503 response.
              Default: 0

       --server-stat-of=<FILE>
              Specify the file name to which performance profile of the servers is saved. You can load saved data using  --server-stat-if  option.
              See Server Performance Profile subsection below for file format.

       --server-stat-if=<FILE>
              Specify  the  file  name to load performance profile of the servers. The loaded data will be used in some URI selector such as feed‐
              back.  See also --uri-selector option. See Server Performance Profile subsection below for file format.

       --server-stat-timeout=<SEC>
              Specifies timeout in seconds to invalidate performance profile of the servers since  the  last  contact  to  them.   Default:  86400
              (24hours)

       -s, --split=<N>
              Download  a  file using N connections.  If more than N URIs are given, first N URIs are used and remaining URIs are used for backup.
              If less than N URIs are given, those URIs are used more than once so that N connections total are made simultaneously.   The  number
              of  connections  to  the  same  host is restricted by the --max-connection-per-server option.  See also the --min-split-size option.
              Default: 5

              NOTE:
                 Some Metalinks regulate the number of servers to connect.  aria2 strictly respects them.  This means that if Metalink defines the
                 maxconnections attribute lower than N, then aria2 uses the value of this lower value instead of N.

       --stream-piece-selector=<SELECTOR>
              Specify  piece  selection  algorithm  used in HTTP/FTP download. Piece means fixed length segment which is downloaded in parallel in
              segmented download. If default is given, aria2 selects piece so that it reduces the number of establishing connection. This is  rea‐
              sonable  default behavior because establishing connection is an expensive operation.  If inorder is given, aria2 selects piece which
              has  minimum  index.  Index=0  means  first  of  the  file.  This  will  be   useful   to   view   movie   while   downloading   it.
              --enable-http-pipelining  option  may  be  useful  to reduce re-connection overhead.  Please note that aria2 honors --min-split-size
              option, so it will be necessary to specify a reasonable value to --min-split-size option.  If random is given, aria2  selects  piece
              randomly.  Like inorder, --min-split-size option is honored.  If geom is given, at the beginning aria2 selects piece which has mini‐
              mum index like inorder, but it exponentially increasingly keeps space from previously selected piece. This will reduce the number of
              establishing  connection  and  at  the  same time it will download the beginning part of the file first. This will be useful to view
              movie while downloading it.  Default: default

       -t, --timeout=<SEC>
              Set timeout in seconds.  Default: 60

       --uri-selector=<SELECTOR>
              Specify URI selection algorithm. The possible values are inorder, feedback and adaptive.  If inorder is given, URI is tried  in  the
              order  appeared  in  the  URI  list.   If feedback is given, aria2 uses download speed observed in the previous downloads and choose
              fastest server in the URI list. This also effectively skips dead mirrors. The observed download speed is a part of performance  pro‐
              file  of  servers mentioned in --server-stat-of and --server-stat-if options.  If adaptive is given, selects one of the best mirrors
              for the first and reserved connections.  For supplementary ones, it returns mirrors which has not been tested yet, and  if  each  of
              them has already been tested, returns mirrors which has to be tested again. Otherwise, it doesn't select anymore mirrors. Like feed‐
              back, it uses a performance profile of servers.  Default: feedback

   HTTP Specific Options
       --ca-certificate=<FILE>
              Use the certificate authorities in FILE to verify the peers.  The certificate file must be in PEM format and can contain multiple CA
              certificates.  Use --check-certificate option to enable verification.

              NOTE:
                 If  you  build with OpenSSL or the recent version of GnuTLS which has gnutls_certificate_set_x509_system_trust() function and the
                 library is properly configured to locate the system-wide CA certificates store, aria2 will automatically load those  certificates
                 at the startup.

              NOTE:
                 WinTLS and AppleTLS do not support this option. Instead you will have to import the certificate into the OS trust store.

       --certificate=<FILE>
              Use the client certificate in FILE. The certificate must be either in PKCS12 (.p12, .pfx) or in PEM format.

              PKCS12  files  must contain the certificate, a key and optionally a chain of additional certificates. Only PKCS12 files with a blank
              import password can be opened!

              When using PEM, you have to specify the private key via --private-key as well.

              NOTE:
                 WinTLS does not support PEM files at the moment. Users have to use PKCS12 files.

              NOTE:
                 AppleTLS users should use the KeyChain Access utility to import the client certificate and get the  SHA-1  fingerprint  from  the
                 Information dialog corresponding to that certificate.  To start aria2c use --certificate=<SHA-1>.  Alternatively PKCS12 files are
                 also supported. PEM files, however, are not supported.

       --check-certificate [true|false]
              Verify the peer using certificates specified in --ca-certificate option.  Default: true

       --http-accept-gzip [true|false]
              Send Accept: deflate, gzip request header and inflate response if  remote  server  responds  with  Content-Encoding:  gzip  or  Con‐
              tent-Encoding: deflate.  Default: false

              NOTE:
                 Some  server  responds  with Content-Encoding: gzip for files which itself is gzipped file. aria2 inflates them anyway because of
                 the response header.

       --http-auth-challenge [true|false]
              Send HTTP authorization header only when it is requested by the server. If false is set, then authorization header is always sent to
              the server.  There is an exception: if user name and password are embedded in URI, authorization header is always sent to the server
              regardless of this option.  Default: false

       --http-no-cache [true|false]
              Send Cache-Control: no-cache and Pragma: no-cache header to avoid cached content.  If false is given, these headers are not sent and
              you can add Cache-Control header with a directive you like using --header option. Default: false

       --http-user=<USER>
              Set HTTP user. This affects all URIs.

       --http-passwd=<PASSWD>
              Set HTTP password. This affects all URIs.

       --http-proxy=<PROXY>
              Use  a  proxy  server for HTTP.  To override a previously defined proxy, use "".  See also the --all-proxy option.  This affects all
              http downloads.  The format of PROXY is [http://][USER:PASSWORD@]HOST[:PORT]

       --http-proxy-passwd=<PASSWD>
              Set password for --http-proxy.

       --http-proxy-user=<USER>
              Set user for --http-proxy.

       --https-proxy=<PROXY>
              Use a proxy server for HTTPS. To override a previously defined proxy, use "".  See also the --all-proxy option.   This  affects  all
              https download.  The format of PROXY is [http://][USER:PASSWORD@]HOST[:PORT]

       --https-proxy-passwd=<PASSWD>
              Set password for --https-proxy.

       --https-proxy-user=<USER>
              Set user for --https-proxy.

       --private-key=<FILE>
              Use  the  private  key  in  FILE.  The private key must be decrypted and in PEM format.  The behavior when encrypted one is given is
              undefined.  See also --certificate option.

       --referer=<REFERER>
              Set an http referrer (Referer). This affects all http/https downloads.  If * is given, the download URI is also used as  the  refer‐
              rer.  This may be useful when used together with the --parameterized-uri option.

       --enable-http-keep-alive [true|false]
              Enable HTTP/1.1 persistent connection.  Default: true

       --enable-http-pipelining [true|false]
              Enable HTTP/1.1 pipelining.  Default: false

              NOTE:
                 In performance perspective, there is usually no advantage to enable this option.

       --header=<HEADER>
              Append HEADER to HTTP request header.  You can use this option repeatedly to specify more than one header:

                 $ aria2c --header="X-A: b78" --header="X-B: 9J1" "http://host/file"

       --load-cookies=<FILE>
              Load  Cookies  from FILE using the Firefox3 format (SQLite3), Chromium/Google Chrome (SQLite3) and the Mozilla/Firefox(1.x/2.x)/Net‐
              scape format.

              NOTE:
                 If aria2 is built without libsqlite3, then it doesn't support Firefox3 and Chromium/Google Chrome cookie format.

       --save-cookies=<FILE>
              Save Cookies to FILE in Mozilla/Firefox(1.x/2.x)/ Netscape format. If FILE already exists, it is overwritten.  Session  Cookies  are
              also saved and their expiry values are treated as 0.  Possible Values: /path/to/file

       --use-head [true|false]
              Use HEAD method for the first request to the HTTP server.  Default: false

       -U, --user-agent=<USER_AGENT>
              Set user agent for HTTP(S) downloads.  Default: aria2/$VERSION, $VERSION is replaced by package version.

   FTP/SFTP Specific Options
       --ftp-user=<USER>
              Set FTP user. This affects all URIs.  Default: anonymous

       --ftp-passwd=<PASSWD>
              Set  FTP  password. This affects all URIs.  If user name is embedded but password is missing in URI, aria2 tries to resolve password
              using .netrc. If password is found in .netrc, then use it as password. If not, use the password specified in this option.   Default:
              ARIA2USER@

       -p, --ftp-pasv [true|false]
              Use the passive mode in FTP.  If false is given, the active mode will be used.  Default: true

              NOTE:
                 This option is ignored for SFTP transfer.

       --ftp-proxy=<PROXY>
              Use a proxy server for FTP.  To override a previously defined proxy, use "".  See also the --all-proxy option.  This affects all ftp
              downloads.  The format of PROXY is [http://][USER:PASSWORD@]HOST[:PORT]

       --ftp-proxy-passwd=<PASSWD>
              Set password for --ftp-proxy option.

       --ftp-proxy-user=<USER>
              Set user for --ftp-proxy option.

       --ftp-type=<TYPE>
              Set FTP transfer type. TYPE is either binary or ascii.  Default: binary

              NOTE:
                 This option is ignored for SFTP transfer.

       --ftp-reuse-connection [true|false]
              Reuse connection in FTP.  Default: true

       --ssh-host-key-md=<TYPE>=<DIGEST>
              Set checksum for SSH host public key. TYPE is hash type. The supported hash type is sha-1 or md5. DIGEST is hex digest. For example:
              sha-1=b030503d4de4539dc7885e6f0f5e256704edf4c3.   This option can be used to validate server's public key when SFTP is used. If this
              option is not set, which is default, no validation takes place.

   BitTorrent/Metalink Options
       --select-file=<INDEX>...
              Set file to download by specifying its index.  You can find the file index using the --show-files option.  Multiple indexes  can  be
              specified  by  using ,, for example: 3,6.  You can also use - to specify a range: 1-5.  , and - can be used together: 1-5,8,9.  When
              used with the -M option, index may vary depending on the query (see --metalink-* options).

              NOTE:
                 In multi file torrent, the adjacent files specified by this option may also be downloaded. This is by design, not a bug.  A  sin‐
                 gle piece may include several files or part of files, and aria2 writes the piece to the appropriate files.

       -S, --show-files [true|false]
              Print file listing of ".torrent", ".meta4" and ".metalink" file and exit.  In case of ".torrent" file, additional information (info‐
              hash, piece length, etc) is also printed.

   BitTorrent Specific Options
       --bt-detach-seed-only [true|false]
              Exclude seed only downloads when counting concurrent active downloads (See -j option).  This means that if -j3  is  given  and  this
              option  is  turned  on  and 3 downloads are active and one of those enters seed mode, then it is excluded from active download count
              (thus it becomes 2), and the next download waiting in queue gets started. But be aware that seeding  item  is  still  recognized  as
              active download in RPC method.  Default: false

       --bt-enable-hook-after-hash-check [true|false]
              Allow  hook  command  invocation  after hash check (see -V option) in BitTorrent download. By default, when hash check succeeds, the
              command given by --on-bt-download-complete is executed. To disable this action, give false to this option.  Default: true

       --bt-enable-lpd [true|false]
              Enable Local Peer Discovery.  If a private flag is set in a torrent, aria2 doesn't use this feature for that download even  if  true
              is given.  Default: false

       --bt-exclude-tracker=<URI>[,...]
              Comma  separated  list  of  BitTorrent  tracker's  announce  URI to remove. You can use special value * which matches all URIs, thus
              removes all announce URIs. When specifying * in shell command-line, don't forget to escape  or  quote  it.   See  also  --bt-tracker
              option.

       --bt-external-ip=<IPADDRESS>
              Specify  the  external IP address to use in BitTorrent download and DHT.  It may be sent to BitTorrent tracker. For DHT, this option
              should be set to report that local node is downloading a particular torrent.  This is critical to use  DHT  in  a  private  network.
              Although this function is named external, it can accept any kind of IP addresses.

       --bt-force-encryption [true|false]
              Requires  BitTorrent  message  payload encryption with arc4.  This is a shorthand of --bt-require-crypto --bt-min-crypto-level=arc4.
              This option does not change the option value of those options.  If true is given, deny legacy  BitTorrent  handshake  and  only  use
              Obfuscation handshake and always encrypt message payload.  Default: false

       --bt-hash-check-seed [true|false]
              If  true is given, after hash check using --check-integrity option and file is complete, continue to seed file. If you want to check
              file and download it only when it is damaged or incomplete, set this option to false.  This option has  effect  only  on  BitTorrent
              download.  Default: true

       --bt-load-saved-metadata [true|false]
              Before  getting  torrent  metadata  from  DHT  when downloading with magnet link, first try to read file saved by --bt-save-metadata
              option.  If it is successful, then skip downloading metadata from DHT.  Default: false

       --bt-lpd-interface=<INTERFACE>
              Use given interface for Local Peer Discovery. If this option is not specified, the default interface  is  chosen.  You  can  specify
              interface name and IP address.  Possible Values: interface, IP address

       --bt-max-open-files=<NUM>
              Specify maximum number of files to open in multi-file BitTorrent/Metalink download globally.  Default: 100

       --bt-max-peers=<NUM>
              Specify the maximum number of peers per torrent.  0 means unlimited.  See also --bt-request-peer-speed-limit option.  Default: 55

       --bt-metadata-only [true|false]
              Download meta data only. The file(s) described in meta data will not be downloaded. This option has effect only when BitTorrent Mag‐
              net URI is used. See also --bt-save-metadata option.  Default: false

       --bt-min-crypto-level=plain|arc4
              Set minimum level of encryption method.  If several encryption methods are provided by a peer, aria2 chooses the  lowest  one  which
              satisfies the given level.  Default: plain

       --bt-prioritize-piece=head[=<SIZE>],tail[=<SIZE>]
              Try  to download first and last pieces of each file first. This is useful for previewing files. The argument can contain 2 keywords:
              head and tail. To include both keywords, they must be separated by comma. These keywords can take one parameter, SIZE. For  example,
              if  head=<SIZE> is specified, pieces in the range of first SIZE bytes of each file get higher priority.  tail=<SIZE> means the range
              of last SIZE bytes of each file. SIZE can include K or M (1K = 1024, 1M = 1024K). If SIZE is omitted, SIZE=1M is used.

       --bt-remove-unselected-file [true|false]
              Removes the unselected files when download is completed in BitTorrent. To select files, use --select-file option. If it is not used,
              all  files  are  assumed  to  be  selected.  Please  use this option with care because it will actually remove files from your disk.
              Default: false

       --bt-require-crypto [true|false]
              If true is given, aria2 doesn't accept and establish connection with  legacy  BitTorrent  handshake(\19BitTorrent  protocol).   Thus
              aria2 always uses Obfuscation handshake.  Default: false

       --bt-request-peer-speed-limit=<SPEED>
              If  the  whole  download speed of every torrent is lower than SPEED, aria2 temporarily increases the number of peers to try for more
              download speed. Configuring this option with your preferred download speed can increase your download speed in some cases.  You  can
              append K or M (1K = 1024, 1M = 1024K).  Default: 50K

       --bt-save-metadata [true|false]
              Save  meta  data  as  ".torrent" file. This option has effect only when BitTorrent Magnet URI is used.  The file name is hex encoded
              info hash with suffix ".torrent". The directory to be saved is the same directory where download file is saved.  If  the  same  file
              already exists, meta data is not saved. See also --bt-metadata-only option. Default: false

       --bt-seed-unverified [true|false]
              Seed previously downloaded files without verifying piece hashes.  Default: false

       --bt-stop-timeout=<SEC>
              Stop BitTorrent download if download speed is 0 in consecutive SEC seconds. If 0 is given, this feature is disabled.  Default: 0

       --bt-tracker=<URI>[,...]
              Comma  separated  list  of  additional BitTorrent tracker's announce URI. These URIs are not affected by --bt-exclude-tracker option
              because they are added after URIs in --bt-exclude-tracker option are removed.

       --bt-tracker-connect-timeout=<SEC>
              Set the connect timeout in seconds to establish connection to tracker. After the connection is established,  this  option  makes  no
              effect and --bt-tracker-timeout option is used instead.  Default: 60

       --bt-tracker-interval=<SEC>
              Set  the  interval  in seconds between tracker requests. This completely overrides interval value and aria2 just uses this value and
              ignores the min interval and interval value in the response of tracker. If 0 is set, aria2 determines interval based on the response
              of tracker and the download progress.  Default: 0

       --bt-tracker-timeout=<SEC>
              Set timeout in seconds. Default: 60

       --dht-entry-point=<HOST>:<PORT>
              Set host and port as an entry point to IPv4 DHT network.

       --dht-entry-point6=<HOST>:<PORT>
              Set host and port as an entry point to IPv6 DHT network.

       --dht-file-path=<PATH>
              Change the IPv4 DHT routing table file to PATH.  Default: $HOME/.aria2/dht.dat if present, otherwise $XDG_CACHE_HOME/aria2/dht.dat.

       --dht-file-path6=<PATH>
              Change    the    IPv6    DHT    routing    table   file   to   PATH.    Default:   $HOME/.aria2/dht6.dat   if   present,   otherwise
              $XDG_CACHE_HOME/aria2/dht6.dat.

       --dht-listen-addr6=<ADDR>
              Specify address to bind socket for IPv6 DHT.  It should be a global unicast IPv6 address of the host.

       --dht-listen-port=<PORT>...
              Set UDP listening port used by DHT(IPv4, IPv6) and UDP tracker.  Multiple ports can be specified by using ,, for example: 6881,6885.
              You can also use - to specify a range: 6881-6999. , and - can be used together.  Default: 6881-6999

              NOTE:
                 Make sure that the specified ports are open for incoming UDP traffic.

       --dht-message-timeout=<SEC>
              Set timeout in seconds. Default: 10

       --enable-dht [true|false]
              Enable IPv4 DHT functionality. It also enables UDP tracker support. If a private flag is set in a torrent, aria2 doesn't use DHT for
              that download even if true is given.  Default: true

       --enable-dht6 [true|false]
              Enable IPv6 DHT functionality. If a private flag is set in a torrent, aria2 doesn't use DHT for that download even if true is given.
              Use --dht-listen-port option to specify port number to listen on. See also --dht-listen-addr6 option.

       --enable-peer-exchange [true|false]
              Enable  Peer  Exchange  extension. If a private flag is set in a torrent, this feature is disabled for that download even if true is
              given.  Default: true

       --follow-torrent=true|false|mem
              If true or mem is specified, when a file whose suffix is .torrent or content type is application/x-bittorrent is  downloaded,  aria2
              parses  it  as  a torrent file and downloads files mentioned in it.  If mem is specified, a torrent file is not written to the disk,
              but is just kept in memory.  If false is specified, the .torrent file is downloaded to the disk, but is not parsed as a torrent  and
              its contents are not downloaded.  Default: true

       -O, --index-out=<INDEX>=<PATH>
              Set  file path for file with index=INDEX. You can find the file index using the --show-files option.  PATH is a relative path to the
              path specified in --dir option. You can use this option multiple times. Using this option, you can specify the output file names  of
              BitTorrent downloads.

       --listen-port=<PORT>...
              Set  TCP  port  number for BitTorrent downloads.  Multiple ports can be specified by using ,,  for example: 6881,6885.  You can also
              use - to specify a range: 6881-6999.  , and - can be used together: 6881-6889,6999.  Default: 6881-6999

              NOTE:
                 Make sure that the specified ports are open for incoming TCP traffic.

       --max-overall-upload-limit=<SPEED>
              Set max overall upload speed in bytes/sec.  0 means unrestricted.  You can append K or M (1K = 1024, 1M  =  1024K).   To  limit  the
              upload speed per torrent, use --max-upload-limit option.  Default: 0

       -u, --max-upload-limit=<SPEED>
              Set max upload speed per each torrent in bytes/sec.  0 means unrestricted.  You can append K or M (1K = 1024, 1M = 1024K).  To limit
              the overall upload speed, use --max-overall-upload-limit option.  Default: 0

       --peer-id-prefix=<PEER_ID_PREFIX>
              Specify the prefix of peer ID. The peer ID in BitTorrent is 20 byte length. If more than 20 bytes are specified, only first 20 bytes
              are used. If less than 20 bytes are specified, random byte data are added to make its length 20 bytes.

              Default:  A2-$MAJOR-$MINOR-$PATCH-,  $MAJOR,  $MINOR  and $PATCH are replaced by major, minor and patch version number respectively.
              For instance, aria2 version 1.18.8 has prefix ID A2-1-18-8-.

       --peer-agent=<PEER_AGENT>
              Specify the string used during the bitorrent extended handshake for the peer's client version.

              Default: aria2/$MAJOR.$MINOR.$PATCH, $MAJOR, $MINOR and $PATCH are replaced by major, minor and patch version  number  respectively.
              For instance, aria2 version 1.18.8 has peer agent aria2/1.18.8.

       --seed-ratio=<RATIO>
              Specify share ratio. Seed completed torrents until share ratio reaches RATIO.  You are strongly encouraged to specify equals or more
              than 1.0 here.  Specify 0.0 if you intend to do seeding regardless of share ratio.  If --seed-time option is  specified  along  with
              this option, seeding ends when at least one of the conditions is satisfied.  Default: 1.0

       --seed-time=<MINUTES>
              Specify seeding time in (fractional) minutes. Also see the --seed-ratio option.

              NOTE:
                 Specifying --seed-time=0 disables seeding after download completed.

       -T, --torrent-file=<TORRENT_FILE>
              The  path  to  the  ".torrent"  file.   You  are  not  required  to use this option because you can specify ".torrent" files without
              --torrent-file.

   Metalink Specific Options
       --follow-metalink=true|false|mem
              If true or mem is specified, when a file whose suffix is .meta4 or .metalink or content type of application/metalink4+xml or  appli‐
              cation/metalink+xml  is  downloaded, aria2 parses it as a metalink file and downloads files mentioned in it.  If mem is specified, a
              metalink file is not written to the disk, but is just kept in memory.  If false is specified, the .metalink file  is  downloaded  to
              the disk, but is not parsed as a metalink file and its contents are not downloaded.  Default: true

       --metalink-base-uri=<URI>
              Specify  base  URI  to resolve relative URI in metalink:url and metalink:metaurl element in a metalink file stored in local disk. If
              URI points to a directory, URI must end with /.

       -M, --metalink-file=<METALINK_FILE>
              The file path to ".meta4" and ".metalink" file. Reads input from stdin when - is specified.  You are not required to use this option
              because you can specify ".metalink" files without --metalink-file.

       --metalink-language=<LANGUAGE>
              The language of the file to download.

       --metalink-location=<LOCATION>[,...]
              The location of the preferred server.  A comma-delimited list of locations is acceptable, for example, jp,us.

       --metalink-os=<OS>
              The operating system of the file to download.

       --metalink-version=<VERSION>
              The version of the file to download.

       --metalink-preferred-protocol=<PROTO>
              Specify  preferred  protocol.   The  possible values are http, https, ftp and none.  Specify none to disable this feature.  Default:
              none

       --metalink-enable-unique-protocol [true|false]
              If true is given  and  several  protocols  are  available  for  a  mirror  in  a  metalink  file,  aria2  uses  one  of  them.   Use
              --metalink-preferred-protocol option to specify the preference of protocol.  Default: true

   RPC Options
       --enable-rpc [true|false]
              Enable  JSON-RPC/XML-RPC  server.  It is strongly recommended to set secret authorization token using --rpc-secret option.  See also
              --rpc-listen-port option.  Default: false

       --pause [true|false]
              Pause download after added. This option is effective only when --enable-rpc=true is given.  Default: false

       --pause-metadata [true|false]
              Pause downloads created as a result of metadata download. There are 3 types of metadata downloads in aria2: (1) downloading .torrent
              file.  (2)  downloading  torrent  metadata using magnet link. (3) downloading metalink file.  These metadata downloads will generate
              downloads using their metadata. This option pauses these subsequent downloads. This option is effective only when  --enable-rpc=true
              is given.  Default: false

       --rpc-allow-origin-all [true|false]
              Add Access-Control-Allow-Origin header field with value * to the RPC response.  Default: false

       --rpc-certificate=<FILE>
              Use the certificate in FILE for RPC server. The certificate must be either in PKCS12 (.p12, .pfx) or in PEM format.

              PKCS12  files  must contain the certificate, a key and optionally a chain of additional certificates. Only PKCS12 files with a blank
              import password can be opened!

              When using PEM, you have to specify the private key via --rpc-private-key as well. Use --rpc-secure option to enable encryption.

              NOTE:
                 WinTLS does not support PEM files at the moment. Users have to use PKCS12 files.

              NOTE:
                 AppleTLS users should use the KeyChain Access utility to first generate a self-signed SSL-Server certificate, e.g. using the wiz‐
                 ard,  and  get  the  SHA-1  fingerprint  from the Information dialog corresponding to that new certificate.  To start aria2c with
                 --rpc-secure use --rpc-certificate=<SHA-1>.  Alternatively PKCS12 files are also supported. PEM  files,  however,  are  not  sup‐
                 ported.

       --rpc-listen-all [true|false]
              Listen  incoming  JSON-RPC/XML-RPC  requests  on all network interfaces. If false is given, listen only on local loopback interface.
              Default: false

       --rpc-listen-port=<PORT>
              Specify a port number for JSON-RPC/XML-RPC server to listen to.  Possible Values: 1024 -65535 Default: 6800

       --rpc-max-request-size=<SIZE>
              Set max size of JSON-RPC/XML-RPC request. If aria2 detects the request is more than SIZE bytes, it drops connection. Default: 2M

       --rpc-passwd=<PASSWD>
              Set JSON-RPC/XML-RPC password.

              WARNING:
                 --rpc-passwd option will be deprecated in the future release. Migrate to --rpc-secret option as soon as possible.

       --rpc-private-key=<FILE>
              Use the private key in FILE for RPC server.  The private key must be decrypted and in PEM format. Use --rpc-secure option to  enable
              encryption. See also --rpc-certificate option.

       --rpc-save-upload-metadata [true|false]
              Save the uploaded torrent or metalink meta data in the directory specified by --dir option. The file name consists of SHA-1 hash hex
              string of meta data plus extension. For torrent, the extension is '.torrent'. For metalink, it is '.meta4'.  If false  is  given  to
              this  option,  the downloads added by aria2.addTorrent() or aria2.addMetalink() will not be saved by --save-session option. Default:
              true

       --rpc-secret=<TOKEN>
              Set RPC secret authorization token. Read RPC authorization secret token to know how this option value is used.

       --rpc-secure [true|false]
              RPC transport will be encrypted by SSL/TLS.  The RPC clients must use https scheme to access the server. For WebSocket  client,  use
              wss scheme. Use --rpc-certificate and --rpc-private-key options to specify the server certificate and private key.

       --rpc-user=<USER>
              Set JSON-RPC/XML-RPC user.

              WARNING:
                 --rpc-user option will be deprecated in the future release. Migrate to --rpc-secret option as soon as possible.

   Advanced Options
       --allow-overwrite [true|false]
              Restart  download  from  scratch  if  the corresponding control file doesn't exist.  See also --auto-file-renaming option.  Default:
              false

       --allow-piece-length-change [true|false]
              If false is given, aria2 aborts download when a piece length is different from one in a control file.  If true  is  given,  you  can
              proceed but some download progress will be lost.  Default: false

       --always-resume [true|false]
              Always  resume download. If true is given, aria2 always tries to resume download and if resume is not possible, aborts download.  If
              false is given, when all given URIs do not support resume or aria2 encounters N URIs which does not support resume (N is  the  value
              specified  using  --max-resume-failure-tries  option),  aria2  downloads  file from scratch.  See --max-resume-failure-tries option.
              Default: true

       --async-dns [true|false]
              Enable asynchronous DNS.  Default: true

       --async-dns-server=<IPADDRESS>[,...]
              Comma separated list of DNS server address used in asynchronous DNS resolver. Usually asynchronous DNS  resolver  reads  DNS  server
              addresses  from  /etc/resolv.conf.  When  this  option  is  used,  it  uses  DNS servers specified in this option instead of ones in
              /etc/resolv.conf. You can specify both IPv4 and IPv6 address. This option is useful when the system does not  have  /etc/resolv.conf
              and user does not have the permission to create it.

       --auto-file-renaming [true|false]
              Rename  file name if the same file already exists.  This option works only in HTTP(S)/FTP download.  The new file name has a dot and
              a number(1..9999) appended after the name, but before the file extension, if any.  Default: true

       --auto-save-interval=<SEC>
              Save a control file(*.aria2) every SEC seconds.  If 0 is given, a control file is not saved during download. aria2 saves  a  control
              file when it stops regardless of the value.  The possible values are between 0 to 600.  Default: 60

       --conditional-get [true|false]
              Download file only when the local file is older than remote file. This function only works with HTTP(S) downloads only.  It does not
              work if file size is specified in Metalink. It also ignores Content-Disposition header.  If a control file exists, this option  will
              be  ignored.   This  function  uses If-Modified-Since header to get only newer file conditionally. When getting modification time of
              local file, it uses user supplied file name (see --out option) or file name part in URI if --out is  not  specified.   To  overwrite
              existing file, --allow-overwrite is required.  Default: false

       --conf-path=<PATH>
              Change   the   configuration   file   path   to   PATH.    Default:   $HOME/.aria2/aria2.conf   if   present,   otherwise  $XDG_CON‐
              FIG_HOME/aria2/aria2.conf.

       --console-log-level=<LEVEL>
              Set log level to output to console.  LEVEL is either debug, info, notice, warn or error.  Default: notice

       --content-disposition-default-utf8 [true|false]
              Handle quoted string in Content-Disposition header as UTF-8 instead of ISO-8859-1, for example, the filename parameter, but not  the
              extended version filename*.  Default: false

       -D, --daemon [true|false]
              Run  as  daemon.  The  current working directory will be changed to / and standard input, standard output and standard error will be
              redirected to /dev/null. Default: false

       --deferred-input [true|false]
              If true is given, aria2 does not read all URIs and options from file specified by --input-file option at startup, but it  reads  one
              by one when it needs later. This may reduce memory usage if input file contains a lot of URIs to download.  If false is given, aria2
              reads all URIs and options at startup.  Default: false

              WARNING:
                 --deferred-input option will be disabled when --save-session is used together.

       --disable-ipv6 [true|false]
              Disable IPv6. This is useful if you have to use broken DNS and want to avoid terribly slow AAAA record lookup. Default: false

       --disk-cache=<SIZE>
              Enable disk cache. If SIZE is 0, the disk cache is disabled. This feature caches the downloaded data in memory, which  grows  to  at
              most SIZE bytes. The cache storage is created for aria2 instance and shared by all downloads. The one advantage of the disk cache is
              reduce the disk I/O because the data are written in larger unit and it is reordered by the offset of the file.  If hash checking  is
              involved  and  the  data  are  cached in memory, we don't need to read them from the disk.  SIZE can include K or M (1K = 1024, 1M =
              1024K). Default: 16M

       --download-result=<OPT>
              This option changes the way Download Results is formatted. If OPT  is  default,  print  GID,  status,  average  download  speed  and
              path/URI.  If  multiple  files  are involved, path/URI of first requested file is printed and remaining ones are omitted.  If OPT is
              full, print GID, status, average download speed, percentage of progress and path/URI. The percentage of progress  and  path/URI  are
              printed for each requested file in each row.  If OPT is hide, Download Results is hidden.  Default: default

       --dscp=<DSCP>
              Set  DSCP value in outgoing IP packets of BitTorrent traffic for QoS. This parameter sets only DSCP bits in TOS field of IP packets,
              not the whole field. If you take values from /usr/include/netinet/ip.h divide them by 4 (otherwise values would be  incorrect,  e.g.
              your  CS1  class  would  turn into CS4). If you take commonly used values from RFC, network vendors' documentation, Wikipedia or any
              other source, use them as they are.

       --rlimit-nofile=<NUM>
              Set the soft limit of open file descriptors.  This open will only have effect when:

                 a. The system supports it (posix)

                 b. The limit does not exceed the hard limit.

                 c. The specified limit is larger than the current soft limit.

              This is equivalent to setting nofile via ulimit, except that it will never decrease the limit.

              This option is only available on systems supporting the rlimit API.

       --enable-color [true|false]
              Enable color output for a terminal.  Default: true

       --enable-mmap [true|false]
              Map files into memory. This option may not work if the file space is not pre-allocated. See --file-allocation.

              Default: false

       --event-poll=<POLL>
              Specify the method for polling events.  The possible values are epoll, kqueue, port, poll and select.  For each epoll, kqueue,  port
              and  poll,  it  is available if system supports it.  epoll is available on recent Linux. kqueue is available on various *BSD systems
              including Mac OS X. port is available on Open Solaris. The default value may vary depending on the system you use.

       --file-allocation=<METHOD>
              Specify file allocation method.  none doesn't pre-allocate file space. prealloc pre-allocates file  space  before  download  begins.
              This may take some time depending on the size of the file.  If you are using newer file systems such as ext4 (with extents support),
              btrfs, xfs or NTFS(MinGW build only), falloc is your best choice. It allocates large(few GiB) files almost instantly. Don't use fal‐
              loc with legacy file systems such as ext3 and FAT32 because it takes almost same time as prealloc and it blocks aria2 entirely until
              allocation finishes. falloc may not be available if your system doesn't have posix_fallocate(3) function.  trunc  uses  ftruncate(2)
              system call or platform-specific counterpart to truncate a file to a specified length.

              Possible Values: none, prealloc, trunc, falloc Default: prealloc

              WARNING:
                 Using  trunc  seemingly allocates disk space very quickly, but what it actually does is that it sets file length metadata in file
                 system, and does not allocate disk space at all.  This means that it does not help avoiding fragmentation.

              NOTE:
                 In multi file torrent downloads, the files adjacent forward to the specified files are also allocated  if  they  share  the  same
                 piece.

       --force-save [true|false]
              Save  download  with --save-session option even if the download is completed or removed. This option also saves control file in that
              situations. This may be useful to save BitTorrent seeding which is recognized as completed state.  Default: false

       --save-not-found [true|false]
              Save download with --save-session option even if the file was not found on the server. This option also saves control file  in  that
              situations.  Default: true

       --gid=<GID>
              Set GID manually. aria2 identifies each download by the ID called GID. The GID must be hex string of 16 characters, thus [0-9a-fA-F]
              are allowed and leading zeros must not be stripped. The GID all 0 is reserved and must not be used. The GID must be  unique,  other‐
              wise  error is reported and the download is not added.  This option is useful when restoring the sessions saved using --save-session
              option. If this option is not used, new GID is generated by aria2.

       --hash-check-only [true|false]
              If true is given, after hash check using --check-integrity option, abort download whether or not  download  is  complete.   Default:
              false

       --human-readable [true|false]
              Print sizes and speed in human readable format (e.g., 1.2Ki, 3.4Mi) in the console readout. Default: true

       --interface=<INTERFACE>
              Bind  sockets to given interface. You can specify interface name, IP address and host name.  Possible Values: interface, IP address,
              host name

              NOTE:
                 If an interface has multiple addresses, it is highly recommended to specify IP address explicitly. See also  --disable-ipv6.   If
                 your system doesn't have getifaddrs(3), this option doesn't accept interface name.

       --keep-unfinished-download-result [true|false]
              Keep unfinished download results even if doing so exceeds --max-download-result.  This is useful if all unfinished downloads must be
              saved in session file (see --save-session option).  Please keep in mind that there is no upper bound to  the  number  of  unfinished
              download result to keep.  If that is undesirable, turn this option off.  Default: true

       --max-download-result=<NUM>
              Set  maximum  number  of  download  result  kept in memory. The download results are completed/error/removed downloads. The download
              results are stored in FIFO queue and it can store at most NUM download results. When queue is full and new download result  is  cre‐
              ated,  oldest  download  result is removed from the front of the queue and new one is pushed to the back. Setting big number in this
              option may result high memory consumption after thousands of downloads. Specifying 0 means no download result is  kept.   Note  that
              unfinished  downloads  are  kept  in memory regardless of this option value. See --keep-unfinished-download-result option.  Default:
              1000

       --max-mmap-limit=<SIZE>
              Set the maximum file size to enable mmap (see --enable-mmap option). The file size is determined by the sum of all  files  contained
              in  one  download.  For  example,  if  a download contains 5 files, then file size is the total size of those files. If file size is
              strictly greater than the size specified in this option, mmap will be disabled.  Default: 9223372036854775807

       --max-resume-failure-tries=<N>
              When used with --always-resume=false, aria2 downloads file from scratch when aria2 detects N number of URIs that  does  not  support
              resume.  If  N  is  0,  aria2  downloads  file  from scratch when all given URIs do not support resume.  See --always-resume option.
              Default: 0

       --min-tls-version=<VERSION>
              Specify minimum SSL/TLS version to enable.  Possible Values: TLSv1.1, TLSv1.2, TLSv1.3 Default: TLSv1.2

       --multiple-interface=<INTERFACES>
              Comma separated list of interfaces to bind sockets to. Requests will be splited among the interfaces to  achieve  link  aggregation.
              You  can  specify  interface  name,  IP address and hostname. If --interface is used, this option will be ignored.  Possible Values:
              interface, IP address, hostname

       --log-level=<LEVEL>
              Set log level to output.  LEVEL is either debug, info, notice, warn or error.  Default: debug

       --on-bt-download-complete=<COMMAND>
              For BitTorrent, a command specified in --on-download-complete is called after download completed and seeding is over. On  the  other
              hand, this option set the command to be executed after download completed but before seeding.  See Event Hook for more details about
              COMMAND.  Possible Values: /path/to/command

       --on-download-complete=<COMMAND>
              Set  the  command  to  be  executed  after  download  completed.   See  Event  Hook  for  more  details  about  COMMAND.   See  also
              --on-download-stop option.  Possible Values: /path/to/command

       --on-download-error=<COMMAND>
              Set  the  command  to  be  executed  after  download aborted due to error.  See Event Hook for more details about COMMAND.  See also
              --on-download-stop option.  Possible Values: /path/to/command

       --on-download-pause=<COMMAND>
              Set the command to be executed after download was paused.  See  Event  Hook  for  more  details  about  COMMAND.   Possible  Values:
              /path/to/command

       --on-download-start=<COMMAND>
              Set  the  command  to  be  executed  after  download  got started.  See Event Hook for more details about COMMAND.  Possible Values:
              /path/to/command

       --on-download-stop=<COMMAND>
              Set the command to be executed after download stopped. You can override the command to be executed for  particular  download  result
              using  --on-download-complete and --on-download-error. If they are specified, command specified in this option is not executed.  See
              Event Hook for more details about COMMAND.  Possible Values: /path/to/command

       --optimize-concurrent-downloads [true|false|<A>:<B>]
              Optimizes the number of concurrent downloads according to the bandwidth available. aria2 uses the download  speed  observed  in  the
              previous  downloads  to adapt the number of downloads launched in parallel according to the rule N = A + B Log10(speed in Mbps). The
              coefficients A and B can be customized in the option arguments with A and B separated by a colon. The  default  values  (A=5,  B=25)
              lead  to  using  typically 5 parallel downloads on 1Mbps networks and above 50 on 100Mbps networks. The number of parallel downloads
              remains constrained under the maximum defined by the --max-concurrent-downloads parameter.  Default: false

       --piece-length=<LENGTH>
              Set a piece length for HTTP/FTP downloads. This is the boundary when aria2 splits a file. All  splits  occur  at  multiple  of  this
              length.  This  option  will  be  ignored  in  BitTorrent downloads.  It will be also ignored if Metalink file contains piece hashes.
              Default: 1M

              NOTE:
                 The possible use case of --piece-length option is change the request range in one HTTP pipelined request.  To enable  HTTP  pipe‐
                 lining use --enable-http-pipelining.

       --show-console-readout [true|false]
              Show console readout. Default: true

       --stderr [true|false]
              Redirect all console output that would be otherwise printed in stdout to stderr.  Default: false

       --summary-interval=<SEC>
              Set interval in seconds to output download progress summary.  Setting 0 suppresses the output.  Default: 60

       -Z, --force-sequential [true|false]
              Fetch URIs in the command-line sequentially and download each URI in a separate session, like the usual command-line download utili‐
              ties.  Default: false

       --max-overall-download-limit=<SPEED>
              Set max overall download speed in bytes/sec.  0 means unrestricted.  You can append K or M (1K = 1024, 1M = 1024K).   To  limit  the
              download speed per download, use --max-download-limit option.  Default: 0

       --max-download-limit=<SPEED>
              Set  max  download  speed  per each download in bytes/sec. 0 means unrestricted.  You can append K or M (1K = 1024, 1M = 1024K).  To
              limit the overall download speed, use --max-overall-download-limit option.  Default: 0

       --no-conf [true|false]
              Disable loading aria2.conf file.

       --no-file-allocation-limit=<SIZE>
              No file allocation is made for files whose size is smaller than SIZE.  You can append K or M (1K = 1024, 1M = 1024K).  Default: 5M

       -P, --parameterized-uri [true|false]
              Enable parameterized URI support.  You can specify set  of  parts:  http://{sv1,sv2,sv3}/foo.iso.   Also  you  can  specify  numeric
              sequences with step counter: http://host/image[000-100:2].img.  A step counter can be omitted.  If all URIs do not point to the same
              file, such as the second example above, -Z option is required.  Default: false

       -q, --quiet [true|false]
              Make aria2 quiet (no console output).  Default: false

       --realtime-chunk-checksum [true|false]
              Validate chunk of data by calculating checksum while downloading a file if chunk checksums are provided.  Default: true

       --remove-control-file [true|false]
              Remove control file before download. Using with --allow-overwrite=true, download always starts from scratch. This will be useful for
              users behind proxy server which disables resume.

       --save-session=<FILE>
              Save  error/unfinished  downloads  to FILE on exit.  You can pass this output file to aria2c with --input-file option on restart. If
              you like the output to be gzipped append a .gz extension to the file name.  Please note that downloads added  by  aria2.addTorrent()
              and  aria2.addMetalink()  RPC  method  and  whose  meta  data  could  not be saved as a file are not saved.  Downloads removed using
              aria2.remove() and aria2.forceRemove() will not be saved. GID is also saved with gid, but there are some restrictions, see below.

              NOTE:
                 Normally, GID of the download itself is saved. But some downloads use meta data (e.g., BitTorrent and Metalink).  In  this  case,
                 there are some restrictions.

                 magnet URI, and followed by torrent download
                        GID of BitTorrent meta data download is saved.

                 URI to torrent file, and followed by torrent download
                        GID of torrent file download is saved.

                 URI to metalink file, and followed by file downloads described in metalink file
                        GID of metalink file download is saved.

                 local torrent file
                        GID of torrent download is saved.

                 local metalink file
                        Any meaningful GID is not saved.

       --save-session-interval=<SEC>
              Save  error/unfinished  downloads  to a file specified by --save-session option every SEC seconds. If 0 is given, file will be saved
              only when aria2 exits. Default: 0

       --socket-recv-buffer-size=<SIZE>
              Set the maximum socket receive buffer in bytes.  Specifying 0 will disable this option. This  value  will  be  set  to  socket  file
              descriptor using SO_RCVBUF socket option with setsockopt() call.  Default: 0

       --stop=<SEC>
              Stop application after SEC seconds has passed.  If 0 is given, this feature is disabled.  Default: 0

       --stop-with-process=<PID>
              Stop  application  when  process  PID  is  not running.  This is useful if aria2 process is forked from a parent process. The parent
              process can fork aria2 with its own pid and when parent process exits for some reason, aria2 can detect it and shutdown itself.

       --truncate-console-readout [true|false]
              Truncate console readout to fit in a single line.  Default: true

       -v, --version
              Print the version number, copyright and the configuration information and exit.

   Notes for Options
   Optional arguments
       The options that have its argument surrounded by square brackets([]) take an optional argument. Usually omitting the argument is  evaluated
       to true.  If you use short form of these options(such as -V) and give an argument, then the option name and its argument should be concate‐
       nated(e.g.  -Vfalse). If any spaces are inserted between the option name and the argument, the argument will be treated as URI and  usually
       this is not what you expect.

   Units (K and M)
       Some  options  takes  K  and M to conveniently represent 1024 and 1048576 respectively.  aria2 detects these characters in case-insensitive
       way. In other words, k and m can be used as well as K and M respectively.

   URI, MAGNET, TORRENT_FILE, METALINK_FILE
       You can specify multiple URIs in command-line.  Unless you specify --force-sequential option, all URIs must point to the same file or down‐
       loading will fail.

       You  can  specify  arbitrary  number  of  BitTorrent Magnet URI. Please note that they are always treated as a separate download.  Both hex
       encoded 40 characters Info Hash and Base32 encoded 32 characters Info Hash  are  supported.  The  multiple  tr  parameters  are  supported.
       Because  BitTorrent  Magnet  URI is likely to contain & character, it is highly recommended to always quote URI with single(') or double(")
       quotation.     It    is    strongly    recommended    to    enable    DHT    especially    when    tr    parameter    is    missing.    See
       http://www.bittorrent.org/beps/bep_0009.html for more details about BitTorrent Magnet URI.

       You  can  also  specify  arbitrary number of torrent files and Metalink documents stored on a local drive. Please note that they are always
       treated as a separate download. Both Metalink4 and Metalink version 3.0 are supported.

       You can specify both torrent file with -T option and  URIs.  By  doing  this,  you  can  download  a  file  from  both  torrent  swarm  and
       HTTP(S)/FTP/SFTP  server  at  the  same time, while the data from HTTP(S)/FTP/SFTP are uploaded to the torrent swarm.  For single file tor‐
       rents, URI can be a complete URI pointing to the resource or if URI ends with /, name in torrent file in torrent is added.  For  multi-file
       torrents, name and path are added to form a URI for each file.

       NOTE:
          Make  sure  that  URI  is  quoted  with single(') or double(") quotation if it contains & or any characters that have special meaning in
          shell.

   Resuming Download
       Usually, you can resume transfer by just issuing same command (aria2c URI) if the previous transfer is made by aria2.

       If the previous transfer is made by a browser or wget like sequential download manager, then use --continue option to continue  the  trans‐
       fer.

   Event Hook
       aria2  provides  options  to  specify  arbitrary  command  after  specific  event  occurred.  Currently  following  options  are available:
       --on-bt-download-complete, --on-download-pause, --on-download-complete.  --on-download-start, --on-download-error, --on-download-stop.

       aria2 passes 3 arguments to specified command when it is executed.  These arguments are: GID, the number of files and file path.  For HTTP,
       FTP,  and  SFTP  downloads,  usually the number of files is 1.  BitTorrent download can contain multiple files.  If number of files is more
       than one, file path is first one.  In other words, this is the value of path key of first struct whose selected key is true in the response
       of  aria2.getFiles()  RPC  method.   If  you  want to get all file paths, consider to use JSON-RPC/XML-RPC.  Please note that file path may
       change during download in HTTP because of redirection or Content-Disposition header.

       Let's see an example of how arguments are passed to command:

          $ cat hook.sh
          #!/bin/sh
          echo "Called with [$1] [$2] [$3]"
          $ aria2c --on-download-complete hook.sh http://example.org/file.iso
          Called with [1] [1] [/path/to/file.iso]

EXIT STATUS
       Because aria2 can handle multiple downloads at once, it encounters lots of errors in a session.  aria2 returns the  following  exit  status
       based on the last error encountered.

       0      If all downloads were successful.

       1      If an unknown error occurred.

       2      If time out occurred.

       3      If a resource was not found.

       4      If aria2 saw the specified number of "resource not found" error.  See --max-file-not-found option.

       5      If a download aborted because download speed was too slow.  See --lowest-speed-limit option.

       6      If network problem occurred.

       7      If  there were unfinished downloads. This error is only reported if all finished downloads were successful and there were unfinished
              downloads in a queue when aria2 exited by pressing Ctrl-C by an user or sending TERM or INT signal.

       8      If remote server did not support resume when resume was required to complete download.

       9      If there was not enough disk space available.

       10     If piece length was different from one in .aria2 control file. See --allow-piece-length-change option.

       11     If aria2 was downloading same file at that moment.

       12     If aria2 was downloading same info hash torrent at that moment.

       13     If file already existed. See --allow-overwrite option.

       14     If renaming file failed. See --auto-file-renaming option.

       15     If aria2 could not open existing file.

       16     If aria2 could not create new file or truncate existing file.

       17     If file I/O error occurred.

       18     If aria2 could not create directory.

       19     If name resolution failed.

       20     If aria2 could not parse Metalink document.

       21     If FTP command failed.

       22     If HTTP response header was bad or unexpected.

       23     If too many redirects  occurred.

       24     If HTTP authorization failed.

       25     If aria2 could not parse bencoded file (usually ".torrent" file).

       26     If ".torrent" file was corrupted or missing information that aria2 needed.

       27     If Magnet URI was bad.

       28     If bad/unrecognized option was given or unexpected option argument was given.

       29     If the remote server was unable to handle the request due to a temporary overloading or maintenance.

       30     If aria2 could not parse JSON-RPC request.

       31     Reserved.  Not used.

       32     If checksum validation failed.

       NOTE:
          An error occurred in a finished download will not be reported as exit status.

ENVIRONMENT
       aria2 recognizes the following environment variables.

       http_proxy [http://][USER:PASSWORD@]HOST[:PORT]
              Specify proxy server for use in HTTP.  Overrides http-proxy value in configuration file.  The command-line option --http-proxy over‐
              rides this value.

       https_proxy [http://][USER:PASSWORD@]HOST[:PORT]
              Specify  proxy  server  for use in HTTPS.  Overrides https-proxy value in configuration file.  The command-line option --https-proxy
              overrides this value.

       ftp_proxy [http://][USER:PASSWORD@]HOST[:PORT]
              Specify proxy server for use in FTP.  Overrides ftp-proxy value in configuration file.  The command-line  option  --ftp-proxy  over‐
              rides this value.

       all_proxy [http://][USER:PASSWORD@]HOST[:PORT]
              Specify proxy server for use if no protocol-specific proxy is specified.  Overrides all-proxy value in configuration file.  The com‐
              mand-line option --all-proxy overrides this value.

       NOTE:
          Although aria2 accepts ftp:// and https:// scheme in proxy URI, it simply assumes that http:// is specified  and  does  not  change  its
          behavior based on the specified scheme.

       no_proxy [DOMAIN,...]
              Specify  a  comma-separated list of host names, domains and network addresses with or without a subnet mask where no proxy should be
              used.  Overrides the no-proxy value in configuration file.  The command-line option --no-proxy overrides this value.

FILES
   aria2.conf
       By default, aria2 checks whether the legacy path $HOME/.aria2/aria2.conf is present, otherwise it parses  $XDG_CONFIG_HOME/aria2/aria2.conf
       as its configuration file.  You can specify the path to configuration file using --conf-path option.  If you don't want to use the configu‐
       ration file, use --no-conf option.

       The configuration file is a text file and has 1 option per each line. In each  line,  you  can  specify  name-value  pair  in  the  format:
       NAME=VALUE,  where  name  is  the long command-line option name without -- prefix. You can use same syntax for the command-line option. The
       lines beginning # are treated as comments:

          # sample configuration file for aria2c
          listen-port=60000
          dht-listen-port=60000
          seed-ratio=1.0
          max-upload-limit=50K
          ftp-pasv=true

       NOTE:
          The confidential information such as user/password might be included in the configuration file. It is recommended to  change  file  mode
          bits of the configuration file (e.g., chmod 600 aria2.conf), so that other user cannot see the contents of the file.

       The  environment  variables,  such  as  ${HOME}, are expanded by shell.  This means that those variables used in configuration file are not
       expanded.  However, it is useful to ${HOME} to refer user's home directory in configuration file to specify file paths.   Therefore,  aria2
       expands ${HOME} found in the following option values to user's home directory:

       · ca-certificate

       · certificate

       · dht-file-path

       · dht-file-path6

       · dir

       · input-file

       · load-cookies

       · log

       · metalink-file

       · netrc-path

       · on-bt-download-complete

       · on-download-complete

       · on-download-error

       · on-download-start

       · on-download-stop

       · on-download-pause

       · out

       · private-key

       · rpc-certificate

       · rpc-private-key

       · save-cookies

       · save-session

       · server-stat-if

       · server-stat-of

       · torrent-file

       Note  that  this  expansion  occurs  even  if the above options are used in the command-line.  This means that expansion may occur 2 times:
       first, shell and then aria2c.

   dht.dat
       Unless the legacy file paths $HOME/.aria2/dht.dat and $HOME/.aria2/dht6.dat are pointing to existing files, the routing table of  IPv4  DHT
       is saved to the path $XDG_CACHE_HOME/aria2/dht.dat and the routing table of IPv6 DHT is saved to the path $XDG_CACHE_HOME/aria2/dht6.dat.

   Netrc
       Netrc  support  is  enabled by default for HTTP(S)/FTP/SFTP.  To disable netrc support, specify --no-netrc option.  Your .netrc file should
       have correct permissions(600).

       If machine name starts ., aria2 performs domain-match instead of exact match. This is an extension of aria2. For example of  domain  match,
       imagine the following .netrc entry:

          machine .example.org login myid password mypasswd

       aria2.example.org domain-matches .example.org and uses myid and mypasswd.

       Some domain-match example follow: example.net does not domain-match .example.org. example.org does not domain-match .example.org because of
       preceding .. If you want to match example.org, specify example.org.

   Control File
       aria2 uses a control file to track the progress of a download.  A control file is placed in the same directory as the downloading file  and
       its  file  name  is the file name of downloading file with .aria2 appended.  For example, if you are downloading file.zip, then the control
       file should be file.zip.aria2.  (There is a exception for this naming convention.  If you are downloading a multi torrent, its control file
       is  the "top directory" name of the torrent with .aria2 appended.  The "top directory" name is a value of "name" key in "info" directory in
       a torrent file.)

       Usually a control file is deleted once download completed.  If aria2 decides that download cannot be resumed(for example, when  downloading
       a file from a HTTP server which doesn't support resume), a control file is not created.

       Normally  if you lose a control file, you cannot resume download.  But if you have a torrent or metalink with chunk checksums for the file,
       you can resume the download without a control file by giving -V option to aria2c in command-line.

   Input File
       The input file can contain a list of URIs for aria2 to download.  You can specify multiple URIs for a single entity:  separate  URIs  on  a
       single line using the TAB character.

       Each  line  is  treated  as  if  it  is  provided  in  command-line  argument.   Therefore  they  are  affected  by  --force-sequential and
       --parameterized-uri options.

       Since URIs in the input file are directly read by aria2, they must not be quoted with single(') or double(") quotation.

       Lines starting with # are treated as comments and skipped.

       Additionally, the following options can be specified after each line of URIs. These optional lines must start with white space(s).

         · all-proxy

         · all-proxy-passwd

         · all-proxy-user

         · allow-overwrite

         · allow-piece-length-change

         · always-resume

         · async-dns

         · auto-file-renaming

         · bt-enable-hook-after-hash-check

         · bt-enable-lpd

         · bt-exclude-tracker

         · bt-external-ip

         · bt-force-encryption

         · bt-hash-check-seed

         · bt-load-saved-metadata

         · bt-max-peers

         · bt-metadata-only

         · bt-min-crypto-level

         · bt-prioritize-piece

         · bt-remove-unselected-file

         · bt-request-peer-speed-limit

         · bt-require-crypto

         · bt-save-metadata

         · bt-seed-unverified

         · bt-stop-timeout

         · bt-tracker

         · bt-tracker-connect-timeout

         · bt-tracker-interval

         · bt-tracker-timeout

         · check-integrity

         · checksum

         · conditional-get

         · connect-timeout

         · content-disposition-default-utf8

         · continue

         · dir

         · dry-run

         · enable-http-keep-alive

         · enable-http-pipelining

         · enable-mmap

         · enable-peer-exchange

         · file-allocation

         · follow-metalink

         · follow-torrent

         · force-save

         · ftp-passwd

         · ftp-pasv

         · ftp-proxy

         · ftp-proxy-passwd

         · ftp-proxy-user

         · ftp-reuse-connection

         · ftp-type

         · ftp-user

         · gid

         · hash-check-only

         · header

         · http-accept-gzip

         · http-auth-challenge

         · http-no-cache

         · http-passwd

         · http-proxy

         · http-proxy-passwd

         · http-proxy-user

         · http-user

         · https-proxy

         · https-proxy-passwd

         · https-proxy-user

         · index-out

         · lowest-speed-limit

         · max-connection-per-server

         · max-download-limit

         · max-file-not-found

         · max-mmap-limit

         · max-resume-failure-tries

         · max-tries

         · max-upload-limit

         · metalink-base-uri

         · metalink-enable-unique-protocol

         · metalink-language

         · metalink-location

         · metalink-os

         · metalink-preferred-protocol

         · metalink-version

         · min-split-size

         · no-file-allocation-limit

         · no-netrc

         · no-proxy

         · out

         · parameterized-uri

         · pause

         · pause-metadata

         · piece-length

         · proxy-method

         · realtime-chunk-checksum

         · referer

         · remote-time

         · remove-control-file

         · retry-wait

         · reuse-uri

         · rpc-save-upload-metadata

         · seed-ratio

         · seed-time

         · select-file

         · split

         · ssh-host-key-md

         · stream-piece-selector

         · timeout

         · uri-selector

         · use-head

         · user-agent

       These options have exactly same meaning of the ones in the command-line options, but it just applies to the URIs  it  belongs  to.   Please
       note that for options in input file -- prefix must be stripped.

       For example, the content of uri.txt is:

          http://server/file.iso http://mirror/file.iso
            dir=/iso_images
            out=file.img
          http://foo/bar

       If  aria2  is  executed  with  -i  uri.txt  -d  /tmp  options,  then  file.iso  is  saved as /iso_images/file.img and it is downloaded from
       http://server/file.iso and http://mirror/file.iso.  The file bar is downloaded from http://foo/bar and saved as /tmp/bar.

       In some cases, out parameter has no effect.  See note of --out option for the restrictions.

   Server Performance Profile
       This section describes the format of server performance profile.  The file is plain text and each line has several NAME=VALUE pair,  delim‐
       ited by comma.  Currently following NAMEs are recognized:

       host   Host name of the server. Required.

       protocol
              Protocol for this profile, such as ftp, http. Required.

       dl_speed
              The average download speed observed in the previous download in bytes per sec.  Required.

       sc_avg_speed
              The average download speed observed in the previous download in bytes per sec. This value is only updated if the download is done in
              single connection environment and only used by AdaptiveURISelector. Optional.

       mc_avg_speed
              The average download speed observed in the previous download in bytes per sec. This value is only updated if the download is done in
              multi connection environment and only used by AdaptiveURISelector. Optional.

       counter
              How many times the server is used. Currently this value is only used by AdaptiveURISelector.  Optional.

       last_updated
              Last contact time in GMT with this server, specified in the seconds since the Epoch(00:00:00 on January 1, 1970, UTC). Required.

       status ERROR is set when server cannot be reached or out-of-service or timeout occurred. Otherwise, OK is set.

       Those  fields  must  exist in one line. The order of the fields is not significant. You can put pairs other than the above; they are simply
       ignored.

       An example follows:

          host=localhost, protocol=http, dl_speed=32000, last_updated=1222491640, status=OK
          host=localhost, protocol=ftp, dl_speed=0, last_updated=1222491632, status=ERROR

RPC INTERFACE
       aria2 provides JSON-RPC over HTTP and XML-RPC over HTTP interfaces that offer  basically  the  same  functionality.   aria2  also  provides
       JSON-RPC  over  WebSocket. JSON-RPC over WebSocket uses the same method signatures and response format as JSON-RPC over HTTP, but addition‐
       ally provides server-initiated notifications. See JSON-RPC over WebSocket section for more information.

       The request path of the JSON-RPC interface (for both over HTTP and over WebSocket) is /jsonrpc.  The request path of the XML-RPC  interface
       is /rpc.

       The  WebSocket  URI  for  JSON-RPC over WebSocket is ws://HOST:PORT/jsonrpc. If you enabled SSL/TLS encryption, use wss://HOST:PORT/jsonrpc
       instead.

       The implemented JSON-RPC is based on JSON-RPC 2.0 <http://jsonrpc.org/specification>, and supports HTTP POST and  GET  (JSONP).   The  Web‐
       Socket transport is an aria2 extension.

       The  JSON-RPC  interface  does not support notifications over HTTP, but the RPC server will send notifications over WebSocket. It also does
       not support floating point numbers. The character encoding must be UTF-8.

       When reading the following documentation for JSON-RPC, interpret structs as JSON objects.

   Terminology
       GID
          The GID (or gid) is a key to manage each download. Each download will be assigned a unique GID. The GID is stored as 64-bit binary value
          in  aria2.   For RPC access, it is represented as a hex string of 16 characters (e.g., 2089b05ecca3d829). Normally, aria2 generates this
          GID for each download, but the user can specify GIDs manually using the --gid option. When querying downloads by GID,  you  can  specify
          only the prefix of a GID as long as it is unique among others.

   RPC authorization secret token
       As  of  1.18.4,  in  addition  to  HTTP basic authorization, aria2 provides RPC method-level authorization. In a future release, HTTP basic
       authorization will be removed and RPC method-level authorization will become mandatory.

       To use RPC method-level authorization, the user has to specify an RPC secret authorization token using the --rpc-secret  option.  For  each
       RPC  method  call,  the  caller  has to include the token prefixed with token:. Even when the --rpc-secret option is not used, if the first
       parameter in the RPC method is a string and starts with token:, it will removed from the parameter list before the request  is  being  pro‐
       cessed.

       For example, if the RPC secret authorization token is $$secret$$, calling aria2.addUri RPC method would have to look like this:

          aria2.addUri("token:$$secret$$", ["http://example.org/file"])

       The  system.multicall  RPC  method is treated specially. Since the XML-RPC specification only allows a single array as a parameter for this
       method, we don't specify the token in the call. Instead, each nested method call has to  provide  the  token  as  the  first  parameter  as
       described above.

       NOTE:
          The  secret  token  validation in aria2 is designed to take at least a certain amount of time to mitigate brute-force/dictionary attacks
          against the RPC interface. Therefore it is recommended to prefer Batch or system.multicall requests when appropriate.

          system.listMethods and system.listNotifications can be executed without token. Since they just return  available  methods/notifications,
          they do not alter anything, they're safe without secret token.

   Methods
       All  code  examples  are compatible with the Python 2.7 interpreter.  For information on the secret parameter, see RPC authorization secret
       token.

       aria2.addUri([secret], uris[, options[, position]])
              This method adds a new download. uris is an array of HTTP/FTP/SFTP/BitTorrent URIs (strings) pointing to the same resource.  If  you
              mix URIs pointing to different resources, then the download may fail or be corrupted without aria2 complaining.  When adding BitTor‐
              rent Magnet URIs, uris must have only one element and it should be BitTorrent Magnet URI.  options is a struct and its  members  are
              pairs  of  option name and value.  See Options below for more details.  If position is given, it must be an integer starting from 0.
              The new download will be inserted at position in the waiting queue. If position is omitted or position is larger  than  the  current
              size  of the queue, the new download is appended to the end of the queue.  This method returns the GID of the newly registered down‐
              load.

              JSON-RPC Example

              The following example adds http://example.org/file:

                 >>> import urllib2, json
                 >>> jsonreq = json.dumps({'jsonrpc':'2.0', 'id':'qwer',
                 ...                       'method':'aria2.addUri',
                 ...                       'params':[['http://example.org/file']]})
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> c.read()
                 '{"id":"qwer","jsonrpc":"2.0","result":"2089b05ecca3d829"}'

              XML-RPC Example

              The following example adds http://example.org/file:

                 >>> import xmlrpclib
                 >>> s = xmlrpclib.ServerProxy('http://localhost:6800/rpc')
                 >>> s.aria2.addUri(['http://example.org/file'])
                 '2089b05ecca3d829'

              The following example adds a new download with two sources and some options:

                 >>> s.aria2.addUri(['http://example.org/file', 'http://mirror/file'],
                                     dict(dir="/tmp"))
                 'd2703803b52216d1'

              The following example adds a download and inserts it to the front of the queue:

                 >>> s.aria2.addUri(['http://example.org/file'], {}, 0)
                 'ca3d829cee549a4d'

       aria2.addTorrent([secret], torrent[, uris[, options[, position]]])
              This method adds a BitTorrent download by uploading a ".torrent" file.  If you  want  to  add  a  BitTorrent  Magnet  URI,  use  the
              aria2.addUri()  method instead.  torrent must be a base64-encoded string containing the contents of the ".torrent" file.  uris is an
              array of URIs (string). uris is used for Web-seeding.  For single file torrents, the URI can be  a  complete  URI  pointing  to  the
              resource;  if  URI ends with /, name in torrent file is added. For multi-file torrents, name and path in torrent are added to form a
              URI for each file.  options is a struct and its members are pairs of option name and value.  See Options below for more details.  If
              position  is  given,  it  must be an integer starting from 0. The new download will be inserted at position in the waiting queue. If
              position is omitted or position is larger than the current size of the queue, the new download is appended to the end of the  queue.
              This  method returns the GID of the newly registered download.  If --rpc-save-upload-metadata is true, the uploaded data is saved as
              a file named as the hex string of SHA-1 hash of data plus ".torrent" in the directory specified by --dir option.  E.g. a  file  name
              might  be 0a3893293e27ac0490424c06de4d09242215f0a6.torrent.  If a file with the same name already exists, it is overwritten!  If the
              file cannot be saved successfully or --rpc-save-upload-metadata is false, the downloads added  by  this  method  are  not  saved  by
              --save-session.

              The following examples add local file file.torrent.

              JSON-RPC Example

                 >>> import urllib2, json, base64
                 >>> torrent = base64.b64encode(open('file.torrent').read())
                 >>> jsonreq = json.dumps({'jsonrpc':'2.0', 'id':'asdf',
                 ...                       'method':'aria2.addTorrent', 'params':[torrent]})
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> c.read()
                 '{"id":"asdf","jsonrpc":"2.0","result":"2089b05ecca3d829"}'

              XML-RPC Example

                 >>> import xmlrpclib
                 >>> s = xmlrpclib.ServerProxy('http://localhost:6800/rpc')
                 >>> s.aria2.addTorrent(xmlrpclib.Binary(open('file.torrent', mode='rb').read()))
                 '2089b05ecca3d829'

       aria2.addMetalink([secret], metalink[, options[, position]])
              This  method  adds a Metalink download by uploading a ".metalink" file.  metalink is a base64-encoded string which contains the con‐
              tents of the ".metalink" file.  options is a struct and its members are pairs of option name and value.  See Options below for  more
              details.   If position is given, it must be an integer starting from 0. The new download will be inserted at position in the waiting
              queue. If position is omitted or position is larger than the current size of the queue, the new download is appended to the  end  of
              the queue.  This method returns an array of GIDs of newly registered downloads.  If --rpc-save-upload-metadata is true, the uploaded
              data is saved as a file named hex string of SHA-1 hash of data plus ".metalink" in the directory specified by --dir option.  E.g.  a
              file  name might be 0a3893293e27ac0490424c06de4d09242215f0a6.metalink.  If a file with the same name already exists, it is overwrit‐
              ten!  If the file cannot be saved successfully or --rpc-save-upload-metadata is false, the downloads added by this  method  are  not
              saved by --save-session.

              The following examples add local file file.meta4.

              JSON-RPC Example

                 >>> import urllib2, json, base64
                 >>> metalink = base64.b64encode(open('file.meta4').read())
                 >>> jsonreq = json.dumps({'jsonrpc':'2.0', 'id':'qwer',
                 ...                       'method':'aria2.addMetalink',
                 ...                       'params':[metalink]})
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> c.read()
                 '{"id":"qwer","jsonrpc":"2.0","result":["2089b05ecca3d829"]}'

              XML-RPC Example

                 >>> import xmlrpclib
                 >>> s = xmlrpclib.ServerProxy('http://localhost:6800/rpc')
                 >>> s.aria2.addMetalink(xmlrpclib.Binary(open('file.meta4', mode='rb').read()))
                 ['2089b05ecca3d829']

       aria2.remove([secret], gid)
              This  method removes the download denoted by gid (string).  If the specified download is in progress, it is first stopped.  The sta‐
              tus of the removed download becomes removed.  This method returns GID of removed download.

              The following examples remove a download with GID#2089b05ecca3d829.

              JSON-RPC Example

                 >>> import urllib2, json
                 >>> jsonreq = json.dumps({'jsonrpc':'2.0', 'id':'qwer',
                 ...                       'method':'aria2.remove',
                 ...                       'params':['2089b05ecca3d829']})
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> c.read()
                 '{"id":"qwer","jsonrpc":"2.0","result":"2089b05ecca3d829"}'

              XML-RPC Example

                 >>> import xmlrpclib
                 >>> s = xmlrpclib.ServerProxy('http://localhost:6800/rpc')
                 >>> s.aria2.remove('2089b05ecca3d829')
                 '2089b05ecca3d829'

       aria2.forceRemove([secret], gid)
              This method removes the download denoted by gid.  This method behaves just like aria2.remove() except that this method  removes  the
              download without performing any actions which take time, such as contacting BitTorrent trackers to unregister the download first.

       aria2.pause([secret], gid)
              This method pauses the download denoted by gid (string).  The status of paused download becomes paused.  If the download was active,
              the download is placed in the front of waiting queue.  While the status is paused, the download is not started.  To change status to
              waiting, use the aria2.unpause() method.  This method returns GID of paused download.

       aria2.pauseAll([secret])
              This method is equal to calling aria2.pause() for every active/waiting download. This methods returns OK.

       aria2.forcePause([secret], gid)
              This  method  pauses  the download denoted by gid.  This method behaves just like aria2.pause() except that this method pauses down‐
              loads without performing any actions which take time, such as contacting BitTorrent trackers to unregister the download first.

       aria2.forcePauseAll([secret])
              This method is equal to calling aria2.forcePause() for every active/waiting download. This methods returns OK.

       aria2.unpause([secret], gid)
              This method changes the status of the download denoted by gid (string) from paused to waiting, making the download  eligible  to  be
              restarted.  This method returns the GID of the unpaused download.

       aria2.unpauseAll([secret])
              This method is equal to calling aria2.unpause() for every paused download. This methods returns OK.

       aria2.tellStatus([secret], gid[, keys])
              This  method  returns the progress of the download denoted by gid (string).  keys is an array of strings. If specified, the response
              contains only keys in the keys array. If keys is empty or omitted, the response contains all keys. This is useful when you just want
              specific keys and avoid unnecessary transfers.  For example, aria2.tellStatus("2089b05ecca3d829", ["gid", "status"]) returns the gid
              and status keys only.  The response is a struct and contains following keys. Values are strings.

              gid    GID of the download.

              status active for currently downloading/seeding downloads.  waiting for downloads in the queue; download is not started.  paused for
                     paused  downloads.   error  for downloads that were stopped  because of error.  complete for stopped and completed downloads.
                     removed for the downloads removed by user.

              totalLength
                     Total length of the download in bytes.

              completedLength
                     Completed length of the download in bytes.

              uploadLength
                     Uploaded length of the download in bytes.

              bitfield
                     Hexadecimal representation of the download progress. The highest bit corresponds to the piece at index 0. Any set bits  indi‐
                     cate  loaded  pieces, while unset bits indicate not yet loaded and/or missing pieces. Any overflow bits at the end are set to
                     zero.  When the download was not started yet, this key will not be included in the response.

              downloadSpeed
                     Download speed of this download measured in bytes/sec.

              uploadSpeed
                     Upload speed of this download measured in bytes/sec.

              infoHash
                     InfoHash. BitTorrent only.

              numSeeders
                     The number of seeders aria2 has connected to. BitTorrent only.

              seeder true if the local endpoint is a seeder. Otherwise false.  BitTorrent only.

              pieceLength
                     Piece length in bytes.

              numPieces
                     The number of pieces.

              connections
                     The number of peers/servers aria2 has connected to.

              errorCode
                     The code of the last error for this item, if any. The value is a string. The error codes are defined in the EXIT STATUS  sec‐
                     tion.  This value is only available for stopped/completed downloads.

              errorMessage
                     The (hopefully) human readable error message associated to errorCode.

              followedBy
                     List of GIDs which are generated as the result of this download. For example, when aria2 downloads a Metalink file, it gener‐
                     ates downloads described in the Metalink (see the --follow-metalink option). This value is  useful  to  track  auto-generated
                     downloads. If there are no such downloads, this key will not be included in the response.

              following
                     The reverse link for followedBy.  A download included in followedBy has this object's GID in its following value.

              belongsTo
                     GID of a parent download. Some downloads are a part of another download.  For example, if a file in a Metalink has BitTorrent
                     resources, the downloads of ".torrent" files are parts of that parent.  If this download has no parent, this key will not  be
                     included in the response.

              dir    Directory to save files.

              files  Returns the list of files. The elements of this list are the same structs used in aria2.getFiles() method.

              bittorrent
                     Struct which contains information retrieved from the .torrent (file). BitTorrent only. It contains following keys.

                     announceList
                            List  of  lists  of announce URIs. If the torrent contains announce and no announce-list, announce is converted to the
                            announce-list format.

                     comment
                            The comment of the torrent. comment.utf-8 is used if available.

                     creationDate
                            The creation time of the torrent. The value is an integer since the epoch, measured in seconds.

                     mode   File mode of the torrent. The value is either single or multi.

                     info   Struct which contains data from Info dictionary. It contains following keys.

                            name   name in info dictionary. name.utf-8 is used if available.

              verifiedLength
                     The number of verified number of bytes while the files are being hash checked.  This key exists only when  this  download  is
                     being hash checked.

              verifyIntegrityPending
                     true if this download is waiting for the hash check in a queue.  This key exists only when this download is in the queue.

              JSON-RPC Example

              The following example gets information about a download with GID#2089b05ecca3d829:

                 >>> import urllib2, json
                 >>> from pprint import pprint
                 >>> jsonreq = json.dumps({'jsonrpc':'2.0', 'id':'qwer',
                 ...                       'method':'aria2.tellStatus',
                 ...                       'params':['2089b05ecca3d829']})
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> pprint(json.loads(c.read()))
                 {u'id': u'qwer',
                  u'jsonrpc': u'2.0',
                  u'result': {u'bitfield': u'0000000000',
                              u'completedLength': u'901120',
                              u'connections': u'1',
                              u'dir': u'/downloads',
                              u'downloadSpeed': u'15158',
                              u'files': [{u'index': u'1',
                                          u'length': u'34896138',
                                          u'completedLength': u'34896138',
                                          u'path': u'/downloads/file',
                                          u'selected': u'true',
                                          u'uris': [{u'status': u'used',
                                                     u'uri': u'http://example.org/file'}]}],
                              u'gid': u'2089b05ecca3d829',
                              u'numPieces': u'34',
                              u'pieceLength': u'1048576',
                              u'status': u'active',
                              u'totalLength': u'34896138',
                              u'uploadLength': u'0',
                              u'uploadSpeed': u'0'}}

              The following example gets only specific keys:

                 >>> jsonreq = json.dumps({'jsonrpc':'2.0', 'id':'qwer',
                 ...                       'method':'aria2.tellStatus',
                 ...                       'params':['2089b05ecca3d829',
                 ...                                 ['gid',
                 ...                                  'totalLength',
                 ...                                  'completedLength']]})
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> pprint(json.loads(c.read()))
                 {u'id': u'qwer',
                  u'jsonrpc': u'2.0',
                  u'result': {u'completedLength': u'5701632',
                              u'gid': u'2089b05ecca3d829',
                              u'totalLength': u'34896138'}}

              XML-RPC Example

              The following example gets information about a download with GID#2089b05ecca3d829:

                 >>> import xmlrpclib
                 >>> from pprint import pprint
                 >>> s = xmlrpclib.ServerProxy('http://localhost:6800/rpc')
                 >>> r = s.aria2.tellStatus('2089b05ecca3d829')
                 >>> pprint(r)
                 {'bitfield': 'ffff80',
                  'completedLength': '34896138',
                  'connections': '0',
                  'dir': '/downloads',
                  'downloadSpeed': '0',
                  'errorCode': '0',
                  'files': [{'index': '1',
                             'length': '34896138',
                             'completedLength': '34896138',
                             'path': '/downloads/file',
                             'selected': 'true',
                             'uris': [{'status': 'used',
                                       'uri': 'http://example.org/file'}]}],
                  'gid': '2089b05ecca3d829',
                  'numPieces': '17',
                  'pieceLength': '2097152',
                  'status': 'complete',
                  'totalLength': '34896138',
                  'uploadLength': '0',
                  'uploadSpeed': '0'}

              The following example gets only specific keys:

                 >>> r = s.aria2.tellStatus('2089b05ecca3d829', ['gid', 'totalLength', 'completedLength'])
                 >>> pprint(r)
                 {'completedLength': '34896138', 'gid': '2089b05ecca3d829', 'totalLength': '34896138'}

       aria2.getUris([secret], gid)
              This method returns the URIs used in the download denoted by gid (string).  The response is an array of structs and it contains fol‐
              lowing keys.  Values are string.

              uri    URI

              status 'used' if the URI is in use. 'waiting' if the URI is still waiting in the queue.

              JSON-RPC Example

                 >>> import urllib2, json
                 >>> from pprint import pprint
                 >>> jsonreq = json.dumps({'jsonrpc':'2.0', 'id':'qwer',
                 ...                       'method':'aria2.getUris',
                 ...                       'params':['2089b05ecca3d829']})
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> pprint(json.loads(c.read()))
                 {u'id': u'qwer',
                  u'jsonrpc': u'2.0',
                  u'result': [{u'status': u'used',
                               u'uri': u'http://example.org/file'}]}

              XML-RPC Example

                 >>> import xmlrpclib
                 >>> from pprint import pprint
                 >>> s = xmlrpclib.ServerProxy('http://localhost:6800/rpc')
                 >>> r = s.aria2.getUris('2089b05ecca3d829')
                 >>> pprint(r)
                 [{'status': 'used', 'uri': 'http://example.org/file'}]

       aria2.getFiles([secret], gid)
              This method returns the file list of the download denoted by gid (string).  The response is an array of structs which  contain  fol‐
              lowing keys.  Values are strings.

              index  Index of the file, starting at 1, in the same order as files appear in the multi-file torrent.

              path   File path.

              length File size in bytes.

              completedLength
                     Completed  length  of  this file in bytes.  Please note that it is possible that sum of completedLength is less than the com‐
                     pletedLength returned by the aria2.tellStatus() method.  This is because completedLength in  aria2.getFiles()  only  includes
                     completed pieces. On the other hand, completedLength in aria2.tellStatus() also includes partially completed pieces.

              selected
                     true  if  this  file is selected by --select-file option. If --select-file is not specified or this is single-file torrent or
                     not a torrent download at all, this value is always true. Otherwise false.

              uris   Returns a list of URIs for this file. The element type is the same struct used in the aria2.getUris() method.

              JSON-RPC Example

                 >>> import urllib2, json
                 >>> from pprint import pprint
                 >>> jsonreq = json.dumps({'jsonrpc':'2.0', 'id':'qwer',
                 ...                       'method':'aria2.getFiles',
                 ...                       'params':['2089b05ecca3d829']})
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> pprint(json.loads(c.read()))
                 {u'id': u'qwer',
                  u'jsonrpc': u'2.0',
                  u'result': [{u'index': u'1',
                               u'length': u'34896138',
                               u'completedLength': u'34896138',
                               u'path': u'/downloads/file',
                               u'selected': u'true',
                               u'uris': [{u'status': u'used',
                                          u'uri': u'http://example.org/file'}]}]}

              XML-RPC Example

                 >>> import xmlrpclib
                 >>> from pprint import pprint
                 >>> s = xmlrpclib.ServerProxy('http://localhost:6800/rpc')
                 >>> r = s.aria2.getFiles('2089b05ecca3d829')
                 >>> pprint(r)
                 [{'index': '1',
                   'length': '34896138',
                   'completedLength': '34896138',
                   'path': '/downloads/file',
                   'selected': 'true',
                   'uris': [{'status': 'used',
                             'uri': 'http://example.org/file'}]}]

       aria2.getPeers([secret], gid)
              This method returns a list peers of the download denoted by gid (string).  This method is for BitTorrent only.  The response  is  an
              array of structs and contains the following keys. Values are strings.

              peerId Percent-encoded peer ID.

              ip     IP address of the peer.

              port   Port number of the peer.

              bitfield
                     Hexadecimal  representation  of  the  download progress of the peer. The highest bit corresponds to the piece at index 0. Set
                     bits indicate the piece is available and unset bits indicate the piece is missing. Any spare bits at the end are set to zero.

              amChoking
                     true if aria2 is choking the peer. Otherwise false.

              peerChoking
                     true if the peer is choking aria2. Otherwise false.

              downloadSpeed
                     Download speed (byte/sec) that this client obtains from the peer.

              uploadSpeed
                     Upload speed(byte/sec) that this client uploads to the peer.

              seeder true if this peer is a seeder. Otherwise false.

              JSON-RPC Example

                 >>> import urllib2, json
                 >>> from pprint import pprint
                 >>> jsonreq = json.dumps({'jsonrpc':'2.0', 'id':'qwer',
                 ...                       'method':'aria2.getPeers',
                 ...                       'params':['2089b05ecca3d829']})
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> pprint(json.loads(c.read()))
                 {u'id': u'qwer',
                  u'jsonrpc': u'2.0',
                  u'result': [{u'amChoking': u'true',
                               u'bitfield': u'ffffffffffffffffffffffffffffffffffffffff',
                               u'downloadSpeed': u'10602',
                               u'ip': u'10.0.0.9',
                               u'peerChoking': u'false',
                               u'peerId': u'aria2%2F1%2E10%2E5%2D%87%2A%EDz%2F%F7%E6',
                               u'port': u'6881',
                               u'seeder': u'true',
                               u'uploadSpeed': u'0'},
                              {u'amChoking': u'false',
                               u'bitfield': u'ffffeff0fffffffbfffffff9fffffcfff7f4ffff',
                               u'downloadSpeed': u'8654',
                               u'ip': u'10.0.0.30',
                               u'peerChoking': u'false',
                               u'peerId': u'bittorrent client758',
                               u'port': u'37842',
                               u'seeder': u'false',
                               u'uploadSpeed': u'6890'}]}

              XML-RPC Example

                 >>> import xmlrpclib
                 >>> from pprint import pprint
                 >>> s = xmlrpclib.ServerProxy('http://localhost:6800/rpc')
                 >>> r = s.aria2.getPeers('2089b05ecca3d829')
                 >>> pprint(r)
                 [{'amChoking': 'true',
                   'bitfield': 'ffffffffffffffffffffffffffffffffffffffff',
                   'downloadSpeed': '10602',
                   'ip': '10.0.0.9',
                   'peerChoking': 'false',
                   'peerId': 'aria2%2F1%2E10%2E5%2D%87%2A%EDz%2F%F7%E6',
                   'port': '6881',
                   'seeder': 'true',
                   'uploadSpeed': '0'},
                  {'amChoking': 'false',
                   'bitfield': 'ffffeff0fffffffbfffffff9fffffcfff7f4ffff',
                   'downloadSpeed': '8654',
                   'ip': '10.0.0.30',
                   'peerChoking': 'false',
                   'peerId': 'bittorrent client758',
                   'port': '37842',
                   'seeder': 'false,
                   'uploadSpeed': '6890'}]

       aria2.getServers([secret], gid)
              This method returns currently connected HTTP(S)/FTP/SFTP servers of the download denoted by gid (string). The response is  an  array
              of structs and contains the following keys. Values are strings.

              index  Index of the file, starting at 1, in the same order as files appear in the multi-file metalink.

              servers
                     A list of structs which contain the following keys.

                     uri    Original URI.

                     currentUri
                            This is the URI currently used for downloading. If redirection is involved, currentUri and uri may differ.

                     downloadSpeed
                            Download speed (byte/sec)

              JSON-RPC Example

                 >>> import urllib2, json
                 >>> from pprint import pprint
                 >>> jsonreq = json.dumps({'jsonrpc':'2.0', 'id':'qwer',
                 ...                       'method':'aria2.getServers',
                 ...                       'params':['2089b05ecca3d829']})
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> pprint(json.loads(c.read()))
                 {u'id': u'qwer',
                  u'jsonrpc': u'2.0',
                  u'result': [{u'index': u'1',
                               u'servers': [{u'currentUri': u'http://example.org/file',
                                             u'downloadSpeed': u'10467',
                                             u'uri': u'http://example.org/file'}]}]}

              XML-RPC Example

                 >>> import xmlrpclib
                 >>> from pprint import pprint
                 >>> s = xmlrpclib.ServerProxy('http://localhost:6800/rpc')
                 >>> r = s.aria2.getServers('2089b05ecca3d829')
                 >>> pprint(r)
                 [{'index': '1',
                   'servers': [{'currentUri': 'http://example.org/dl/file',
                                'downloadSpeed': '20285',
                                'uri': 'http://example.org/file'}]}]

       aria2.tellActive([secret][, keys])
              This  method returns a list of active downloads.  The response is an array of the same structs as returned by the aria2.tellStatus()
              method.  For the keys parameter, please refer to the aria2.tellStatus() method.

       aria2.tellWaiting([secret], offset, num[, keys])
              This method returns a list of waiting downloads, including paused ones.  offset is an integer and  specifies  the  offset  from  the
              download  waiting  at the front.  num is an integer and specifies the max. number of downloads to be returned.  For the keys parame‐
              ter, please refer to the aria2.tellStatus() method.

              If offset is a positive integer, this method returns downloads in the range of [offset, offset + num).

              offset can be a negative integer. offset == -1 points last download in the waiting queue and offset == -2 points the download before
              the last download, and so on. Downloads in the response are in reversed order then.

              For  example,  imagine three downloads "A","B" and "C" are waiting in this order. aria2.tellWaiting(0, 1) returns ["A"]. aria2.tell‐
              Waiting(1, 2) returns ["B", "C"].  aria2.tellWaiting(-1, 2) returns ["C", "B"].

              The response is an array of the same structs as returned by aria2.tellStatus() method.

       aria2.tellStopped([secret], offset, num[, keys])
              This method returns a list of stopped downloads.  offset is an integer and specifies the offset  from  the  least  recently  stopped
              download.  num is an integer and specifies the max. number of downloads to be returned.  For the keys parameter, please refer to the
              aria2.tellStatus() method.

              offset and num have the same semantics as described in the aria2.tellWaiting() method.

              The response is an array of the same structs as returned by the aria2.tellStatus() method.

       aria2.changePosition([secret], gid, pos, how)
              This method changes the position of the download denoted by gid in the queue.  pos is an integer.   how  is  a  string.  If  how  is
              POS_SET,  it moves the download to a position relative to the beginning of the queue.  If how is POS_CUR, it moves the download to a
              position relative to the current position. If how is POS_END, it moves the download to a position relative to the end of the  queue.
              If  the destination position is less than 0 or beyond the end of the queue, it moves the download to the beginning or the end of the
              queue respectively. The response is an integer denoting the resulting position.

              For example, if GID#2089b05ecca3d829 is currently in position 3, aria2.changePosition('2089b05ecca3d829', -1, 'POS_CUR') will change
              its  position to 2. Additionally aria2.changePosition('2089b05ecca3d829', 0, 'POS_SET') will change its position to 0 (the beginning
              of the queue).

              The following examples move the download GID#2089b05ecca3d829 to the front of the queue.

              JSON-RPC Example

                 >>> import urllib2, json
                 >>> from pprint import pprint
                 >>> jsonreq = json.dumps({'jsonrpc':'2.0', 'id':'qwer',
                 ...                       'method':'aria2.changePosition',
                 ...                       'params':['2089b05ecca3d829', 0, 'POS_SET']})
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> pprint(json.loads(c.read()))
                 {u'id': u'qwer', u'jsonrpc': u'2.0', u'result': 0}

              XML-RPC Example

                 >>> import xmlrpclib
                 >>> s = xmlrpclib.ServerProxy('http://localhost:6800/rpc')
                 >>> s.aria2.changePosition('2089b05ecca3d829', 0, 'POS_SET')
                 0

       aria2.changeUri([secret], gid, fileIndex, delUris, addUris[, position])
              This method removes the URIs in delUris from and appends the URIs in addUris to download denoted by gid.  delUris  and  addUris  are
              lists  of strings. A download can contain multiple files and URIs are attached to each file.  fileIndex is used to select which file
              to remove/attach given URIs. fileIndex is 1-based. position is used to specify where URIs are inserted in the existing  waiting  URI
              list.  position  is  0-based.  When  position is omitted, URIs are appended to the back of the list.  This method first executes the
              removal and then the addition. position is the position after URIs are removed, not the position when this method is  called.   When
              removing  an  URI, if the same URIs exist in download, only one of them is removed for each URI in delUris. In other words, if there
              are three URIs http://example.org/aria2 and you want remove them all, you have to specify (at least) 3  http://example.org/aria2  in
              delUris.   This method returns a list which contains two integers. The first integer is the number of URIs deleted. The second inte‐
              ger is the number of URIs added.

              The following  examples  add  the  URI  http://example.org/file  to  the  file  whose  index  is  1  and  belongs  to  the  download
              GID#2089b05ecca3d829.

              JSON-RPC Example

                 >>> import urllib2, json
                 >>> from pprint import pprint
                 >>> jsonreq = json.dumps({'jsonrpc':'2.0', 'id':'qwer',
                 ...                       'method':'aria2.changeUri',
                 ...                       'params':['2089b05ecca3d829', 1, [],
                                                     ['http://example.org/file']]})
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> pprint(json.loads(c.read()))
                 {u'id': u'qwer', u'jsonrpc': u'2.0', u'result': [0, 1]}

              XML-RPC Example

                 >>> import xmlrpclib
                 >>> s = xmlrpclib.ServerProxy('http://localhost:6800/rpc')
                 >>> s.aria2.changeUri('2089b05ecca3d829', 1, [],
                                       ['http://example.org/file'])
                 [0, 1]

       aria2.getOption([secret], gid)
              This method returns options of the download denoted by gid.  The response is a struct where keys are the names of options.  The val‐
              ues are strings.  Note that this method does not return options which have no default value and  have  not  been  set  on  the  com‐
              mand-line, in configuration files or RPC methods.

              The following examples get options of the download GID#2089b05ecca3d829.

              JSON-RPC Example

                 >>> import urllib2, json
                 >>> from pprint import pprint
                 >>> jsonreq = json.dumps({'jsonrpc':'2.0', 'id':'qwer',
                 ...                       'method':'aria2.getOption',
                 ...                       'params':['2089b05ecca3d829']})
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> pprint(json.loads(c.read()))
                 {u'id': u'qwer',
                  u'jsonrpc': u'2.0',
                  u'result': {u'allow-overwrite': u'false',
                              u'allow-piece-length-change': u'false',
                              u'always-resume': u'true',
                              u'async-dns': u'true',
                  ...

              XML-RPC Example

                 >>> import xmlrpclib
                 >>> from pprint import pprint
                 >>> s = xmlrpclib.ServerProxy('http://localhost:6800/rpc')
                 >>> r = s.aria2.getOption('2089b05ecca3d829')
                 >>> pprint(r)
                 {'allow-overwrite': 'false',
                  'allow-piece-length-change': 'false',
                  'always-resume': 'true',
                  'async-dns': 'true',
                  ....

       aria2.changeOption([secret], gid, options)
              This  method changes options of the download denoted by gid (string) dynamically.  options is a struct.  The options listed in Input
              File subsection are available, except for following options:

              · dry-run

              · metalink-base-uri

              · parameterized-uri

              · pause

              · piece-length

              · rpc-save-upload-metadata

              Except for the following options, changing the other options of active download makes it  restart  (restart  itself  is  managed  by
              aria2, and no user intervention is required):

              · bt-max-peers

              · bt-request-peer-speed-limit

              · bt-remove-unselected-file

              · force-save

              · max-download-limit

              · max-upload-limit

              This method returns OK for success.

              The following examples set the max-download-limit option to 20K for the download GID#2089b05ecca3d829.

              JSON-RPC Example

                 >>> import urllib2, json
                 >>> from pprint import pprint
                 >>> jsonreq = json.dumps({'jsonrpc':'2.0', 'id':'qwer',
                 ...                       'method':'aria2.changeOption',
                 ...                       'params':['2089b05ecca3d829',
                 ...                                 {'max-download-limit':'10K'}]})
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> pprint(json.loads(c.read()))
                 {u'id': u'qwer', u'jsonrpc': u'2.0', u'result': u'OK'}

              XML-RPC Example

                 >>> import xmlrpclib
                 >>> s = xmlrpclib.ServerProxy('http://localhost:6800/rpc')
                 >>> s.aria2.changeOption('2089b05ecca3d829', {'max-download-limit':'20K'})
                 'OK'

       aria2.getGlobalOption([secret])
              This  method  returns  the  global options.  The response is a struct. Its keys are the names of options.  Values are strings.  Note
              that this method does not return options which have no default value and have not been set on  the  command-line,  in  configuration
              files  or RPC methods. Because global options are used as a template for the options of newly added downloads, the response contains
              keys returned by the aria2.getOption() method.

       aria2.changeGlobalOption([secret], options)
              This method changes global options dynamically.  options is a struct.  The following options are available:

              · bt-max-open-files

              · download-result

              · keep-unfinished-download-result

              · log

              · log-level

              · max-concurrent-downloads

              · max-download-result

              · max-overall-download-limit

              · max-overall-upload-limit

              · optimize-concurrent-downloads

              · save-cookies

              · save-session

              · server-stat-of

              In addition, options listed in the Input File subsection are available, except for  following  options:  checksum,  index-out,  out,
              pause and select-file.

              With  the  log  option,  you  can  dynamically start logging or change log file. To stop logging, specify an empty string("") as the
              parameter value. Note that log file is always opened in append mode. This method returns OK for success.

       aria2.getGlobalStat([secret])
              This method returns global statistics such as the overall download and upload speeds. The response is a struct and contains the fol‐
              lowing keys. Values are strings.

              downloadSpeed
                     Overall download speed (byte/sec).

              uploadSpeed
                     Overall upload speed(byte/sec).

              numActive
                     The number of active downloads.

              numWaiting
                     The number of waiting downloads.

              numStopped
                     The number of stopped downloads in the current session. This value is capped by the --max-download-result option.

              numStoppedTotal
                     The number of stopped downloads in the current session and not capped by the --max-download-result option.

              JSON-RPC Example

                 >>> import urllib2, json
                 >>> from pprint import pprint
                 >>> jsonreq = json.dumps({'jsonrpc':'2.0', 'id':'qwer',
                 ...                       'method':'aria2.getGlobalStat'})
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> pprint(json.loads(c.read()))
                 {u'id': u'qwer',
                  u'jsonrpc': u'2.0',
                  u'result': {u'downloadSpeed': u'21846',
                              u'numActive': u'2',
                              u'numStopped': u'0',
                              u'numWaiting': u'0',
                              u'uploadSpeed': u'0'}}

              XML-RPC Example

                 >>> import xmlrpclib
                 >>> from pprint import pprint
                 >>> s = xmlrpclib.ServerProxy('http://localhost:6800/rpc')
                 >>> r = s.aria2.getGlobalStat()
                 >>> pprint(r)
                 {'downloadSpeed': '23136',
                  'numActive': '2',
                  'numStopped': '0',
                  'numWaiting': '0',
                  'uploadSpeed': '0'}

       aria2.purgeDownloadResult([secret])
              This method purges completed/error/removed downloads to free memory.  This method returns OK.

       aria2.removeDownloadResult([secret], gid)
              This method removes a completed/error/removed download denoted by gid from memory. This method returns OK for success.

              The following examples remove the download result of the download GID#2089b05ecca3d829.

              JSON-RPC Example

                 >>> import urllib2, json
                 >>> from pprint import pprint
                 >>> jsonreq = json.dumps({'jsonrpc':'2.0', 'id':'qwer',
                 ...                       'method':'aria2.removeDownloadResult',
                 ...                       'params':['2089b05ecca3d829']})
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> pprint(json.loads(c.read()))
                 {u'id': u'qwer', u'jsonrpc': u'2.0', u'result': u'OK'}

              XML-RPC Example

                 >>> import xmlrpclib
                 >>> s = xmlrpclib.ServerProxy('http://localhost:6800/rpc')
                 >>> s.aria2.removeDownloadResult('2089b05ecca3d829')
                 'OK'

       aria2.getVersion([secret])
              This method returns the version of aria2 and the list of enabled features. The response is a struct and contains following keys.

              version
                     Version number of aria2 as a string.

              enabledFeatures
                     List of enabled features. Each feature is given as a string.

              JSON-RPC Example

                 >>> import urllib2, json
                 >>> from pprint import pprint
                 >>> jsonreq = json.dumps({'jsonrpc':'2.0', 'id':'qwer',
                 ...                       'method':'aria2.getVersion'})
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> pprint(json.loads(c.read()))
                 {u'id': u'qwer',
                  u'jsonrpc': u'2.0',
                  u'result': {u'enabledFeatures': [u'Async DNS',
                                                   u'BitTorrent',
                                                   u'Firefox3 Cookie',
                                                   u'GZip',
                                                   u'HTTPS',
                                                   u'Message Digest',
                                                   u'Metalink',
                                                   u'XML-RPC'],
                              u'version': u'1.11.0'}}

              XML-RPC Example

                 >>> import xmlrpclib
                 >>> from pprint import pprint
                 >>> s = xmlrpclib.ServerProxy('http://localhost:6800/rpc')
                 >>> r = s.aria2.getVersion()
                 >>> pprint(r)
                 {'enabledFeatures': ['Async DNS',
                                      'BitTorrent',
                                      'Firefox3 Cookie',
                                      'GZip',
                                      'HTTPS',
                                      'Message Digest',
                                      'Metalink',
                                      'XML-RPC'],
                  'version': '1.11.0'}

       aria2.getSessionInfo([secret])
              This method returns session information.  The response is a struct and contains following key.

              sessionId
                     Session ID, which is generated each time when aria2 is invoked.

              JSON-RPC Example

                 >>> import urllib2, json
                 >>> from pprint import pprint
                 >>> jsonreq = json.dumps({'jsonrpc':'2.0', 'id':'qwer',
                 ...                       'method':'aria2.getSessionInfo'})
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> pprint(json.loads(c.read()))
                 {u'id': u'qwer',
                  u'jsonrpc': u'2.0',
                  u'result': {u'sessionId': u'cd6a3bc6a1de28eb5bfa181e5f6b916d44af31a9'}}

              XML-RPC Example

                 >>> import xmlrpclib
                 >>> s = xmlrpclib.ServerProxy('http://localhost:6800/rpc')
                 >>> s.aria2.getSessionInfo()
                 {'sessionId': 'cd6a3bc6a1de28eb5bfa181e5f6b916d44af31a9'}

       aria2.shutdown([secret])
              This method shuts down aria2.  This method returns OK.

       aria2.forceShutdown([secret])
              This method shuts down aria2(). This method behaves like :func:'aria2.shutdown` without performing any actions which take time, such
              as contacting BitTorrent trackers to unregister downloads first.  This method returns OK.

       aria2.saveSession([secret])
              This method saves the current session to a file specified by the --save-session option. This method returns OK if it succeeds.

       system.multicall(methods)
              This methods encapsulates multiple method calls in a single request.  methods is an array of structs.  The structs contain two keys:
              methodName  and  params.   methodName is the method name to call and params is array containing parameters to the method call.  This
              method returns an array of responses.  The elements will be either a one-item array containing the return value of the  method  call
              or a struct of fault element if an encapsulated method call fails.

              In the following examples, we add 2 downloads. The first one is http://example.org/file and the second one is file.torrent.

              JSON-RPC Example

                 >>> import urllib2, json, base64
                 >>> from pprint import pprint
                 >>> jsonreq = json.dumps({'jsonrpc':'2.0', 'id':'qwer',
                 ...                       'method':'system.multicall',
                 ...                       'params':[[{'methodName':'aria2.addUri',
                 ...                                   'params':[['http://example.org']]},
                 ...                                  {'methodName':'aria2.addTorrent',
                 ...                                   'params':[base64.b64encode(open('file.torrent').read())]}]]})
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> pprint(json.loads(c.read()))
                 {u'id': u'qwer', u'jsonrpc': u'2.0', u'result': [[u'2089b05ecca3d829'], [u'd2703803b52216d1']]}

              JSON-RPC additionally supports Batch requests as described in the JSON-RPC 2.0 Specification:

                 >>> jsonreq = json.dumps([{'jsonrpc':'2.0', 'id':'qwer',
                 ...                        'method':'aria2.addUri',
                 ...                        'params':[['http://example.org']]},
                 ...                       {'jsonrpc':'2.0', 'id':'asdf',
                 ...                        'method':'aria2.addTorrent',
                 ...                        'params':[base64.b64encode(open('file.torrent').read())]}])
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> pprint(json.loads(c.read()))
                 [{u'id': u'qwer', u'jsonrpc': u'2.0', u'result': u'2089b05ecca3d829'},
                  {u'id': u'asdf', u'jsonrpc': u'2.0', u'result': u'd2703803b52216d1'}]

              XML-RPC Example

                 >>> import xmlrpclib
                 >>> s = xmlrpclib.ServerProxy('http://localhost:6800/rpc')
                 >>> mc = xmlrpclib.MultiCall(s)
                 >>> mc.aria2.addUri(['http://example.org/file'])
                 >>> mc.aria2.addTorrent(xmlrpclib.Binary(open('file.torrent', mode='rb').read()))
                 >>> r = mc()
                 >>> tuple(r)
                 ('2089b05ecca3d829', 'd2703803b52216d1')

       system.listMethods()
              This  method returns all the available RPC methods in an array of string.  Unlike other methods, this method does not require secret
              token.  This is safe because this method just returns the available method names.

              JSON-RPC Example

                 >>> import urllib2, json
                 >>> from pprint import pprint
                 >>> jsonreq = json.dumps({'jsonrpc':'2.0', 'id':'qwer',
                 ...                       'method':'system.listMethods'})
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> pprint(json.loads(c.read()))
                 {u'id': u'qwer',
                  u'jsonrpc': u'2.0',
                  u'result': [u'aria2.addUri',
                              u'aria2.addTorrent',
                 ...

              XML-RPC Example

                 >>> import xmlrpclib
                 >>> s = xmlrpclib.ServerProxy('http://localhost:6800/rpc')
                 >>> s.system.listMethods()
                 ['aria2.addUri', 'aria2.addTorrent', ...

       system.listNotifications()
              This method returns all the available RPC notifications in an array of string.  Unlike other methods, this method does  not  require
              secret token.  This is safe because this method just returns the available notifications names.

              JSON-RPC Example

                 >>> import urllib2, json
                 >>> from pprint import pprint
                 >>> jsonreq = json.dumps({'jsonrpc':'2.0', 'id':'qwer',
                 ...                       'method':'system.listNotifications'})
                 >>> c = urllib2.urlopen('http://localhost:6800/jsonrpc', jsonreq)
                 >>> pprint(json.loads(c.read()))
                 {u'id': u'qwer',
                  u'jsonrpc': u'2.0',
                  u'result': [u'aria2.onDownloadStart',
                              u'aria2.onDownloadPause',
                 ...

              XML-RPC Example

                 >>> import xmlrpclib
                 >>> s = xmlrpclib.ServerProxy('http://localhost:6800/rpc')
                 >>> s.system.listNotifications()
                 ['aria2.onDownloadStart', 'aria2.onDownloadPause', ...

   Error Handling
       Over JSON-RPC, aria2 returns a JSON object which contains an error code in code and the error message in message.

       Over XML-RPC, aria2 returns faultCode=1 and the error message in faultString.

   Options
       The same options as for --input-file are available. See the Input File subsection for a complete list of options.

       In the option struct, the name element is the option name (without the preceding --) and the value element is the argument as a string.

   JSON-RPC Example
          {'split':'1', 'http-proxy':'http://proxy/'}

   XML-RPC Example
          <struct>
            <member>
              <name>split</name>
              <value><string>1</string></value>
            </member>
            <member>
              <name>http-proxy</name>
              <value><string>http://proxy/</string></value>
            </member>
          </struct>

       The  header and index-out options are allowed multiple times on the command-line. Since the name should be unique in a struct (many XML-RPC
       library implementations use a hash or dict for struct), a single string is not enough. To overcome this limitation, you may use an array as
       the value as well as a string.

   JSON-RPC Example
          {'header':['Accept-Language: ja', 'Accept-Charset: utf-8']}

   XML-RPC Example
          <struct>
            <member>
              <name>header</name>
              <value>
                <array>
                  <data>
                    <value><string>Accept-Language: ja</string></value>
                    <value><string>Accept-Charset: utf-8</string></value>
                  </data>
                </array>
              </value>
            </member>
          </struct>

       The following example adds a download with two options: dir and header.  The header option requires two values, so it uses a list:

          >>> import xmlrpclib
          >>> s = xmlrpclib.ServerProxy('http://localhost:6800/rpc')
          >>> opts = dict(dir='/tmp',
          ...             header=['Accept-Language: ja',
          ...                     'Accept-Charset: utf-8'])
          >>> s.aria2.addUri(['http://example.org/file'], opts)
          '1'

   JSON-RPC using HTTP GET
       The  JSON-RPC interface also supports requests via HTTP GET.  The encoding scheme in GET parameters is based on JSON-RPC over HTTP Specifi‐
       cation [2008-1-15(RC1)].  The encoding of GET parameters are follows:

          /jsonrpc?method=METHOD_NAME&id=ID&params=BASE64_ENCODED_PARAMS

       The method and id are always treated as JSON string and their encoding must be UTF-8.

       For example, The encoded string of aria2.tellStatus('2089b05ecca3d829') with id='foo' looks like this:

          /jsonrpc?method=aria2.tellStatus&id=foo&params=WyIyMDg5YjA1ZWNjYTNkODI5Il0%3D

       The params parameter is Base64-encoded JSON array which usually appears in params attribute in JSON-RPC request object.  In the above exam‐
       ple, the params is ["2089b05ecca3d829"], therefore:

          ["2089b05ecca3d829"] --(Base64)--> WyIyMDg5YjA1ZWNjYTNkODI5Il0=
                       --(Percent Encode)--> WyIyMDg5YjA1ZWNjYTNkODI5Il0%3D

       The JSON-RPC interface also supports JSONP. You can specify the callback function in the jsoncallback parameter:

          /jsonrpc?method=aria2.tellStatus&id=foo&params=WyIyMDg5YjA1ZWNjYTNkODI5Il0%3D&jsoncallback=cb

       For  Batch  requests, the method and id parameters must not be specified.  The whole request must be specified in the params parameter. For
       example, a Batch request:

          [{'jsonrpc':'2.0', 'id':'qwer', 'method':'aria2.getVersion'},
           {'jsonrpc':'2.0', 'id':'asdf', 'method':'aria2.tellActive'}]

       must be encoded like this:

          /jsonrpc?params=W3sianNvbnJwYyI6ICIyLjAiLCAiaWQiOiAicXdlciIsICJtZXRob2QiOiAiYXJpYTIuZ2V0VmVyc2lvbiJ9LCB7Impzb25ycGMiOiAiMi4wIiwgImlkIjogImFzZGYiLCAibWV0aG9kIjogImFyaWEyLnRlbGxBY3RpdmUifV0%3D

   JSON-RPC over WebSocket
       JSON-RPC over WebSocket uses same method signatures and response format as JSON-RPC over HTTP. The supported WebSocket version is 13  which
       is detailed in RFC 6455.

       To  send a RPC request to the RPC server, send a serialized JSON string in a Text frame. The response from the RPC server is delivered also
       in a Text frame.

   Notifications
       The RPC server might send notifications to the client. Notifications is unidirectional, therefore the client which receives  the  notifica‐
       tion must not respond to it. The method signature of a notification is much like a normal method request but lacks the id key. The value of
       the params key is the data which this notification carries. The format of the value varies depending on the notification method.  Following
       notification methods are defined.

       aria2.onDownloadStart(event)
              This  notification  will be sent when a download is started.  The event is of type struct and it contains following keys.  The value
              type is string.

              gid    GID of the download.

       aria2.onDownloadPause(event)
              This  notification  will  be  sent  when  a  download  is  paused.   The  event  is  the  same  struct  as  the  event  argument  of
              aria2.onDownloadStart() method.

       aria2.onDownloadStop(event)
              This  notification  will  be  sent  when  a  download is stopped by the user.  The event is the same struct as the event argument of
              aria2.onDownloadStart() method.

       aria2.onDownloadComplete(event)
              This notification will be sent when a download is complete.  For BitTorrent downloads, this notification is sent when  the  download
              is complete and seeding is over. The event is the same struct of the event argument of aria2.onDownloadStart() method.

       aria2.onDownloadError(event)
              This  notification  will  be sent when a download is stopped due to an error.  The event is the same struct as the event argument of
              aria2.onDownloadStart() method.

       aria2.onBtDownloadComplete(event)
              This notification will be sent when a torrent download is complete but seeding is still going on.  The event is the same  struct  as
              the event argument of aria2.onDownloadStart() method.

   Sample XML-RPC Client Code
       The  following Ruby script adds http://localhost/aria2.tar.bz2 to aria2c (running on localhost) with option --dir=/downloads and prints the
       RPC response:

          #!/usr/bin/env ruby

          require 'xmlrpc/client'
          require 'pp'

          client=XMLRPC::Client.new2("http://localhost:6800/rpc")

          options={ "dir" => "/downloads" }
          result=client.call("aria2.addUri", [ "http://localhost/aria2.tar.bz2" ], options)

          pp result

       If you are a Python lover, you can use xmlrpclib (Python3 uses xmlrpc.client instead) to interact with aria2:

          import xmlrpclib
          from pprint import pprint

          s = xmlrpclib.ServerProxy("http://localhost:6800/rpc")
          r = s.aria2.addUri(["http://localhost/aria2.tar.bz2"], {"dir":"/downloads"})
          pprint(r)

MISC
   Console Readout
       While downloading files, aria2 prints a readout to the console to show the progress of the downloads. The console readout looks like this:

          [#2089b0 400.0KiB/33.2MiB(1%) CN:1 DL:115.7KiB ETA:4m51s]

       This section describes what these numbers and strings mean.

       #NNNNNN
              The first 6 characters of the GID as a hex string. The GID is an unique ID for each download, internal to aria2. The GID is particu‐
              larly useful when interacting with aria2 using the RPC interface.

       X/Y(Z%)
              Completed length, the total file length and its progress. If --select-file is used, this is the sum of selected files.

       SEED   Share ratio when the aria2 is seeding a finished torrent.

       CN     The number of connections aria2 has established.

       SD     The number of seeders aria2 is connected to.

       DL     Download speed (bytes per second).

       UL     Upload speed (bytes per second) and the number of uploaded bytes.

       ETA    Expected time to finish the download.

       When  more  than one download is in progress, some of the information described above will be omitted in order to show information for sev‐
       eral downloads. And the overall download and upload speeds are shown at the beginning of the line.

       When aria2 is allocating file space or validating checksums, it additionally prints the progress of these operations:

       FileAlloc
              GID, already allocated length and total length in bytes.

       Checksum
              GID, already validated length and total length in bytes.

EXAMPLE
   HTTP/FTP Segmented Downloads
   Download a file
          $ aria2c "http://host/file.zip"

       NOTE:
          To stop a download, press Ctrl-C. You can resume the transfer by running aria2c with the same argument in the same  directory.  You  can
          change URIs as long as they are pointing to the same file.

   Download a file from two different HTTP servers
          $ aria2c "http://host/file.zip" "http://mirror/file.zip"

   Download a file from one host using multiple connections
          $ aria2c -x2 -k1M "http://host/file.zip"

       NOTE:
          The -x option specified the number of allowed connections, while the -k option specified the size of chunks.

   Download a file from HTTP and FTP servers at the same time
          $ aria2c "http://host1/file.zip" "ftp://host2/file.zip"

   Download files listed in a text file concurrently
          $ aria2c -ifiles.txt -j2

       NOTE:
          -j option specifies the number of parallel downloads.

   Using a proxy
       For HTTP:

          $ aria2c --http-proxy="http://proxy:8080" "http://host/file"

          $ aria2c --http-proxy="http://proxy:8080" --no-proxy="localhost,127.0.0.1,192.168.0.0/16" "http://host/file"

       For FTP:

          $ aria2c --ftp-proxy="http://proxy:8080" "ftp://host/file"

       NOTE:
          See  --http-proxy,  --https-proxy,  --ftp-proxy, --all-proxy and --no-proxy for details.  You can specify proxy in the environment vari‐
          ables. See ENVIRONMENT section.

   Using a Proxy with authorization
          $ aria2c --http-proxy="http://username:password@proxy:8080" "http://host/file"

          $ aria2c --http-proxy="http://proxy:8080" --http-proxy-user="username" --http-proxy-passwd="password" "http://host/file"

   Metalink Download
   Download files with remote Metalink
          $ aria2c --follow-metalink=mem "http://host/file.metalink"

   Download using a local metalink file
          $ aria2c -p --lowest-speed-limit=4000 file.metalink

       NOTE:
          To stop a download, press Ctrl-C.  You can resume the transfer by running aria2c with the same argument in the same directory.

   Download several local metalink files
          $ aria2c -j2 file1.metalink file2.metalink

   Download only selected files
          $ aria2c --select-file=1-4,8 file.metalink

       NOTE:
          The index is printed to the console using -S option.

   Download a file using a local metalink file with user preference
          $ aria2c --metalink-location=jp,us --metalink-version=1.1 --metalink-language=en-US file.metalink

   BitTorrent Download
   Download files using a remote BitTorrent file
          $ aria2c --follow-torrent=mem "http://host/file.torrent"

   Download using a local torrent file
          $ aria2c --max-upload-limit=40K file.torrent

       NOTE:
          --max-upload-limit specifies the max of upload rate.

       NOTE:
          To stop a download, press Ctrl-C. You can resume the transfer later by running aria2c with the same argument in the same directory.

   Download using BitTorrent Magnet URI
          $ aria2c "magnet:?xt=urn:btih:248D0A1CD08284299DE78D5C1ED359BB46717D8C&dn=aria2"

       NOTE:
          Don't forget to quote BitTorrent Magnet URIs which include & characters with single(') or double(") quotes when specifying URIs  on  the
          command-line.

   Download 2 torrents
          $ aria2c -j2 file1.torrent file2.torrent

   Download a file via torrent and HTTP/FTP server in parallel
          $ aria2c -Ttest.torrent "http://host1/file" "ftp://host2/file"

   Only download specific files (usually called selected download )
          $ aria2c --select-file=1-4,8 file.torrent

       NOTE:
          The index is printed to the console using -S option.

   Download a .torrent file, but do not download the torrent
          $ aria2c --follow-torrent=false "http://host/file.torrent"

   Specify the output file name
       To  specify  the output file name for BitTorrent downloads, you need to know the index of file in the torrent (see --show-files). For exam‐
       ple, the output looks like this:

          idx|path/length
          ===+======================
            1|dist/base-2.6.18.iso
             |99.9MiB
          ---+----------------------
            2|dist/driver-2.6.18.iso
             |169.0MiB
          ---+----------------------

       To save 'dist/base-2.6.18.iso' in '/tmp/mydir/base.iso' and 'dist/driver-2.6.18.iso' in '/tmp/dir/driver.iso', use the following command:

          $ aria2c --dir=/tmp --index-out=1=mydir/base.iso --index-out=2=dir/driver.iso file.torrent

   Change the listening ports for incoming peer connections
          $ aria2c --listen-port=7000-7001,8000 file.torrent

       NOTE:
          Since aria2 doesn't configure firewalls or routers for port forwarding, it's up to you to do so manually.

   Specify conditions to stop seeding after torrent downloads finish
          $ aria2c --seed-time=120 --seed-ratio=1.0 file.torrent

       NOTE:
          In the above example, the program stops seeding after 120 minutes since download completed or seed ratio reaches 1.0.

   Throttle upload speed
          $ aria2c --max-upload-limit=100K file.torrent

   Enable IPv4 DHT
          $ aria2c --enable-dht --dht-listen-port=6881 file.torrent

       NOTE:
          DHT uses UDP. Since aria2 doesn't configure firewalls or routers for port forwarding, it's up to you to do it manually.

   Enable IPv6 DHT
          $ aria2c --enable-dht6 --dht-listen-port=6881 --dht-listen-addr6=YOUR_GLOBAL_UNICAST_IPV6_ADDR

       NOTE:
          aria2 uses the same ports as IPv4 for IPv6.

   Add and remove tracker URIs
       Ignore all tracker announce URIs defined in file.torrent and use http://tracker1/announce and http://tracker2/announce instead:

          $ aria2c --bt-exclude-tracker="*" --bt-tracker="http://tracker1/announce,http://tracker2/announce" file.torrent

   More advanced HTTP features
   Load cookies
          $ aria2c --load-cookies=cookies.txt "http://host/file.zip"

       NOTE:
          You can use Firefox/Mozilla/Chromium's cookie files without modification.

   Resume download started by web browsers or other programs
          $ aria2c -c -s2 "http://host/partiallydownloadedfile.zip"

       NOTE:
          This will only work when the initial download was not multi-segmented.

   Client certificate authorization for SSL/TLS
       Specify a PKCS12 file as follows:

          $ aria2c --certificate=/path/to/mycert.p12

       NOTE:
          The file specified in --certificate must be contain one PKCS12 encoded certificate and key. The password must be blank.

       Alternatively, if PEM files are supported, use a command like the following:

          $ aria2c --certificate=/path/to/mycert.pem --private-key=/path/to/mykey.pem https://host/file

       NOTE:
          The file specified in --private-key must be decrypted. The behavior when encrypted one is given is undefined.

   Verify SSL/TLS servers using given CA certificates
          $ aria2c --ca-certificate=/path/to/ca-certificates.crt --check-certificate https://host/file

       NOTE:
          This option is only available when aria2 was compiled against GnuTLS or OpenSSL.  WinTLS and AppleTLS will always use  the  system  cer‐
          tificate store. Instead of `--ca-certificate install the certificate in that store.

   RPC
   Encrypt RPC traffic with SSL/TLS
       Specify a server PKC12 file:

          $ aria2c --enable-rpc --rpc-certificate=/path/to/server.p12 --rpc-secure

       NOTE:
          The file specified in --rpc-certificate must be contain one PKCS12 encoded certificate and key. The password must be blank.

       Alternatively, when PEM files are supported (GnuTLS and OpenSSL), specify the server certificate file and private key file as follows:

          $ aria2c --enable-rpc --rpc-certificate=/path/to/server.crt --rpc-private-key=/path/to/server.key --rpc-secure

   And more advanced features
   Throttle the download speed
       Per-download:

          $ aria2c --max-download-limit=100K file.metalink

       Overall:

          $ aria2c --max-overall-download-limit=100K file.metalink

   Repair a damaged download
          $ aria2c -V file.metalink

       NOTE:
          Repairing damaged downloads can be done efficiently when used with BitTorrent or Metalink with chunk checksums.

   Drop connections if download speed is lower than a specified limit
          $ aria2c --lowest-speed-limit=10K file.metalink

   Parameterized URI support
       You can specify set of parts:

          $ aria2c -P "http://{host1,host2,host3}/file.iso"

       You can specify numeric sequence:

          $ aria2c -Z -P "http://host/image[000-100].png"

       NOTE:
          The -Z option is required if the URIs don't point to the same file, such as in the above example.

       You can specify step counter:

          $ aria2c -Z -P "http://host/image[A-Z:2].png"

   Verifying checksums
          $ aria2c --checksum=sha-1=0192ba11326fe2298c8cb4de616f4d4140213837 http://example.org/file

   Parallel downloads of an arbitrary number of URIs, metalink, torrent
          $ aria2c -j3 -Z "http://host/file1" file2.torrent file3.metalink

   BitTorrent Encryption
       Encrypt the whole payload using ARC4 (obfuscation):

          $ aria2c --bt-min-crypto-level=arc4 --bt-require-crypto=true file.torrent

SEE ALSO
       Project Web Site: https://aria2.github.io/

       Metalink Homepage: http://www.metalinker.org/

       The Metalink Download Description Format: RFC 5854

COPYRIGHT
       Copyright (C) 2006, 2015 Tatsuhiro Tsujikawa

       This  program  is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY  WARRANTY;  without  even  the  implied  warranty  of  MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

       You  should  have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation,
       Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

       In addition, as a special exception, the copyright holders give permission to link the code of portions of this program  with  the  OpenSSL
       library  under  certain  conditions as described in each individual source file, and distribute linked combinations including the two.  You
       must obey the GNU General Public License in all respects for all of the code used other than OpenSSL.  If  you  modify  file(s)  with  this
       exception,  you may extend this exception to your version of the file(s), but you are not obligated to do so.  If you do not wish to do so,
       delete this exception statement from your version.  If you delete this exception statement from all source files in the program, then  also
       delete it here.

1.34.0                                                             June 22, 2019                                                         ARIA2C(1)
