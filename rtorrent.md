RTORRENT(1)                                                                                                                            RTORRENT(1)

NAME
       rtorrent - a BitTorrent client for ncurses

SYNOPSIS
       rtorrent [ -h ] [ -n ] [ -o key1=opt1,... ] [ -O key=opt ] [ URL | FILE ... ]

DESCRIPTION
       rtorrent  is a BitTorrent client for ncurses, using the libtorrent library. The client and library is written in C++ with emphasis on speed
       and efficiency, while delivering equivalent features to those found in GUI based clients in an ncurses client.

       Most of the options below have their own default unit in addition to supporting B, K, M and G suffixes.

KEYBOARD CONTROL
   GLOBAL KEYS
       ^q     Initiate shutdown, press again to force the shutdown and skip sending the stop signal to trackers.

       up | down | left | right arrow keys

       ^P | ^N | ^B | ^F
              Select entries or change windows. The right arrow key or ^F is often used for viewing details about the selected  entry,  while  the
              left arrow key or ^B often returns to the previous screen.

       a | s | d
              Increase the upload throttle by 1/5/50 KB.

       A | S | D
              Increase the download throttle by 1/5/50 KB.

       z | x | c
              Decrease the upload throttle by 1/5/50 KB.

       Z | X | C
              Decrease the download throttle by 1/5/50 KB.

   MAIN VIEW KEYS
       ->     View download.

       1 - 7  Change view.

       ^S     Start download.

       ^D     Stop an active download, or remove a stopped download.

       ^K     Close a torrent and its files.

       ^E     Set  the  'create/resize  queued'  flags on all files in a torrent. This is necessary if the underlying files in a torrent have been
              deleted or truncated, and thus rtorrent must recreate them.

       ^R     Initiate hash check of torrent.

       ^O     Change the destination directory of the download. The torrent must be closed.

       ^X     Call commands or change settings.

       ^B     Set download to perform initial seeding. Only use when you are the first and only seeder so far for the download.

       + | -  Change the priority of the download.

       backspace
              Add torrent using an URL or file path. Use tab to view directory content and do auto-complete.

       l      View log. Exit by pressing the space-bar.

       U      Delete the file the torrent is tied to, and clear the association.

       I      Toggle whether torrent ignores ratio settings.

   DOWNLOAD VIEW KEYS
       ->     View torrent file list. Use the space-bar to change the file priority and * to change the priority of all files. Use /  to  collapse
              the directories. OUTDATED

       1 | 2  Adjust max uploads.

       3 | 4  Adjust min peers.

       5 | 6  Adjust max peers.

       u      Display transferring blocks.

       i      Display chunk rarity.

       o      Display the tracker list. Cycle the trackers in a group with the space-bar.

       p      View peer and torrent information.

       t | T  Initiate tracker request. Use capital T to force the request, ignoring the "min interval" set by the tracker.

       k      Disconnect peer.

       *      Choke/Snub peer.

OPTIONS
       -b a.b.c.d
              Bind listening socket and outgoing connections to this network interface address.

       -d directory
              Set the default download directory. Defaults to "./".

       -h     Display help and exit.

       -i a.b.c.d
              Set the address reported to the tracker.

       -n     Don't load ~/.rtorrent.rc on startup.

       -o key1=opt1,...

       -O key=opt
              Set  any  number  of  options, see the SETTINGS section. The options given here override the resource files. Use capital -O to allow
              comma in the option.

       -p a-b Try to open a listening port in the range a up to and including b.

       -s directory
              Session management will be enabled and the torrent files for all open downloads will be stored in this directory. Only one  instance
              of  rtorrent  should  be used with each session directory, though at the moment no locking is done. An empty string will disable the
              session directory.

