TRANSMISSION-GTK(1)                                                                   BSD General Commands Manual                                                                  TRANSMISSION-GTK(1)

NAME
     transmission-gtk — a bittorrent client

SYNOPSIS
     transmission-gtk -?
     transmission-gtk [-pqm] [torrent-file ...]

DESCRIPTION
     transmission-gtk is a fast and easy BitTorrent client.

     BitTorrent is a peer-to-peer file transfer protocol which uses a metainfo file (usually with the .torrent file extension) and a central tracker to distribute file data amongst a group of peers.
     For more information on the BitTorrent protocol see http://www.bittorrent.org/

OPTIONS
     -? --help
             Show help options

     -p --paused
             Start with all torrents paused

     -m --minimized
             Start minimized in notification area

     -g, --config-dir directory
             Where to look for configuration files. This can be used to swap between using the cli, daemon, gtk, and qt clients.  See http://trac.transmissionbt.com/wiki/ConfigFiles for more infor‐
             mation.

     Multiple .torrent files may be added at startup by appending them on the command line.  If transmission-gtk is already running, the torrents will be added to the running instance.

ENVIRONMENT
     TRANSMISSION_HOME
                 Sets the default config-dir.

     http_proxy  libcurl uses this environment variable when performing tracker announces. If set, this overrides the GNOME proxy preferences.

FILES
     ~/.config/transmission
             The config-dir used when neither [TRANSMISSION_HOME] nor [-g] is specified.

AUTHORS
     transmission-gtk was written by Jordan Lee, Josh Elsasser, Eric Petit, and Mitchell Livingston.

SEE ALSO
     transmission-create(1), transmission-daemon(1), transmission-edit(1), transmission-gtk(1), transmission-qt(1), transmission-remote(1), transmission-show(1)

     http://www.transmissionbt.com/

BSD                                                                                          May 20, 2008                                                                                          BSD
