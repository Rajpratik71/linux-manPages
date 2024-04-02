aconnect(1)                                                                             General Commands Manual                                                                            aconnect(1)

NAME
       aconnect - ALSA sequencer connection manager

SYNOPSIS
       aconnect [-d] [-options] sender receiver
       aconnect -i|-o [-options]
       aconnect -x

DESCRIPTION
       aconnect is a utility to connect and disconnect two existing ports on ALSA sequencer system.  The ports with the arbitrary subscription permission, such as created by aseqview(1), can be con‐
       nected to any (MIDI) device ports using aconnect.  For example, to connect from port 64:0 to 65:0, run as follows:

           % aconnect 64:0 65:0

       The connection is one-way, and the whole data to the sender port (64:0) is redirected to the receiver port (65:0).  When another port (e.g. 65:1) is attached to the same sender port, the data
       is sent to both receiver ports.  For disconnection, use -d option.

       % aconnect -d 64:0 65:0

       The address can be given using the client's name.

       % aconnect External:0 Emu8000:1

       Then the port 0 of the client matching with the string "External" is connected to the port 1 of the client matching with the "Emu8000".

       Another function of aconnect is to list the present ports on the given condition.  The input ports, which may become sender ports, can be listed with -i option.

       % aconnect -i
       client 0: 'System' [type=kernel]
           0 'Timer           '
           1 'Announce        '
       client 64: 'External MIDI-0' [type=kernel]
           0 'MIDI 0-0        '

       Similarly, to see the output ports, use -o flag.

       You  can remove all existing exported connections using -x option.  This function is useful for terminating the ALSA drivers, because the modules with sequencer connections cannot be unloaded
       unless their connections are removed.

OPTIONS
   CONNECTION MANAGEMENT
       -d, --disconnect
              Disconnect the given subscription.

       -e, --exclusive
              Connect ports with exclusive mode.  Both sender and receiver ports can be no longer connected by any other ports.

       -r, --real queue
              Convert time-stamps of event packets to the current value of the given real-time queue.  This is option is, however, not so useful, since the receiver port must  use  (not  necessarily
              own) the specified queue.

       -t, --tick queue
              Like -r option, but time-stamps are converted to the current value of the given tick queue.

   LIST PORTS
       -i, --input
              List existing input (readable) ports.  This option is exclusive to -o.

       -o, --output
              List existing output (writable) ports.  This option is exclusive to -i.

       -l, --list
              List the current connection status.  The connected and connecting ports from/to each port are listed together.  The suffix flag [ex] means the connection is exclusive.  The suffix flag
              [real:#] and [tick:#] mean the connection includes real-time and tick conversion on the listed queue, respectively.

   REMOVE ALL CONNECTIONS
       -x, --removeall
              Remove all exported connections.

SEE ALSO
       aseqnet(1), aseqview(1)

AUTHOR
       Takashi Iwai <tiwai@suse.de>

                                                                                            August 31, 2000                                                                                aconnect(1)
