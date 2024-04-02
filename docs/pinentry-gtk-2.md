PINENTRY-GTK-2(1)                                             General Commands Manual                                            PINENTRY-GTK-2(1)

NAME
       pinentry-gtk-2 - PIN or pass-phrase entry dialog for GnuPG

SYNOPSIS
       pinentry-gtk-2 [OPTION...]

DESCRIPTION
       pinentry-gtk-2 is a program that allows for secure entry of PINs or pass phrases.  That means it tries to take care that the entered infor‐
       mation is not swapped to disk or temporarily stored anywhere.  This functionality is particularly useful for  entering  pass  phrases  when
       using encryption software such as GnuPG or e-mail clients using the same.  It uses an open protocol and is therefore not tied to particular
       software.

       pinentry-gtk-2 implements a PIN entry dialog using the GTK+ tool kit version 2, so it is especially suitable for users of GNOME.  If the  X
       Window  System  is  not active then an alternative text-mode dialog will be used.  There are other flavors that implement PIN entry dialogs
       using other tool kits.

       pinentry-gtk-2 is typically used internally by gpg-agent.  Users don't normally have a reason to call it directly.

OPTIONS
       --version
              Print the program version and licensing information.

       --help Print a usage message summarizing the most useful command-line options.

       --debug, -d
              Turn on some debugging.  Mostly useful for the maintainers.  Note that this may reveal sensitive information like the  entered  pass
              phrase.

       --enhanced, -e
              Ask for timeouts and insurance, too.  Note that this is currently not fully supported.

       --no-global-grab, -g
              Grab  the  keyboard  only when the window is focused.  Use this option if you are debugging software using pinentry-gtk-2; otherwise
              you may not be able to to access your X session anymore (unless you have other means to  connect  to  the  machine  to  kill  pinen‐
              try-gtk-2).

       --parent-wid N
              Use window ID N as the parent window for positioning the window.  Note, that this is not fully supported by all flavors of pinentry.

       --display STRING, --ttyname STRING, --ttytype STRING, --lc-type STRING, --lc-messages STRING
              These  options  are  used  to  pass localization information to pinentry-gtk-2.  They are required because pinentry-gtk-2 is usually
              called by some background process which does not have any information on the locale and terminal to use.   Assuan  protocol  options
              are an alternative way to pass these information.

SEE ALSO
       pinentry-curses(1), pinentry-qt(1), pinentry-gnome3(1), pinentry-tty(1), gpg(1), gpg-agent(1)

       The full documentation for pinentry-gtk-2 is maintained as a Texinfo manual.  If the pinentry-doc package is installed, the command

              info pinentry

       should give you access to the complete manual.

AUTHOR
       This manual page was written by Peter Eisentraut for the Debian project.

                                                                    27 Jan 2005                                                  PINENTRY-GTK-2(1)
