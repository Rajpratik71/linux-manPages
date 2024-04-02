UNWORKABLE(1)                                               BSD General Commands Manual                                              UNWORKABLE(1)

NAME
     unworkable — download files via BitTorrent

SYNOPSIS
     unworkable [-s] [-g port] [-p port] [-t tracefile] torrent

DESCRIPTION
     The unworkable program is used to download files via the BitTorrent protocol.

     When unworkable is executed with a valid .torrent file as an argument, it will proceed to announce to the tracker, connect to peers and down‐
     load the data.  Upon completion of the download, the program will exit, unless seed-mode is enabled.

     -g port
             If specified, run the GUI control server on port port.  By default, no GUI control server will run.

     -p port
             If specified, listen for incoming BitTorrent peer connections on port.  By default, unworkable does not accept incoming connections.

     -s      Enable seed-mode, that is, keep running and seed after download is complete.

     -t tracefile
             Trace execution, outputting to tracefile.

AUTHORS
     The unworkable program was written by Niall O'Higgins.

BSD                                                               October 4, 2008                                                              BSD
