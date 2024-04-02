GNUNET-IDENTITY-GTK(1)                 General Commands Manual                 GNUNET-IDENTITY-GTK(1)

NAME
       gnunet-identity-gtk - a gtk interface for managing egos

SYNOPSIS
       gnunet-identity-gtk [OPTIONS]

DESCRIPTION
       gnunet-identity-gtk  is  a gtk+ based GUI for managing your egos.  Egos are used in GNUnet for
       zones in the GNU name system and for namespaces in file-sharing.  There might  be  other  uses
       for  egos in the future.  An ego is essentially a private key which represents a pseudonym (or
       alter ego) of a user.  A user can performs actions under an ego that can be  related  back  to
       the respective pseudonym (public key of the ego).

       -h, --help
              print help page

       -c FILENAME, --config=FILENAME
              load config file (default: ~/.config/gnunet.conf)

       -t, --tray
              start with main window minimized (only put icon in tray)

       -v, --version
              print the version number

FILES
       ~/.config/gnunet.conf
              User's GNUnet configuration file

REPORTING BUGS
       Report  bugs  by  using  mantis  <https://gnunet.org/bugs/>  or  by sending electronic mail to
       <gnunet-developers@gnu.org>

SEE ALSO
       gnunet-identity(1)

GNUnet                                       15 Sep 2013                       GNUNET-IDENTITY-GTK(1)