GENERAL SETTINGS
       bind = a.b.c.d
              Bind listening socket and outgoing connections to this network interface address.

       ip = a.b.c.d

       ip = hostname
              Set the address reported to the tracker.

       port_range = a-b
              Try to open a listening port in the range a up to and including b.

       port_random = yes | no
              Open the listening port at a random position in the port range.

       check_hash = yes | no
              Perform hash check on torrents that have finished downloading.

       directory = directory
              Set the default download directory. Defaults to "./".

       session = directory
              Session management will be enabled and the torrent files for all open downloads will be stored in this directory. Only one  instance
              of rtorrent can be used per session directory. An empty string will disable the session directory.

       http_proxy = url
              Use a http proxy. Use an empty string to disable.

       encoding_list = encoding
              Add a preferred filename encoding to the list. The encodings are attempted in the order they are inserted, if none match the torrent
              default is used.

       encryption = option,...
              Set how rtorrent should deal with encrypted Bittorrent connections. By default, encryption is disabled, equivalent to specifying the
              option none. Alternatively, any number of the following options may be specified:

              allow_incoming  (allow  incoming  encrypted  connections),  try_outgoing (use encryption for outgoing connections), require (disable
              unencrypted handshakes), require_RC4 (also disable plaintext transmission after the initial encrypted handshake),  enable_retry  (if
              the  initial outgoing connection fails, retry with encryption turned on if it was off or off if it was on), prefer_plaintext (choose
              plaintext when peer offers a choice between plaintext transmission and RC4 encryption, otherwise RC4 will be used).

       peer_exchange = yes | no
              Enable/disable peer exchange for torrents that aren't marked private. Disabled by default.

       start_tied =
              Start torrents that are tied to filenames that have been re-added.

       stop_untied =

       close_untied =

       remove_untied =
              Stop, close or remove the torrents that are tied to filenames that have been deleted. Clear the association with the 'U' key.

       close_low_diskspace = space
              Close any active torrents on filesystems with less than space diskspace left. Use with the  schedule  option.  A  default  scheduled
              event with id low_diskspace is set to 500Mb.

       load = file

       load_verbose = file

       load_start = file

       load_start_verbose = file
              Load  and  possibly start a file, or possibly multiple files by using the wild-card "*". This is meant for use with schedule, though
              ensure that the start is non-zero. The loaded file will be tied to the filename provided.

       import = file

       try_import = file
              Load a resource file. try_import does not throw torrent::input_error exception on bad input.

THROTTLE SETTINGS
       upload_rate = KB

       download_rate = KB

       set_upload_rate = TODO

       set_download_rate = TODO
              Set the maximum global uploand and download rates.

       min_peers = value

       max_peers = value
              Set the minimum and maximum number of peers to allow in each download.

       min_peers_seed = value

       max_peers_seed = value
              Set the minimum nad maximum number of peers to allow while seeding, or -1 (default) to use max_peers.

       max_uploads = value

       max_downloads = value

       min_uploads = value

       min_downloads = value
              Set the maximum/minimum number of simultaneous uploads/downloads per download/upload.

       max_uploads_div = value

       max_downloads_div = value

       set_max_uploads_div = value

       set_max_downloads_div = value
              Change the divider used to calculate the max upload and download slots to use when the throttle is changed. Disable by setting 0.

       max_uploads_global = value

       max_downloads_global = value

       set_max_uploads_global = value

       set_max_downloads_global = value
              Max upload and download slots allowed. Disable by setting 0.

       throttle_up = name, upload_rate

       throttle_down = name, download_rate
              Define secondary throttle and/or set the given upload or download rate. Attach to a download with the d.set_throttle_name=name  com‐
              mand  or  switch throttles with Ctrl-T. Download must be stopped when changing throttles. Note that secondary throttles only work if
              the global upload/download is throttled. Setting a download to use the NULL throttle makes the download unthrottled even when  there
              is  a  global throttle. Note that this special case bypasses the global throttle entirely, and as such its rate and transfer amounts
              are not included in the global statistics.

       throttle_ip = name, host

       throttle_ip = name, network/prefix

       throttle_ip = name, start, end
              Use the given secondary throttle for a host, CIDR network or IP range. All peers with a matching IP will use this  throttle  instead
              of the global throttle or a custom download throttle. The name may be NULL to make these peers unthrottled, with the same caveats as
              explained above.

TRACKER RELATED SETTINGS
       Tracker related settings.

       enable_trackers = yes
              Set to no to disable all tracker requests. Useful for disabling rtorrent with the schedule command.

       tracker_dump = filename
              Dump tracker requests to filename, disable by supplying an empty string. Only torrents loaded while  tracker_dump  contains  a  non-
              empty string will be logged at the moment, although disabling it will work as expected.

       tracker_numwant = number
              Set the numwant field sent to the tracker, which indicates how many peers we want. A negative value disables this feature.

       use_udp_trackers = yes
              Use UDP trackers. Disable if you are behind a firewall, etc, that does not allow connections to UDP trackers.

       http_capath = path

       http_cacert = filename
              Set the certificates to use in http requests. See Curl's CURLOPT_CAPATH and CURLOPT_CAINFO options for further information.

