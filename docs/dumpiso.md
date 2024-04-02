dumpiso(1)                                                                                     Linux IEEE 1394                                                                                     dumpiso(1)



NAME
       dumpiso - dump IEEE 1394 isochronous channel packets

SYNOPSIS
       dumpiso [ options ] [ FILE ]

DESCRIPTION
       dumpiso  listens  on  a  selected  range of channels and dumps all received packets into the file FILE or, if not given, to standard output.  While dumping, the current number of received packets is
       written to standard error and updated with every packet.

       It uses a simple file format for the dumps which is described in isodump(5).  The dumped packets can be sent out again with sendiso(1).

OPTIONS
       -c, --channels=CHANNELS
              Sets the channels to listen on.  CHANNELS can be either a single number, in which case this is the only channel to listen on, or a range of channels in the  form  X-Y.   Channel  numbers  can
              range from 0 to 63.  You can give this option multiple times, new channels are added to the list of already set channels.  Defaults to all channels.

       -p, --port=PORT
              Choose port PORT for receiving.  A port is a 1394 card or chip and represents one connected bus, therefore this is only relevant when you have multiple of these.  Defaults to 0.

       -h, --help
              Show help text and exit.

BUGS
       None known.

SEE ALSO
       sendiso(1), isodump(5)

AUTHOR
       Andreas Bombe <aeb@debian.org>



                                                                                               libraw1394 2.1.0                                                                                    dumpiso(1)
