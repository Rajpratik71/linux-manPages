GNUNET-IDENTITY(1)                     General Commands Manual                     GNUNET-IDENTITY(1)

NAME
       gnunet-identity - create, delete or list egos

SYNOPSIS
       gnunet-identity [options]

DESCRIPTION
       gnunet-identity is a tool for managing egos.  An ego is the persona that controls a namespace.
       It is identical to a public-private ECC key pair.

       gnunet-identity can be used to list all of the egos that were created locally, to  create  new
       egos, and to delete existing egos (the namespace will continue to exist, but it will be impos‐
       sible to add additional data to it).

       Creating a new ego requires using the -C option together with an identifier (name) that is  to
       be  used  for  the new ego.  This identifier is only used locally for this peer and not shared
       with other peers.

       -C NAME, --create=NAME
              Creates a new ego with the given NAME.

       -D NAME, --delete=NAME
              Delete the ego with the given NAME.

       -e NAME, --ego=NAME
              Perform "set" operation with the respective ego.  Needs to be used together with option
              -s.

       -h, --help
              Print help page.

       -d, --display
              display all ouf our egos

       -m, --monitor
              run  in  monitor  mode,  listing  all ouf our egos until CTRL-C is pressed. Each ego is
              listed together with a unique pointer value; if egos are renamed,  that  pointer  value
              remains  the  same;  if  egos are deleted, they are listed one more time with a name of
              "<null>".

       -s SUBSYSTEM, --set=SUBSYSTEM
              Perform "set" operation for the specified SUBSYSTEM with the respective ego.  Needs  to
              be used together with option -e.  After this, the given SUBSYSTEM will use the ego with
              the specified NAME.  This will fail if NAME does not yet exist.

FILES
       ~/.gnunet/egos/
              Directory where the egos are stored (by default)

REPORTING BUGS
       Report bugs by using Mantis  <https://gnunet.org/bugs/>  or  by  sending  electronic  mail  to
       <gnunet-developers@gnu.org>

SEE ALSO
       gnunet-gns(1),  gnunet-namestore(1)

GNUnet                                        5 Sep 2013                           GNUNET-IDENTITY(1)
