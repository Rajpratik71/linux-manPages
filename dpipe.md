DPIPE(1)                                                                                 General Commands Manual                                                                                 DPIPE(1)

NAME
       dpipe - bi-directional pipe command

SYNOPSIS
       dpipe [ command [ args ] ] = [ command [ args ] ]
       dpipe [ command [ args ] ] = [ command [ args ] ] [ = [ command [ args ] ] ] ...

DESCRIPTION
       dpipe  is a general tool to run two commands diverting the standard output of the first command into the standard input of the second and vice-versa.  It is the bi-directional extension of the |
       (pipe) syntax used by all the shells.  The = has been chosen as a metaphor of two parallel communication lines between the commands.  It is also possible to concatenate several tools. Intermedi‐
       ate  programs communicate using standard input and standard output with the preceding tool and alternate standard input and output (respectively file descriptors number 3 and 4) towards the fol‐
       lowing tool.  If an intermediate tool should process only the data flowing in one direction use { or } as suffix for the preceding = and prefix of the following one.
       This tool has been written as a tool for the Virtual Distributed Ethernet.

EXAMPLE
       dpipe a = b
       processes a and b are bidirectionally connected: stdin of a is connected to stdout of b and vice-versa
       dpipe a = b = c
       a and b are connected as above. Alternate stdin of b is connected to stdout of c and alternate stdout of b to stdin of c
       dpipe a =} b }= c
       This is a cycle of pipes: stdout of a is connected to stdin of b, stdout of b with stdin of c, and stdout of c to stdin of a
       dpipe a =} b }={ c {= d = e
       all the notations can be mixed together.  this is a -> b -> d -> c and back to a; alternate ports of d are connected to e

OPTIONS
       no options.

NOTICE
       Virtual Distributed Ethernet is not related in any way with www.vde.com ("Verband der Elektrotechnik, Elektronik und Informationstechnik" i.e. the German "Association for Electrical,  Electronic
       & Information Technologies").

SEE ALSO
       vde_switch(1), vde_plug(1), vde_plug2tap(1), vdeq(1).  wirefilter(1).

AUTHOR
       VDE is a project by Renzo Davoli <renzo@cs.unibo.it>.

Virtual Distributed Ethernet                                                                 December 6, 2006                                                                                    DPIPE(1)