DHT-RELATED SETTINGS
       Settings related to DHT

       dht = disabled|off|auto|on
              Support  for  querying the distributed hash table (DHT) to find peers for trackerless torrents or when all trackers are down. Set to
              disable to completely disable DHT, off (default) to enable DHT but to not start the DHT server, auto to automatically start and stop
              the  DHT server as needed or on for permanently keeping the DHT server running.  When set to automatic, the DHT server will start up
              when the first non-private torrent is started, and will stop 15-30 minutes after the last non-private torrent is  stopped  (or  when
              rTorrent quits). For DHT to work, a session directory must be set (for saving the DHT cache).

       dht_port = number
              Set the UDP listen port for DHT. Defaults to 6881.

       dht_add_node = host[:port]
              Not intended for use in the configuration file but as one-time option in the client or on the command line to bootstrap an empty DHT
              node table. Contacts the given node and attempts to bootstrap from it if it replies.  The port is optional,  with  port  6881  being
              used by default.

       dht_statistics = TODO
              TODO

       set_dht_port = TODO
              TODO

       set_dht_throttle = TODO
              TODO

USER-INTERFACE SETTINGS
       Display related settings.

       view_add = name
              Create a new view.

       view_sort = name

       view_sort = name,seconds
              Sort  a  view according the the criteria set by view_sort_current. If the optional argument is supplied, the view is not sorted if a
              change happened during the last seconds. This command is meant to be used with schedule.

       view_sort_new = name,...

       view_sort_current = name,...
              Set the sorting criteria for when new elements inserted or view_sort is called. The list can contain any number of criteria, includ‐
              ing zero, from the following:

              name, name_reverse, stopped, started, complete, incomplete, state_changed, state_changed_reverse

       key_layout = qwerty|azerty|qwertz|dvorak
              Change the key-bindings.

FILE-SYSTEM SETTINGS
       File-system related settings.

       max_file_size = size
              Set the maximum size a file can have. Disable by passing -1.

       split_file_size = size
              Split files in a torrent larger than size into separate files. Disable by passing -1.

       split_suffix = string
              Set the suffix used on split files. Defaults to .part.

DOWNLOAD SETTINGS
       Settings that require a download as a target, the options need to be called through f.ex on_finished.

       create_link = type,path,suffix

       delete_link = type,path,suffix
              Create or delete a symbolic link. The link path is the concatenation of path, the result of the type on the download, and suffix.

              Available  types  are; base_path uses the base path of the download, base_filename uses the base filename of the download, tied uses
              the path of the file the download is tied to, see start_tied.

ADVANCED SETTINGS
       This list contains settings users shouldn't need to touch, some may even cause crashes or similar if incorrectly set.

       hash_read_ahead = MB
              Configure how far ahead we ask the kernel to read when doing hash checking. The hash checker uses  madvise(...,  MADV_WILLNEED)  for
              the requests.

       hash_interval = ms
              Interval between attempts to check the hash when the chunk is not in memory, in milliseconds.

       hash_max_tries = tries
              Number  of  attempts to check the hash while using the mincore status, before forcing. Overworked systems might need lower values to
              get a decent hash checking rate.

       safe_sync = yes|no
              Always use MS_SYNC rather than MS_ASYNC when syncing chunks. This may be nessesary in case of filesystem  bugs  like  NFS  in  linux
              ~2.6.13.

       max_open_files = value
              Number  of  files to simultaneously keep open. LibTorrent dynamically opens and closes files as necessary when mapping files to mem‐
              ory. Default is based on sysconf(_SC_OPEN_MAX).  You probably only think you know what this option does, so don't touch it.

       max_open_sockets = value
              Number of network sockets to simultaneously keep open. This value is set to a reasonable value based on sysconf(_SC_OPEN_MAX).

       max_open_http = value
              Number of sockets to simultaneously keep open. This value is set to 32 by default.

       max_memory_usage = bytes
              Set the max amount of memory space used to mapping file chunks. This may also be set using ulimit -m where 3/4 will be allocated  to
              file chunks.

       send_buffer_size = value

       receive_buffer_size = value
              Adjust the send and receive buffer size for socket.

       umask = 0022
              Set the umask for this process, which is applied to all files created by the program.

       cwd = directory
              Changes the working directory of the process using chdir.

       session_on_completion = yes
              Controls if the session torrent is saved when a torrent finishes. By default on.

       session_lock = yes
              Controls if a lock file is created in the session directory on startup.

       session_save =
              Save the session files for all downloads.

       tos = default|lowdelay|throughput|reliability|mincost

       tos = hex
              Change  the  TOS  of  peer connections, by default set to throughput. If the option is set to default then the system default TOS is
              used. A hex value may be used for non-standard settings.

       handshake_log = yes
              Enable logging of the peer handshake. This generates a large number of log messages, but may be useful to debug connection problems.

AUTHORS
       Jari "Rakshasa" Sundell <jaris@ifi.uio.no>

BitTorrent client for ncurses                                    25 February 2015                                                      RTORRENT(1)
