aseqnet(1)                                                                              General Commands Manual                                                                             aseqnet(1)

NAME
       aseqnet - ALSA sequencer connectors over network

SYNOPSIS
       aseqnet [remotehost]

DESCRIPTION
       aseqnet  is an ALSA sequencer client which sends and receives event packets over network.  Suppose two hosts connected by network, hostA as a server and hostB as a client.  The ALSA sequencer
       system must be running on both hosts.  For creating the server port, run the following on hostA:

           hostA% aseqnet
           sequencer opened: 128:0

       Then a user client 128 with port 0 was opened on hostA.  (The client number may vary.)  For creating the (network-)client port, run aseqnet with the hostname of the server:

           hostB% aseqnet hostA
           sequencer opened: 132:0

       Now all events sent to hostA:128:0 are transferred to hostB:132:0, and vice versa.

       The ports created by aseqnet can be connected arbitrary to other sequencer ports via aconnect(1).  For example, to connect hostB:132:0 to a MIDI output device 65:0:

           hostB% aconnect 132:0 65:0

       Then events to hostA:128:0 will be delivered to hostB:65:0.  The following command plays MIDI on hostB.

           hostA% pmidi -p 128:0 foo.mid

       The multiple clients may exist simultaneously.  If hostC is connected as a client to hostA, events from from hostA are sent to all connected network clients, i.e. hostB and  hostC.   However,
       only one connection is allowed from a client to a server.

       To disconnect network, stop all clients before server by ctrl-C or sending signal to them.  The server will automatically quit.

OPTIONS
       -p port
              Specify the TCP port number or TCP service name.

       -s addr
              Subscribe to the given address for read automatically.

       -d addr
              Subscribe to the given address for write automatically.

       -v     Verbose mode.

SEE ALSO
       aconnect(1), pmidi(1)

AUTHOR
       Takashi Iwai <tiwai@suse.de>.

                                                                                            January 1, 2000                                                                                 aseqnet(1)
