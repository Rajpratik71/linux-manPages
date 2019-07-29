WIREFILTER(1)                                                 General Commands Manual                                                WIREFILTER(1)

NAME
       wirefilter - Wire packet filter for Virtual Distributed Ethernet

SYNOPSIS
       wirefilter

       [-f  rcfile]  [-l  loss]  [-l lostburst] [-d delay] [-D dup] [-b bandwidth] [-s interface_speed] [-c channel_bufsize] [-n noise_factor] [-m
       mtu_size] [-M mgmt socket] [-v vde_plug1:vde_plug2] [--daemon] [--pidfile pidfile_path] [--blink blink] [--blinkid blink_identifier] [-N]

DESCRIPTION
       A wirefilter is able to emulate delays and packet loss on virtual wires.  e.g.:

       dpipe vde_plug /tmp/s1 = wirefilter -l 10 = vde_plug /tmp/s2

       creates a wire between two vde_switches (with sockets /tmp/s1 and /tmp/s2 respectively). This cable looses  10%  of  the  packets  in  each
       direction.

       The same cable can be created using:

       wirefilter -v /tmp/s1:/tmp/s2 -l 10

OPTIONS
       -f rcfile
              use  a  startup  configuration  file. It is useful for complex defitions such as those for the Markov mode (see below).  The startup
              configuration file has the same syntax of the management interface, in other word it is a script  of  management  commands  executed
              before the first packet is forwarded.

       -l loss
              percentage  of  loss  as  a  floating point number. It is possible to specify different loss percentage for the two channels: LR20.5
              means 20.5% of packet flowing left to right are lost, RL10 means 10% from right to left.

       -L lostburst
              when this is not zero, wirefilter uses the Gilbert model for bursty errors.  This is the mean length of lost packet bursts. (it is a
              two  state  Markov chain: the probability to exit from the faulty state is 1/lostburst, the probability to enter the faulty state is
              loss/(lostburst-(1-loss)). The loss rate converges to the value loss.

       -d delay
              Extra delay (in milliseconds). This delay is added to the real communication delay.  Packets are temporarily stored and resent after
              the  delay.   It  is possible to specify different values for LR and RL like in the previous option.  When the delay is specified as
              two numbers with a + in between, the first is the standard delay and the second is a random  variation.   1000+500  means  that  the
              delay  can be randomly chosen between half second and 1.5 seconds. It is possible to add 'U' or 'N' at the end. 1000+500U means that
              the dealys are uniformly distributed, 1000+500N means that the delays follow a Gaussian normal distribution (more than  98%  of  the
              values are inside the limits).

       -D dup percentage  of  dup packet. It has the same syntax of -l. Do not use dup factor 100% because it means that each packet is sent infi‐
              nite times.

       -b bandwidth
              Channel bandwidth in Bytes/sec. It has the same syntax of -d. It is also possible to use suffixes K,M,G to  abbreviate  2^10,  2^20,
              2^30.   128K  means  128KBytes/sec.  128+64K  means 64i to 196KBytes/sec.  Sender is not prevented from sending packets, delivery is
              delayed to limit the bandwidth to the desired value. (Like a bottleneck along the path) U and N after the values (e.g. 128+64KN) set
              the statistic distribution to use (uniform or normal).

       -s speed
              Interface  speed in Bytes/sec. It has the same syntax of -b. Input is blocked for the tramission time of the packet, thus the sender
              is prevented from sending too fast.

       -c channel_bufsize
              Channel buffer size (in Bytes): maximum size of the packet queue. Exceeding packets are discarded.

       -n noise factor
              Number of bits damaged/one megabyte.

       -m mtu size
              Packets longer than mtu_size are discarded.

       -N     nofifo. with -N packets can be reordered.

       -M mgmt socket
              the unix socket where the parameters (loss percentage, delay etc) can be checked and changed runtime. unixterm(1) can be used  as  a
              remote terminal for wirefilter.

       -v vde_plug1:vde_plug2
              If  this  option  is  used,  the two local vde_plugs (vde_plug1 and vde_plug2) will be connected each other instead of stdin/stdout,
              using the libvdeplug libraries. This option activates an interactive management session on console (stdin/stdout).

       --mgmtmode mode
              this option sets the access mode of the mgmt socket.  The command syntax is quite simple. help provides the list of commands.  It is
              possible to load a script file using the load management command.

       --daemon
              wirefilter becomes a daemon

       --pidfile pathnamefP
              wirefilter saves its pid into the  file.

       --blinkid name
              This  option  defines the id sent for each packet to the blink server (see the --blink option below).  The stardard identifier for a
              wirefilter is the process pid.

       --blink socket
              wirefilter sends a log message to the specified PF_UNIX/DATAGRAM socket for each packet sent. Each packet has the format: id  direc‐
              tion length.  e.g:

                  6768 LR 44
                  6768 LR 44
                  6768 RL 100
                  6768 LR 100
                  6768 LR 44

Markov mode
       wirefilter  provides also a more complex set of parameters using a Markov chain to emulate different states of the link and the tranistions
       between states. Each state is represented by a node.  Markov chain parameters can be set with management commands or  rc  files  only.   In
       fact, due to the large number of parameters the command line would have been unreadable.

       markov-numnodes n
              defines  the number of different states. All the parameters of the connection can be defined node by node. Nodes are numbered start‐
              ing from zero (to n-1).  e.g.:

                                                      delay 100+10N[4]
                                                      loss 10[2]

              these command define a delay of 90-110 ms (normal distribution) for the node number 4 and a 10 loss for the node 2.  It is  possible
              to resize the Markov chain at run-time.  New nodes are unreachable and do not have any edge to other states (i.e.  each new node has
              a loopback edge to the node itself with 100% probability).  When reducing the number of nodes,  the  weight  of  the  edges  towards
              deleted  nodes  is  added  to the loopback edge. When the current node of the emulation is deleted, node 0 becomes the current node.
              (The emulation always starts from node 0).

       markov-time ms
              time period (ms) for the markov chain computation. Each ms microseconds a random number generator decides which is  the  next  state
              (default value=100ms).

       markov-name n,name
              assign a name to a node of the markov chain.

       markov-setnode n
              manually set the current node to the node n.

       setedge n1,n2,w
              define  an  edge between n1 and n2; w is the weight (probability percentage) of the edge.  The loopback edge (from a node to itself)
              is always computed as 100% minus the sum of the weights of outgoing edges.

       showedges [ n ]
              list the edges from node n (or from the current node when the command has no parameters). Null weight edges are omitted.

       showcurrent
              show the current Markov state.

       showinfo [ n ]
              show status and information on state (node)  n.  If the parameter is omitted it shows the status  and  information  on  the  current
              state.

       markov-debug [ n ]
              set  the debug level for the current management connection.  In the actual implementation when n is greater than zero each change of
              markov node causes the output of a debug trace.  Debug tracing get disabled when n is zero or the parameter is missing.

NOTICE
       Virtual Distributed Ethernet is not related in any way with www.vde.com ("Verband der Elektrotechnik, Elektronik  und  Informationstechnik"
       i.e. the German "Association for Electrical, Electronic & Information Technologies").

SEE ALSO
       vde_switch(1), vdeq(1).  dpipe(1).  unixterm(1).

AUTHOR
       VDE is a project by Renzo Davoli <renzo@cs.unibo.it>

Virtual Distributed Ethernet                                     December 6, 2006                                                    WIREFILTER(1)
