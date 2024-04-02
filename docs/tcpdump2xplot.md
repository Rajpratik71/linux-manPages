TCPDUMP2XPLOT(1)                                            BSD General Commands Manual                                           TCPDUMP2XPLOT(1)

NAME
     tcpdump2xplot — converts tcpdump output to xplot input for analysis

SYNOPSIS
     tcpdump2xplot [-?] [-c] [-help] [-list[filename]] [-plot[filename]] [-q] [-r] [-s] [-t] [-w]

DESCRIPTION
     tcpdump2xplot takes the output of
           tcpdump -tt -S ...
     and plots it in terms of sequence-number versus time, with other info displayed (e.g., the TCP window, acks, etc.).

OPTIONS
     -?, -help prints a help message.  -c, ``cumulative'', adds all the data coming from a server.  -list[filename] prints the list of generated
     plot files to filename.  -plot[filename] plots the packets from filename. The filename may be built out of a hostname and port number, e.g.:
     abc.def.com:1234. The default is
           fromhost:fromport-tohost:toport.xplot
     where fromhost, fromport, thost, toport are extracted as conversations from the tcpdump data.  -q means "quiet" --- no visible output.  -r
     means use relative sequence numbers.  -s means break up conversations on TCP syns.  -t convert time to decimal number of seconds.  -w plots
     the TCP window.

EXAMPLES
SEE ALSO
     tcpdump(1), xplot.org(1)

BUGS
     tcpdump2xplot may not deal properly with output from tcpdump that is not TCP.  Either filter to only tcp or be careful.

HISTORY
     The tcpdump2xplot has been contributed by xplot.org users.  Thanks to Garret Wollman for contributing the original tcpdump2xplot.pl script
     and thanks to Eric Prud'hommeaux (@ w3.org) for making <http://www.w3.org/pub/WWW/config/tcpdump2xplot.pl> available, a much improved ver‐
     sion.  The one included here is a slightly improved version of Eric's.

BSD                                                               27 January 1999                                                              BSD
