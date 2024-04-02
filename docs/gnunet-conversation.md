GNUNET-CONVERSATION(1)                 General Commands Manual                 GNUNET-CONVERSATION(1)

NAME
       gnunet-conversation - have a conversation with your peers

SYNOPSIS
       gnunet-conversation -e NAME [OPTIONS] URI

DESCRIPTION
       gnunet-conversation  can be used to have a conversation with other GNUnet users.  You can make
       calls and receive incoming calls.  You need to setup an ego using gnunet-identity first.   For
       others to be able to call you, you must add a PHONE record to your zone in the GNU Name System
       (using gnunet-namestore).  gnunet-conversation has an interactive help system  via  the  /help
       command.

OPTIONS
       -c FILENAME,  --config=FILENAME
              Use the configuration file FILENAME.

       -e NAME,  --ego=NAME
              Specifies  the  NAME  of the ego to use (for caller ID) and the GNS master zone for our
              own lookups.

       -h, --help
              Print short help on options.

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Use LOGLEVEL for logging.  Valid values are DEBUG, INFO, WARNING and ERROR.

       -p LINE,  --phone=LINE
              Optional argument that can be used to specify the phone LINE to be used with  the  con‐
              versation service.  The default LINE is zero, which should be fine for most users.

       -v, --version
              Print GNUnet version number.

BUGS
       Report  bugs  by  using  Mantis  <https://gnunet.org/bugs/>  or  by sending electronic mail to
       <gnunet-developers@gnu.org>

SEE ALSO
       gnunet-identity(1), gnunet-namestore(1), gnunet-gns(1)

GNUnet                                       Oct 5, 2013                       GNUNET-CONVERSATION(1)
