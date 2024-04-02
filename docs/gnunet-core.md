gnunet-core(1)                         General Commands Manual                         gnunet-core(1)

NAME
       gnunet-core - measure and control the core subsystem

SYNOPSIS
       gnunet-core [OPTIONS]

DESCRIPTION
       gnunet-core  is  a  tool  to access various functions of GNUnet's core subsystem from the com‐
       mand-line.  The only function right now is to list the peers that are  directly  connected  to
       this peer (with successful cryptographic handshake).

       -c FILENAME, --config=FILENAME
              configuration file to use

       -h, --help
              print help page

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Change the loglevel.  Possible values for LOGLEVEL are ERROR, WARNING, INFO and DEBUG.

       -v, --version
              print the version number

       -V, --verbose
              be verbose

NOTES
REPORTING BUGS
       Report  bugs  by  using  mantis  <https://gnunet.org/bugs/>  or  by sending electronic mail to
       <gnunet-developers@gnu.org>

SEE ALSO
       gnunet-transport(1)

GNUnet                                        1 Apr 2012                               gnunet-core(1)
