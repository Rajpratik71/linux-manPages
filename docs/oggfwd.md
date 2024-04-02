OGGFWD(1)                                                   BSD General Commands Manual                                                  OGGFWD(1)

NAME
     oggfwd — pipe an Ogg stream from stdin to an Icecast server

SYNOPSIS
     oggfwd [-hp] [-d description] [-g genre] [-n name] [-u URL] address port password mountpoint

DESCRIPTION
     The oggfwd utility acts as a minimal source client for Icecast servers.  It reads an Ogg stream from stdin and forwards it to a server speci‐
     fied on the command line.

     The address, port, password and mountpoint arguments are mandatory and have to be given in that order.

   Optional command line parameters
     -d description
             Set the stream description.

     -g genre
             Set the stream genre.

     -h      Print a short usage summay.

     -n name
             Set the stream (i.e. radio) name.

     -p      Allow the stream to be made public in stream directories.

     -u URL  Set the stream URL.

     oggfwd reacts to the hangup signal, SIGHUP, by printing the amount of bytes read from stdin to stdout at the next given opportunity.  How
     fast it reacts depends on the stream's current bitrate.

EXAMPLES
     To forward a public Ogg stream with the name “Test radio” to an Icecast server, one would pipe that stream to an oggfwd command line such as

         oggfwd -p -n "Test radio" radio.example.com 8000 password /stream.ogg

     Encode an Ogg Vorbis stream, dump it to disk and stream it at the same time:

         oggenc - < input.wav | tee streamdump.ogg \
             | oggfwd radio.example.com 8000 password /stream.ogg

AUTHORS
     Programming by
           J^ <j@v2v.cc>
           rafael2k <rafael@riseup.net>
           Moritz Grimm <gtgbr@gmx.net>

     This manual was contributed by Moritz Grimm.

CAVEATS
     Since the password to the Icecast server is given in clear text on the command line, other (local) users will probably be able to see it very
     easily.

BSD                                                                July 30, 2006                                                               BSD
