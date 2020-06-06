PINENTRY-GNOME3(1)                                                                       General Commands Manual                                                                       PINENTRY-GNOME3(1)

NAME
       pinentry-gnome3 - PIN or pass-phrase entry dialog for GnuPG

SYNOPSIS
       pinentry-gnome3 [OPTION...]

DESCRIPTION
       pinentry-gnome3  is  a  program  that allows for secure entry of PINs or pass phrases.  That means it tries to take care that the entered information is not swapped to disk or temporarily stored
       anywhere.  This functionality is particularly useful for entering pass phrases when using encryption software such as GnuPG or e-mail clients using the same.  It uses an  open  protocol  and  is
       therefore not tied to particular software.

       pinentry-gnome3  implements  a  PIN entry dialog based on GNOME 3, which aims to follow the GNOME Human Interface Guidelines as closely as possible.  If the X Window System is not active then an
       alternative text-mode dialog will be used.  There are other flavors that implement PIN entry dialogs using other tool kits.

       pinentry-gnome3 is typically used internally by gpg-agent.  Users don't normally have a reason to call it directly.

OPTIONS
       --version
              Print the program version and licensing information.

       --help Print a usage message summarizing the most useful command-line options.

       --debug, -d
              Turn on some debugging.  Mostly useful for the maintainers.  Note that this may reveal sensitive information like the entered pass phrase.

       --enhanced, -e
              Ask for timeouts and insurance, too.  Note that this is currently not fully supported.

       --no-global-grab, -g
              Grab the keyboard only when the window is focused.  Use this option if you are debugging software using pinentry-gnome3; otherwise you may not be able to to access your X session  anymore
              (unless you have other means to connect to the machine to kill pinentry-gnome3).

       --parent-wid N
              Use window ID N as the parent window for positioning the window.  Note, that this is not fully supported by all flavors of pinentry.

       --display STRING, --ttyname STRING, --ttytype STRING, --lc-type STRING, --lc-messages STRING
              These options are used to pass localization information to pinentry-gnome3.  They are required because pinentry-gnome3 is usually called by some background process which does not have any
              information on the locale and terminal to use.  Assuan protocol options are an alternative way to pass these information.

SEE ALSO
       pinentry-curses(1), pinentry-gtk-2(1), pinentry-qt(1), pinentry-tty(1), gpg(1), gpg-agent(1)

       The full documentation for pinentry-gnome3 is maintained as a Texinfo manual.  If the pinentry-doc package is installed, the command

              info pinentry

       should give you access to the complete manual.

AUTHOR
       This manual page was written by Daniel Kahn Gillmor for the Debian project, adapted from other pinentry manual pages written by Peter Eisentraut.

                                                                                               01 Jun 2015                                                                             PINENTRY-GNOME3(1)
