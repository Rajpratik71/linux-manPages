GNUNET-CONVERSATION-TEST(1)            General Commands Manual            GNUNET-CONVERSATION-TEST(1)

NAME
       gnunet-conversation-test - check your speaker and microphone settings

SYNOPSIS
       gnunet-conversation-test [OPTIONS] URI

DESCRIPTION
       gnunet-conversation-test  can  be used to check your speaker and microphone settings.  It will
       record you for five seconds and then play the recording back to you.  If this fails, you might
       want  to use the pavucontrol tool to check which microphone or speaker were assigned to GNUnet
       by PulseAudio (you may have more than one set of microphones or speakers known  to  your  com‐
       puter).

       You can use gnunet-conversation-test without having a peer running on your computer.

OPTIONS
       -c FILENAME,  --config=FILENAME
              Use the configuration file FILENAME.

       -h, --help
              Print short help on options.

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Use LOGLEVEL for logging.  Valid values are DEBUG, INFO, WARNING and ERROR.

       -v, --version
              Print GNUnet version number.

BUGS
       Report  bugs  by  using  Mantis  <https://gnunet.org/bugs/>  or  by sending electronic mail to
       <gnunet-developers@gnu.org>

SEE ALSO
       gnunet-conversation(1)

GNUnet                                       Oct 30, 2013                 GNUNET-CONVERSATION-TEST(1)
